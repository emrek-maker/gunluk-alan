create table if not exists public.daily_notes (
  user_id uuid not null references auth.users (id) on delete cascade,
  day_key date not null,
  note text not null default '',
  tasks jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, day_key)
);

alter table public.daily_notes enable row level security;

grant select, insert, update, delete on public.daily_notes to authenticated;

drop policy if exists "daily_notes_select_own" on public.daily_notes;
create policy "daily_notes_select_own"
on public.daily_notes
for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "daily_notes_insert_own" on public.daily_notes;
create policy "daily_notes_insert_own"
on public.daily_notes
for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "daily_notes_update_own" on public.daily_notes;
create policy "daily_notes_update_own"
on public.daily_notes
for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

drop policy if exists "daily_notes_delete_own" on public.daily_notes;
create policy "daily_notes_delete_own"
on public.daily_notes
for delete
to authenticated
using ((select auth.uid()) = user_id);
