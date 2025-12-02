local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('ecd.theia', 'eclipse-theia') {
  settings+: {
    description: "",
    name: "Eclipse Theia™",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  teams+: [
    orgs.newTeam('core') {
      description: "https://projects.eclipse.org/projects/ecd.theia/who - responsible for maintaining Theia, i.e. reviewing and landing pull requests, helping community, resolving blockers (as CQs) and so on.",
      members+: [
        "AlexTugarev",
        "akosyakov",
        "azatsarynnyy",
        "benoitf",
        "evidolob",
        "gorkem",
        "marcdumais-work",
        "msujew",
        "paul-marechal",
        "svenefftinge",
        "tolusha",
        "tsmaeder",
        "vince-fugnitto",
        "vinokurig"
      ],
    },
    orgs.newTeam('debug-extension') {
      description: "Committers responsible for debug extensions",
      members+: [
        "akosyakov"
      ],
    },
    orgs.newTeam('ip-help') {
      description: "Internal team that can help with IP questions, CQs",
      members+: [
        "akosyakov",
        "benoitf",
        "marcdumais-work",
        "tolusha",
        "vince-fugnitto"
      ],
    },
    orgs.newTeam('plugin-system') {
      description: "Committers responsible for the plugin system",
      members+: [
        "akosyakov",
        "benoitf",
        "evidolob",
        "tsmaeder"
      ],
    },
    orgs.newTeam('task-extension') {
      description: "Committers responsible for task and process extensions",
      members+: [
        "akosyakov",
        "marcdumais-work",
        "paul-marechal"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('cryptodetector') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "cryptodetector",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('discourse-forum-archive') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('dugite-extra') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "dugite-extra - High-level Git commands for dugite",
      homepage: "",
      topics+: [
        "dugite",
        "git",
        "nodejs"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('dugite-no-gpl') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Elegant bindings for working with Git in your Node applications",
      has_issues: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          allows_force_pushes: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('generator-theia-extension') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "A Yeoman generator for extensions to the Theia IDE",
      topics+: [
        "theia-extension",
        "theia-ide",
        "yeoman"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('security-audit') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Automated Security Audit for Theia framework dependencies",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "",
      topics+: [
        "audit",
        "eclipse-theia",
        "security",
        "theia",
        "theia-ide"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('theia') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Theia is a cloud & desktop IDE framework implemented in TypeScript.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "http://theia-ide.org",
      topics+: [
        "cloud-ide",
        "editor",
        "electron",
        "ide",
        "language-server-protocol",
        "typescript"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.io/webhook/github/v1/5cc039a06ed44dc5') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team",
            "team_add"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://jenkins.openshift.io/github-webhook/') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
          insecure_ssl: "1",
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('DEEPL_API_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
        },
        orgs.newBranchProtectionRule('che-7.0.0') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:DCO",
            "any:Gitpod",
            "any:continuous-integration/travis-ci"
          ],
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('codeowner_test') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('theia-cloud') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('DASH_LICENSES_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('GCP_SA_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('NPM_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('theia-cloud-helm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('theia-cpp-extensions') {
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "This repository is outdated and has been archived. Please see https://github.com/eclipse-cdt-cloud/vscode-memory-inspector for an updated version of the memory view component",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('theia-e2e-test-suite') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "theia-e2e-test-suite ",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('TOKEN') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('theia-generator-plugin') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('theia-ide') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "The Eclipse IDE is a modern and open IDE for cloud and desktop. The Theia IDE is based on the Theia platform. The Theia IDE is available as a downloadable desktop application. You can also try the latest version of the Theia IDE online. For more details, see the Readme below.",
      homepage: "https://theia-ide.org/#theiaide",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('DOCKERHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('theia-ide-snap') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Snap Package for the Theia IDE.",
      homepage: "https://theia-ide.org/#theiaide",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('STORE_LOGIN') {
          value: "pass:bots/ecd.theia/snapcraft.io/STORE_LOGIN",
        },
      ],
    },
    orgs.newRepo('theia-playwright-template') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "theia-playwright-template",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('theia-plugin-packager') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('theia-vscodecov') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('theia-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Theia's Website",
      gh_pages_build_type: "workflow",
      has_discussions: true,
      homepage: "https://theia-ide.org/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://api.netlify.com/hooks/github') {
          content_type: "json",
          events+: [
            "delete",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('DEPLOY_PREVIEW_TOKEN') {
          value: "pass:bots/ecd.theia/github.com/preview-token",
        },
        orgs.newRepoSecret('GH_ACTION_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('TOKEN') {
          value: "pass:bots/ecd.theia/github.com/api-token-website",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages",
            "master"
          ],
          deployment_branch_policy: "selected",
        },
        orgs.newEnvironment('pull-request-preview'),
      ],
    },
    orgs.newRepo('theia-website-previews') {
      default_branch: "previews",
      description: "Hosting PR previews for theia-website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "previews",
      gh_pages_source_path: "/",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "previews"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('theia-website-publish') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('theia-yeoman-plugin') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('vscode-builtin-extensions') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Built-in VS Code extensions for Theia",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('OVSX_PAT') {
          value: "pass:bots/ecd.theia/open-vsx/token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('ovsx-publish') {
          allows_force_pushes: true,
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vscode-theia-comparator') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
  ],
}
