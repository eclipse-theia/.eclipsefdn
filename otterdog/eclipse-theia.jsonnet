local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-theia') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_delete_repositories: false,
    name: "Eclipse Theia™",
    packages_containers_internal: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('cryptodetector') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "cryptodetector",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
        orgs.newRepoWebhook('https://hooks.slack.com/services/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') {
          content_type: "json",
          events+: [
            "commit_comment",
            "create",
            "delete",
            "deployment_status",
            "fork",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "push",
            "release"
          ],
        },
        orgs.newRepoWebhook('https://hooks.slack.com/services/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') {
          content_type: "json",
          events+: [
            "commit_comment",
            "create",
            "delete",
            "deployment_status",
            "fork",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "push",
            "release"
          ],
        },
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
        orgs.newRepoSecret('DASH_LICENSES_PAT') {
          value: "********",
        },
        orgs.newRepoSecret('DEEPL_API_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "Lint"
          ],
        },
        orgs.newBranchProtectionRule('che-7.0.0') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:DCO",
            "any:Gitpod",
            "any:continuous-integration/travis-ci",
            "any:eclipsefdn/eca"
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
    orgs.newRepo('theia-blueprint') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Theia Blueprint is a template for building desktop-based products based on the Eclipse Theia platform, as well as to showcase Eclipse Theia capabilities. It is made up of a subset of existing Eclipse Theia features and extensions and can be easily downloaded and installed on all major operating system platforms.",
      homepage: "https://theia-ide.org/docs/blueprint_download",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
    orgs.newRepo('theia-cpp-extensions') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Theia CPP extension",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "********",
        },
      ],
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
    orgs.newRepo('theia-playwright-template') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "theia-playwright-template",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('theia-vscodecov') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://theia-ide.org/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
      ],
    },
    orgs.newRepo('theia-website-publish') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('vscode-builtin-extensions') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Built-in VS Code extensions for Theia",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
          value: "********",
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
