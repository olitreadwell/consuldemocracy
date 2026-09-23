# consuldemocracy/consuldemocracy context
> refreshed 2026-09-24 | upstream default: master @ 35a43d7fe

## Identity & policies
- upstream: consuldemocracy/consuldemocracy, default branch `master`, primary language Ruby (Rails), bilingual EN+ES base languages (README_ES.md, CONTRIBUTING_ES.md; Crowdin manages all others). English-first: yes.
- CLA/DCO: none
- AI-assisted PR policy: allowed / unstated (no AI-disclosure requirement found; config flags bans_ai:false, ai_disclosure_required:false)
- signed commits required: no
- PR template: .github/PULL_REQUEST_TEMPLATE (Motivation-style checklist; not .md — scan may miss it, passport says false, treat as true)
- external tracker: github

## Conventions (verified from merged PRs)
- branch naming: snake_case descriptor (axe_errors_after_clicking_buttons, security_policy, dashboard_datetime, remove_legacy_paperclip_site_customization_columns), dependabot uses /npm_and_yarn/...
- CI: GitHub Actions `tests` workflow; RSpec via Knapsack parallel; pronto; RuboCop. Trivial doc typos do not affect app tests.
- i18n: edit only base languages en + es; others via Crowdin.

## Maintainer picture
- Javi Martín (javierm), Sebastià Roig (taitus). Active, merges daily (2026-09-07 merges). Responsive.

## Issue-area health
- Docs (docs/en) are generally clean; EN spelling errors are rare. Translations are en/es base + Crowdin.

## Gap ledger (dedupe — READ FIRST, never re-pick)
- `2026-08-05` self-found test-coverage gap (WelcomeHelper homepage-carousel helpers) — outcome pr-opened (PR #1) — lesson: Rails helpers lacked specs; added 57-line spec.
- `2026-08-26` test-coverage update — outcome pr-updated (PR #5).
- `2026-09-09` self-found trivial typos (CONTRIBUTING prefered; graphql tabe + inside inside; census filled in in) — outcome pr-opened (PR #18, fix_doc_typos) — lesson: bundle genuine EN doc typos into one glance-reviewable PR. Fork CI green except pronto (403 creating commit status: fork token lacks `statuses` write — fork artifact, passes upstream); test shard (5,1) flaked once, passed on rerun.

## Mined gaps (discovered, not yet attempted)
- (none outstanding after this pass)
- `2026-09-08` maintainer-approved docs gap (issue #5613, "Document how to customize the help page") — outcome pr-opened (PR #19, docs/customize_help_page) — lesson: maintainer reopened #5613 and asked to include the idea in customization docs; commenter lmsalgado documented an admin-interface workaround (disable Help page feature, create custom page, add "Main Navigation Right" content block). Added a "Customizing the help page" section to docs/en + docs/es customization/views.md covering view, controller, and admin-interface approaches. Fork CI fully green after granting the fork's GITHUB_TOKEN `statuses` write (pronto 403 was a fork token artifact, now fixed at the fork level).
