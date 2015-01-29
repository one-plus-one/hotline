class CustomerQuestion < ActiveRecord::Base
  belongs_to :work_order
  def save(params,work_order_id)
    self.title = params[:title]
    self.answer = params[:answer]
    self.note = params[:note]
    self.work_order_id = work_order_id
    self.save!
  end

  def self.add_column_names(sheet,index)
    sheet[0,index]='问题'
    sheet[0,index+1]='答案'
    sheet[0,index+2]='备注'
  end

  def self.add_column_value(sheet,index_x,index_y,work_order_id)
    customer_question=self.find_by_work_order_id(work_order_id)
    if customer_question!=nil
      sheet[index_x,index_y]=customer_question.title
      sheet[index_x,index_y+1]=customer_question.answer
      sheet[index_x,index_y+2]=customer_question.note
    end
  end
end
