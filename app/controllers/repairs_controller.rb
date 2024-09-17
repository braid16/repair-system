class RepairsController < ApplicationController
    def index
      @repairs = Repair.all
    end
  
    def new
      @repair = Repair.new
    end
  
    # app/controllers/repairs_controller.rb
    def create
      @repair = Repair.new(repair_params)
      @user = User.find_or_initialize_by(phone_number: @repair.phone_number)
    
      if @user.new_record?
        @user.password = '123456' # 默认密码
        @user.password_confirmation = '123456'
        unless @user.save
          Rails.logger.debug "User save failed: #{@user.errors.full_messages}"
          flash.now[:alert] = "用户创建失败: #{@user.errors.full_messages.join(', ')}"
          render :new, status: :unprocessable_entity
          return
        end
        sign_in(@user) # 自动登录新创建的用户
      end
    
      @repair.user = @user
    
      if @repair.save
        Rails.logger.debug "Repair saved successfully: #{@repair.inspect}"
        redirect_to @repair, notice: '报修信息已成功创建。'
      else
        Rails.logger.debug "Repair save failed: #{@repair.errors.full_messages}"
        flash.now[:alert] = "报修创建失败: #{@repair.errors.full_messages.join(', ')}"
        render :new, status: :unprocessable_entity
      end
    end

  
    def show
      @repair = Repair.find(params[:id])
    end
  
    private
  
    def repair_params
      params.require(:repair).permit(:name, :phone_number, :organization, :content, :status, :repair_time)
    end
  end