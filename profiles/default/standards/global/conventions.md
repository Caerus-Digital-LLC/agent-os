## File Organization

### One Class/Struct Per File Rule
- **MANDATORY**: Every new struct or class MUST be created in its own separate file
- Files must be organized logically within the appropriate folder structure
- Never combine multiple types in a single file
- Every new class or struct object, or any major Type should be given its own file and placed in the folder structure as outlined below

## Project Folder Structure

Organize all code files according to this mandatory structure:

- **Infrastructure/** - Contains assets, plists, and configuration files that don't require frequent manipulation
- **Utilities/** - General utility code and helper functions
- **Services/** - Service classes and any general services
- **Models/** - Swift Data models and general data models
- **Views/** - All user interface view files (SwiftUI views, UIKit views, etc.)
- **ViewControllers/** (or ViewModels for MVVM) - Logic for the highest-level views and their subviews

## DRY Principle (Don't Repeat Yourself)

**CRITICAL - No Code Duplication:**
- Never write the same code multiple times across different views or files
- If the same pattern/code appears in multiple views, extract it into a reusable function
- Place extracted functions in the governing view controller/view model so all code is centralized in one location
- Changes should be made once and automatically affect all dependent components
- Avoid scenarios where the same change must be applied to multiple files independently

## View Logic Separation

**NO LOGIC IN VIEWS - This is non-negotiable:**
- Views should ONLY contain UI layout and presentation code
- All business logic and functionality MUST be placed in one of these locations:
  1. **ViewControllers/** or **ViewModels/** - For logic directly related to UI behavior and view management
  2. **Services/** or **Utilities/** - For functionality not directly tied to views
  3. **Models/** - For data-related logic
- The governing view controller/view model should contain all logic for its highest-level view AND all subviews
- This ensures all code for a feature lives in one centralized location
- Break up controllers/view models logically - don't create one giant controller for the entire project

## Code Reusability & Maintainability

- Design code so that changing one thing affects all related components automatically
- Extract common patterns into reusable functions/methods in the appropriate view controller/view model
- Centralize control logic to avoid scattered, duplicated code across views
- Think "change once, update everywhere" when writing any functionality

## General Development Conventions
- **Clear Documentation**: Maintain up-to-date README files with setup instructions, architecture overview, and contribution guidelines
- **Version Control Best Practices**: Use clear commit messages, feature branches, and meaningful pull/merge requests with descriptions
- **Dependency Management**: Keep dependencies up-to-date and minimal; document why major dependencies are used
- **Code Review Process**: Establish a consistent code review process with clear expectations for reviewers and authors
- **Testing Requirements**: Define what level of testing is required before merging (unit tests, integration tests, etc.)
- **Feature Flags**: Use feature flags for incomplete features rather than long-lived feature branches
- **Changelog Maintenance**: Keep a changelog or release notes to track significant changes and improvements
