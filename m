From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v5 1/3] of/pci: Unify pci_process_bridge_OF_ranges from
 Microblaze and PowerPC
Date: Thu, 11 Apr 2013 13:12:42 +0100
Message-ID: <20130411121242.GB28981@arm.com>
References: <1365578969-30966-1-git-send-email-Andrew.Murray@arm.com>
 <1365578969-30966-2-git-send-email-Andrew.Murray@arm.com>
 <20130410233330.4e9479b0@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130410233330.4e9479b0@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "jg1.han@samsung.com" <jg1.han@samsung.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "paulus@samba.org" <paulus@samba.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "bhelgaas@google.com" <bhelgaa>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 10, 2013 at 10:33:30PM +0100, Thomas Petazzoni wrote:
> Dear Andrew Murray,
> 
> On Wed, 10 Apr 2013 08:29:26 +0100, Andrew Murray wrote:
> 
> > diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> > index bb115de..6852481 100644
> > --- a/include/linux/of_pci.h
> > +++ b/include/linux/of_pci.h
> > @@ -11,4 +11,7 @@ struct device_node;
> >  struct device_node *of_pci_find_child_device(struct device_node *parent,
> >  					     unsigned int devfn);
> >  
> > +void pci_process_bridge_OF_ranges(struct pci_controller *hose,
> > +			struct device_node *dev, int primary);
> > +
> >  #endif
> 
> In this file, 'struct pci_controller' is not defined anywhere, and not
> in any header file that is included. So I get a warning at compile time
> when <linux/of_pci.h> is included, but nothing has defined 'struct
> pci_controller' beforehand. So I think this file should carry a change
> like:
> 
> +struct pci_controller;
> 
> In my version of the patch I added it, see:
> 
> diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> index bb115de..e56182f 100644
> --- a/include/linux/of_pci.h
> +++ b/include/linux/of_pci.h
> @@ -4,6 +4,7 @@
>  #include <linux/pci.h>
>  
>  struct pci_dev;
> +struct pci_controller;
>  struct of_irq;
>  int of_irq_map_pci(const struct pci_dev *pdev, struct of_irq *out_irq);
>  
> @@ -11,4 +12,7 @@ struct device_node;
>  struct device_node *of_pci_find_child_device(struct device_node *parent,
>  					     unsigned int devfn);
>  
> +void pci_process_bridge_OF_ranges(struct pci_controller *hose,
> +			struct device_node *dev, int primary);
> +
>  #endif
> 
> But otherwise, for PATCH 1/3 and 2/3,

Thanks - I somehow missed this.

I've included this change in my next respin - but I've put
'struct pci_controller' immediately before 'pci_process_bridge_OF_ranges'
rather than above of_irq_map_pci to be consistent with the rest of the file.

Andrew Murray


> 
> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
