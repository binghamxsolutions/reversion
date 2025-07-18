# RE:version

A release note update utility for bingham x solutions.

## Getting Started

### Table of Contents

1. [Purpose](#purpose)
2. [Layout](#layout)
3. [Backend](#backend)

### Purpose

From our own project summary:
> The purpose of this project is to create a tool that will allow me to create and modify release notes from a singular point of origin without needing to open the file in a text editor and risk accidentally deleting crucial data.

That about sums it all up!

\
As the number of software projects increase, we figured it'd be best to ensure that there was a way to not mess up how the release notes were updated (life happens, after all 😅). And since how our apps present their release notes are fairly uniformed, what better way to update them than to make the *update method* uniform?

Mind. **blown**. *Game changer*.

### Layout

On a slightly more serious note, we put a good amount of thought into how the UI should be designed.

Because if the purpose of creating this tool is to not make mistakes when updating the notes, that means the UI has to be fool-proof. And for us here at bxs, that means keeping it stupid simple: we can't risk making blunders by making the interface overly complicated. Especially considering that there are only two things that need to be addressed: adding a version string and providing a list of changes made as an array of objects.  

If we messed that up, we'd have to apologize to our motto 😞

\
So how'd we make it work? Check out a few snippets of the layout below:

![Select a project](/screenshots/Select%20a%20project.png "Select a project") ![Add new release notes](/screenshots/Add%20new%20release%20notes.png "Add new release notes")

![Review](/screenshots/Review.png "Review") ![Submission response - success](/screenshots/Submission%20response_success.png "Submission response - success")

\
You can [find the full prototype on Adobe](https://xd.adobe.com/view/bef10d6e-34c8-45cd-9ecc-a8783bdbb529-eba2/)!

### Backend

So the UI is great and all, but we actually started with planning out the back-end first!

Well&hellip; it was a joint effort really. The idea was to allow the user to pick the project from a drop-down menu and maybe even add one in the case of a new project. The issue was: how do we store that? Are we creating a local repository for all the projects we've been working on? Are we storing them in a JSON file? Are we using actual files or just their filepaths? Whichever path we took, we had to make sure that it made sense for what we were doing and ***did not*** mess up existing projects.

That last requirement made the choice clear: we're going with a database that stores the filepath. That way, if anything happened, we weren't risking an entire file system on a singular blunder.

The database would just include three columns: a unique ID for simple queries, one for the project name so we could display it in the drop-down menu, and one for the path to the release note document. And the ingenius idea to make sure we *really* don't mess things up: only provide the **directory** to the release note document. Why? Because when the user presses the **Submit** button, there will be a pre-check to ensure the release note doc exists *in the first place*. Otherwise, nothing gets updated!

![Yzma evil laugh](https://media1.tenor.com/m/BCBthxm3VjYAAAAd/i-win-yzma.gif "Yzma evil laugh")

\
This project is still in progress, though, so we don't *quite* have everything completely ready, but once we do, we'll update you. For now, keep your eyes peeled.

More details coming soon!

\
&copy;2025 bingham x solutions
