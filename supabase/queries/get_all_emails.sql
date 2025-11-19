-- Récupérer toutes les adresses email de la liste d'attente
-- Trié par date d'inscription (les plus récents en premier)

SELECT 
  id,
  email,
  created_at,
  source
FROM waitlist
ORDER BY created_at DESC;

-- Statistiques
SELECT 
  COUNT(*) as total_inscriptions,
  COUNT(DISTINCT email) as emails_uniques,
  MIN(created_at) as premiere_inscription,
  MAX(created_at) as derniere_inscription
FROM waitlist;

-- Récupérer uniquement les emails (format simple pour export)
SELECT email 
FROM waitlist 
ORDER BY created_at DESC;

-- Récupérer les emails par source
SELECT 
  source,
  COUNT(*) as nombre,
  array_agg(email ORDER BY created_at DESC) as emails
FROM waitlist
GROUP BY source
ORDER BY nombre DESC;

