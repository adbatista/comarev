class UserInvoicerJob < ActiveJob::Base
  queue_as :default

  DUE_DATE_LIMIT = 3.days

  # FIXME gerar invoice; terminar o email e adicionar conteudo; adicionar teste

  def perform
    Invoice.about_expire(DUE_DATE_LIMIT).each do |invoice|
      generate_invoice! # TBD
      InvoiceMailer.notify_user(invoice.user).deliver_later
    end
  end
end
