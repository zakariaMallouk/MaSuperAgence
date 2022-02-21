<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Property;
use App\Repository\PropertyRepository;
use Doctrine\Persistence\ObjectManager;

class PropertyController extends AbstractController
{
    /**
     *  @var PropertyRepository
    */
    private $repository;

    
    //private $em;
    
    public function __construct(PropertyRepository $repository)
    {
        $this->repository = $repository;   
        //$this->em = $em; 
    }
     
    /**
     *  @Route("/biens", name="property.index")
     *  @return Response
     */
    public function index() : Response
    {
        /*$property = new Property();
        $property->setTitle('Mon premier bien')
                ->setPrice(20000)
                ->setRooms(4)
                ->setBedrooms(3)
                ->setDescription('Une petite description')
                ->setSurface(60)
                ->setFloor(4)
                ->setHeat(1)
                ->setCity('Montpellier')
                ->setAddress('15 Boulevard Gambetta')
                ->setPostalCode(3000);
        $em = $this->getDoctrine()->getManager();
        $em -> persist($property);
        $em -> flush();*/

        // $zak = "hello";
        // dump($zak);die;
        // dd($zak);

        // $repository = $this->getDoctrine()->getRepository(Property ::class);
        // dump($repository);
        
        // $property = $this->repository->find(1);
        // $property = $this->repository->findAll();
        // $property = $this->repository->findOneBy(['floor'=>4]);
        /*
        $entityManager = $this->getDoctrine()->getManager();
        $property = $this->repository->findAllVisble();
        //$property[0]->setSold(true);dd($property);
        $entityManager->flush();
        */
        
        // dump($property);

        // return new Response( 'Les biens');
        return $this->render('property/index.html.twig', [
            'current_menu' => 'properties'
        ]);
    }

    /**
     *  @Route("/biens/{slug}-{id}", name="property.show", requirements={"slug": "[a-z0-9\-]*"})
     *  @param Property $property
     *  @return Response
     */
    public function show(Property $property, string $slug): Response
    {
        if ($property->getSlug() !== $slug){
            return $this->redirectToRoute('property.show', [
                'id' => $property->getId(),
                'slug'=>$property->getSlug()
            ], 301);
        }
        return $this->render('property/show.html.twig', [
            'property' => $property ,
            'current_menu' => 'properties'
        ]);
    }
}