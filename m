From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/3] of/pci: Unify pci_process_bridge_OF_ranges from
 Microblaze and PowerPC
Date: Thu, 11 Apr 2013 13:03:22 +0100
Message-ID: <20130411120322.GA28981@arm.com>
References: <1365578969-30966-1-git-send-email-Andrew.Murray@arm.com>
 <1365578969-30966-2-git-send-email-Andrew.Murray@arm.com>
 <51656592.7070806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51656592.7070806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org" <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 10, 2013 at 02:13:54PM +0100, Rob Herring wrote:
> Adding Ben H and Michal...
> 
> On 04/10/2013 02:29 AM, Andrew Murray wrote:
> > The pci_process_bridge_OF_ranges function, used to parse the "ranges"
> > property of a PCI host device, is found in both Microblaze and PowerPC
> > architectures. These implementations are nearly identical. This patch
> > moves this common code to a common place.
> > 
> > Signed-off-by: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> 
> One comment below. Otherwise,
> 
> Reviewed-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> You need also need acks from Ben and Michal.
> 
> [...]
> 
> > +		/* Act based on address space type */
> > +		res = NULL;
> > +		switch ((pci_space >> 24) & 0x3) {
> > +		case 1:		/* PCI IO space */
> > +			pr_info("  IO 0x%016llx..0x%016llx -> 0x%016llx\n",
> > +			       cpu_addr, cpu_addr + size - 1, pci_addr);
> > +
> > +			/* We support only one IO range */
> > +			if (hose->pci_io_size) {
> > +				pr_info(" \\--> Skipped (too many) !\n");
> > +				continue;
> > +			}
> > +#if defined(CONFIG_PPC32) || defined(CONFIG_MICROBLAZE)
> 
> How about "if (!IS_ENABLED(CONFIG_64BIT))" instead.

OK I'll add in my next re-spin. Would "#ifndef CONFIG_64BIT" suffice?

> 
> > +			/* On 32 bits, limit I/O space to 16MB */
> > +			if (size > 0x01000000)
> > +				size = 0x01000000;
> > +
> > +			/* 32 bits needs to map IOs here */
> > +			hose->io_base_virt = ioremap(cpu_addr, size);
> > +
> > +			/* Expect trouble if pci_addr is not 0 */
> > +			if (primary)
> > +				isa_io_base =
> > +					(unsigned long)hose->io_base_virt;
> > +#endif /* CONFIG_PPC32 || CONFIG_MICROBLAZE */
> > +			/* pci_io_size and io_base_phys always represent IO
> > +			 * space starting at 0 so we factor in pci_addr
> > +			 */
> > +			hose->pci_io_size = pci_addr + size;
> > +			hose->io_base_phys = cpu_addr - pci_addr;
> 
> 
