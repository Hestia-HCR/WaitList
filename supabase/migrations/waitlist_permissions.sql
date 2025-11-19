
-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can insert their email" ON waitlist;
DROP POLICY IF EXISTS "Authenticated users can view waitlist" ON waitlist;

-- Create new policy for INSERT that works with both anon and authenticated roles
CREATE POLICY "Enable insert for all users"
  ON waitlist
  FOR INSERT
  WITH CHECK (true);

-- Create policy for SELECT (for admin purposes)
CREATE POLICY "Enable read access for authenticated users"
  ON waitlist
  FOR SELECT
  TO authenticated
  USING (true);

-- Grant necessary permissions to anon and authenticated roles
GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT INSERT ON waitlist TO anon, authenticated;
GRANT SELECT ON waitlist TO authenticated;

