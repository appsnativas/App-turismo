import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://iyrtrixlkrvypqnzvcsh.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5cnRyaXhsa3J2eXBxbnp2Y3NoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxMTAxMTgsImV4cCI6MjA3MDY4NjExOH0.vsmihJfHw_pHOLIe-XFbvfRWhAo09G-b7fvygujIQKY';

export const supabase = createClient(supabaseUrl, supabaseKey);
