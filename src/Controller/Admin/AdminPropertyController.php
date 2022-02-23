<?php

namespace App\Controller\Admin;

use App\Entity\Property;
use App\Form\PropertyType;
use App\Repository\PropertyRepository;
use Doctrine\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class AdminPropertyController extends AbstractController
{
    /**
     *  @var PropertyRepository
     */
    private $repository;
    

    public function __construct(PropertyRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @Route("/admin", name="admin.property.index")
     * @return \Symfony\component\HttpFoundation\Response
     */
    public function index()
    {
         //$zaki = 'test';
        $properties = $this->repository->findAll();
        //dd($zaki);
        return $this->render('admin/property/index.html.twig', compact('properties'));
    }

    /**
     * @Route("admin/property/create", name="admin.property.new", methods={"GET","POST"})
     */
    public function new(Request $request)
    {
        $property = new Property();
        $form = $this->createForm(PropertyType::class, $property);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $this->getDoctrine()->getManager()->persist($property);
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('success', 'Bien créé avec succès');
            return $this->redirectToRoute('admin.property.index');
        }

        return $this->render('admin/property/new.html.twig', [
            'property' => $property,
            'form' => $form->createView()
        ]);
    }


    /**
     * @Route("/admin/property/{id}", name="admin.property.edit", methods={"GET","POST"})
     * @param Property $property
     * @param Request $request
     * @return \Symfony\component\HttpFoundation\Response
     */
    public function edit(Property $property, Request $request)
    {
        $form = $this->createForm(PropertyType::class, $property);
        $form->handleRequest($request);
        if ( $form->isSubmitted() && $form->isValid())
        {
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('success', 'Bien modifié avec succès');
            return $this->redirectToRoute('admin.property.index');
        }
        return $this->render('admin/property/edit.html.twig', [
            'property' => $property,
            'form' => $form->createView()
        ]);
        // return $this->render('admin/property/edit.html.twig', compact('property'));
    }

    /**
     * @Route ("/admin/property/{id}/delete", name="admin.property.delete", methods={"GET","DELETE"})
     * @param Property $property
     * @return \Symfony\component\HttpFoundation\Response
     */
    public function delete(Property $property, Request $request)
    {
        if($this->isCsrfTokenValid('delete'. $property->getId(),$request->get('_token')))
        {
            $this->getDoctrine()->getManager()->remove($property);
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('success', 'Bien supprimé avec succès');
            // return new Response('suppression'); //pour afficher est-que la fonction delete ca marche
        }
        
        return $this->redirectToRoute('admin.property.index');
    }

}
