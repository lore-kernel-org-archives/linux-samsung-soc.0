From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V10 0/4] PCIe support for Samsung Exynos5440 SoC
Date: Mon, 24 Jun 2013 11:52:10 +0900
Message-ID: <007201ce7085$d2c4fed0$784efc70$@samsung.com>
References: <003901ce6e50$03d039a0$0b70ace0$@samsung.com>
 <201306211030.47440.arnd@arndb.de>
 <20130621141144.GP31667@titan.lakedaemon.net>
 <201306211614.49434.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <201306211614.49434.arnd-r2nGTMty4D4@public.gmane.org>
Content-language: ko
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Thomas Petazzoni' <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: 'Siva Reddy Kallam' <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Jason Gunthorpe' <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jason Cooper' <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, 'Surendranath Gurivireddy Balla' <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Thierry Reding' <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Mohit KUMAR' <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Andrew Murray' <andrew.murray-5wv7dgnIgG8@public.gmane.org>, 'Pratyush Anand' <pratyush.anand-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, June 21, 2013 11:15 PM, Arnd Bergmann wrote:
> On Friday 21 June 2013, Jason Cooper wrote:
> > On Fri, Jun 21, 2013 at 10:30:47AM +0200, Arnd Bergmann wrote:
> > > On Friday 21 June 2013, Thomas Petazzoni wrote:
> > > > I am by far not an expert on how to solve merge strategies and so on,
> > > > but to avoid conflicts at Linus's level while merging the arm-soc and
> > > > pci trees, it would be better if this Samsung PCIe driver could go
> > > > through arm-soc (with Bjorn ACK, of course), so that Arnd/Olof can
> > > > make sure the ordering is correct with regard to the of/pci changes and
> > > > the mvebu/pci driver.

Yes, right.
That is the reason why I based on 'linu-next' tree,
instead of 'PCI' -next branch.


Bjorn Helgaas,
Could you give your ACK?
Thank you.


Best regards,
Jingoo Han

> > >
> > > Yes, good point.
> > >
> > > The alternative would be that Bjorn also takes the PCI branch dependencies
> > > that are already in arm-soc into his tree. Either way works, but I agree
> > > that what you suggest would be simpler.
> >
> > Yes, that is why we did it this way.  It was my understanding based on
> > previous comments by yourself and LinusW that you both had patches
> > depending on (now called) mvebu/of_pci.  So we got it into arm-soc
> > early so those branches could depend on it.
> 
> Right. I wasn't paying enough attention for the early merges that
> Olof did.
> 
> 	Arnd
