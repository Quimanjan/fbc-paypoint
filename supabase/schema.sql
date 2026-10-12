-- FBC PayPoint prototype database
-- Run this once in Supabase: SQL Editor → New query → paste → Run.

-- One table holds every record. "coll" is the record type:
-- config, students, payments, or notes (promissory notes).
create table if not exists public.docs (
  coll       text        not null,
  id         text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (coll, id)
);

-- Send full rows on delete so every screen can remove them live.
alter table public.docs replica identity full;

-- Prototype access: anyone with the site link can read and write.
-- This is fine for a demo with sample data only. Before using real
-- student data, replace these policies with login-based rules.
alter table public.docs enable row level security;

drop policy if exists "demo read"   on public.docs;
drop policy if exists "demo insert" on public.docs;
drop policy if exists "demo update" on public.docs;
drop policy if exists "demo delete" on public.docs;

create policy "demo read"   on public.docs for select using (true);
create policy "demo insert" on public.docs for insert with check (true);
create policy "demo update" on public.docs for update using (true) with check (true);
create policy "demo delete" on public.docs for delete using (true);

-- Turn on realtime updates for this table.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'docs'
  ) then
    alter publication supabase_realtime add table public.docs;
  end if;
end $$;
