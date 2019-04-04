Likatite - Webapp for people with a big apetite to give and get likes.

The Likatite web application is an application built using maven, OAuth2 and facebook Graph API. This application is intended to access users facebook posts and display statistics such as the total number of posts made by the user, total number likes for the posts, most liked photo, photo with most comments etc. Finally it allows users to get an idea of their usage and a rating that rates their facebook profile. It allows sharing in facebook to make it possible for users showcast their fame and the dent they've caused in social media.


Using a library known as the restfb library requires displaying the below message :


                  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
                  THE SOFTWARE.

Instructions for setting up and running:

1. Clone this repository.
  git clone https://github.com/ihsanizwer/Likatite.git
  
2. Change permissions of the repository files.
  chmod -r 755 Likatite

3. Go to https://developers.facebook.com create a new App by the name, Likatite. Associate facebook Log In for the App. Provide the redirection URI at the setting section under login and obtain the App ID and App Secret.
(For more on set up of the application on the developers site, please visit http://www.securityinternal.com/2017/04/retrieving-user-resources-from-facebook.html)

4. Open the source code (preferably, IntelliJ Idea) with an IDE, open the class OAuthCallbackListner and the jsp page, index.jsp and change all the occurances of App ID, App Secret with the ones you got by registering the App in the facebook developers website.

5. Navigate to the app directory using the terminal to where the pom.xml could be found and type "mvn clean install"

6. Go to the target directory and locate the facebookapp.war file. Copy this war file to the webapps directory of tomcat.

7. Start tomcat by typing: ./catalina.sh run . Now go to the browser and type in the URL to the app with the relavent port number. 

8. Log In with facebook through the App. Accept to share resources through facebook and generate the results.

For more information, please read the following blog:
https://ihsanizwer.tk/tech/2017/05/19/facebook-application-oauth-2-0/
