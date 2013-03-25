From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/6] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Mon, 25 Mar 2013 10:21:06 +0000
Message-ID: <20130325102106.GA20770@arm.com>
References: <00c001ce277b$92b26ab0$b8174010$%han@samsung.com>
 <20130323104156.GL4977@n2100.arm.linux.org.uk>
 <20130323143704.5da5d20c@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130323143704.5da5d20c@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, 'Siva Reddy Kallam' <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Jason Gunthorpe' <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Surendranath Gurivireddy Balla' <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Mar 23, 2013 at 01:37:04PM +0000, Thomas Petazzoni wrote:
> 
> On Sat, 23 Mar 2013 10:41:56 +0000, Russell King - ARM Linux wrote:
> 
> > Please look at how IORESOURCE_* stuff is defined:
> > #define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
> > #define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
> > #define IORESOURCE_MEM          0x00000200
> > #define IORESOURCE_REG          0x00000300      /* Register offsets */
> > #define IORESOURCE_IRQ          0x00000400
> > #define IORESOURCE_DMA          0x00000800
> > #define IORESOURCE_BUS          0x00001000
> > 
> > Notice that it's not an array of bits.
> > 
> > So this should be:
> > 		if ((iter.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_IO) {
> 
> What I've done for the Marvell PCIe driver is:
> 
> +	for_each_of_pci_range(&iter, np) {
> +		unsigned long restype = iter.flags & IORESOURCE_TYPE_BITS;
> +		if (restype == IORESOURCE_IO) {
> [...]
> +		if (restype == IORESOURCE_MEM) {
> [...]

OK I'll update this patch and also include Thierry's suggestions.

Andrew Murray
