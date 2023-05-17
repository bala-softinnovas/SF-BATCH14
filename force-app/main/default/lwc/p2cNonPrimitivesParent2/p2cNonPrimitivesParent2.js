import { LightningElement } from 'lwc';

export default class P2cNonPrimitivesParent2 extends LightningElement {
    carouselInfo = [
        {
            src: "https://previews.123rf.com/images/ksenija2015/ksenija20151802/ksenija2015180200008/96121900-white-fluffy-bunny-on-a-wooden-background.jpg",
            header: "First Card",
            description: "First card description.",
            alternativeText: "First card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
            header: "Second Card",
            description: "Second card description.",
            alternativeText: "Second card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
            header: "Third Card",
            description: "Third card description.",
            alternativeText: "Third card accessible description.",
            href: "javascript:void(0);"
        }
    ];
}