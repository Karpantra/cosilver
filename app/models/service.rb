class Service < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :provider
  has_many :availabilities, dependent: :destroy


  validates :category, presence: true
  validates :title, presence: true
  validates :price_per_hour, presence: true
  validates :address, presence: true


  SOUS_CATEGORIES = ["Babysitting et nounous", "Cours particuliers et coaching", "Nettoyage, repassage et cuisine", "Animaux", "Réparations et dépannage", "Bricolage et jardinage", "Courses et livraison", "Déménagement", "Transport, co-voiturage", "Prestations web, design, photo", "Mode, beauté, bien-être", "Prestations administratives", "Sports, loisirs et évènements", "Informations et conseils"]
end
