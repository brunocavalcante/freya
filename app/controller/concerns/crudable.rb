module Crudable
  extend ActiveSupport::Concern

  included do
    respond_to :html

    before_action :load_resource, except: [:index, :new, :create]
  end

  def new
    @resource = new_resource
  end

  def show
    render 'edit'
  end

  def create
    @resource = new_resource resource_params
    respond_to do |format|
      if @resource.save
        flash[:success] = "<b>#{@resource}</b> created successfully."

        format.js { render 'shared/select_add_create', status: :ok }
      else
        format.js { render :new, layout: false, status: :unprocessable_entity }
      end

      format.html { respond_with @resource, location: after_create_path }
    end
  end

  def update
    flash[:success] = "<b>#{@resource}</b> updated successfully." if @resource.update resource_params

    respond_with @resource, location: after_update_path
  end

  def destroy
    flash[:success] = "<b>#{@resource}</b> deleted successfully." if @resource.destroy

    respond_with @resource, location: after_destroy_path
  end

  protected

  def after_create_path
    {action: :index}
  end

  def after_update_path
    {action: :index}
  end

  def after_destroy_path
    {action: :index}
  end
end
