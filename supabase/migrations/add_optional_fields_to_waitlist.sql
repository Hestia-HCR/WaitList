-- Migration: Ajouter des champs optionnels à la table waitlist
-- Date: 2024

-- Ajouter les colonnes optionnelles pour le formulaire étendu
ALTER TABLE waitlist
ADD COLUMN IF NOT EXISTS first_name TEXT,
ADD COLUMN IF NOT EXISTS last_name TEXT,
ADD COLUMN IF NOT EXISTS phone TEXT,
ADD COLUMN IF NOT EXISTS linkedin_url TEXT;

-- Ajouter des commentaires pour documenter les colonnes
COMMENT ON COLUMN waitlist.first_name IS 'Prénom de l''utilisateur (optionnel)';
COMMENT ON COLUMN waitlist.last_name IS 'Nom de l''utilisateur (optionnel)';
COMMENT ON COLUMN waitlist.phone IS 'Numéro de téléphone de l''utilisateur (optionnel)';
COMMENT ON COLUMN waitlist.linkedin_url IS 'URL du profil LinkedIn de l''utilisateur (optionnel)';

