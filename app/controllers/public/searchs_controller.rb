class Public::SearchsController < ApplicationController
  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      User.where(['name LIKE ?', "%#{content}%"]).where.not(id: current_user.id)
    # 選択したモデルがstudy_timeだったら
    elsif model == 'study_time'
      StudyTime.where(['study_method LIKE ?', "%#{content}%"])
    end
  end
end
