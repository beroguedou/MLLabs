# MLLabs

Machine Learning Laboratory for quick and easy experiences in docker container. It will allow you to make machine learning experiences without having to install all the stuff on you computer. So you just have to manage conatiner that you could destroy when you want.


<h1> Prerequisites: </h1>
<ul>
    <li> Docker-CE </li>
    <li> Nvidia-Docker </li> 
</ul>   
 
<h1> How to: </h1>

0- Clone this repository and navigate inside by doing:
        cd ./MLLabs
    
1- Build MLLabs docker's image with this command in a shell terminal:
        sh build.sh 
        
2- Check if the images is successfully built (Optional) with this shell command:
        docker images
        
3- Create the repository where you will put your data:
        mkdir /home/data
        
        
4- Run a notebook container with  this command:
        sh run_env.sh
        
5- Go to your browser and check the address:
        localhost:8888/tree
        
6- Enjoy !!!
        
        
        
