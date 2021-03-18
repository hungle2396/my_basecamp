class AttachmentsController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
        render "_attachments"
    end

    def create
        @project = Project.find(params[:project_id])
        if params[:project] != nil
<<<<<<< HEAD
            @project.uploads.attach(project_params[:uploads])
=======
            @project.uploads.attach(params[:project][:uploads])
>>>>>>> d6f9d40ac6001530483baf38e65cf4dbe10e1c82
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
<<<<<<< HEAD

    private

    def project_params
        
        params.require(:project).permit(uploads: [])
    end
=======
>>>>>>> d6f9d40ac6001530483baf38e65cf4dbe10e1c82
  end