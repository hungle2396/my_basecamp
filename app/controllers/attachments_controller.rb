class AttachmentsController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
        render "_attachments"
    end

    def create
        @project = Project.find(params[:project_id])
        if params[:project] != nil
            @project.uploads.attach(project_params[:uploads])
            @project.save()
        else
            flash[:alert] = "Please choose a file before submit!"
        end
        redirect_to project_attachments_path
    end

    def destroy
        @project = Project.find(params[:project_id])
        @upload = ActiveStorage::Attachment.find(params[:attachment_id])
        @upload.purge
        redirect_to project_attachments_path
    end

    private

    def project_params
        
        params.require(:project).permit(uploads: [])
    end
  end