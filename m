From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 0/3] of/pci: Provide common support for PCI DT parsing
Date: Tue, 16 Apr 2013 12:59:29 +0100
Message-ID: <20130416115929.GB13259@arm.com>
References: <1365693969-23907-1-git-send-email-Andrew.Murray@arm.com>
 <20130415175641.GM28693@titan.lakedaemon.net>
 <CACRpkdbSd8pRG5pUS0ymqXDSp=ZhoQa2ctVuRA0cCmUcX5qFAA@mail.gmail.com>
 <1366096361.24994.49.camel@pasglop>
 <20130416112951.GZ28693@titan.lakedaemon.net>
 <20130416133140.7de24c89@skate>
 <20130416113727.GA28693@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130416113727.GA28693-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: "siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 16, 2013 at 12:37:27PM +0100, Jason Cooper wrote:
> On Tue, Apr 16, 2013 at 01:31:40PM +0200, Thomas Petazzoni wrote:
> > Dear Jason Cooper,
> > 
> > On Tue, 16 Apr 2013 07:29:51 -0400, Jason Cooper wrote:
> > 
> > > > Do not send this series upstream (or even in -next) until it has been at
> > > > least build-tested and acked by the affected architectures. AFAIK it
> > > > breaks microblaze build (simple missing #include) and isn't yet tested
> > > > on powerpc (I'm on vacation, maybe somebody else on linuxppc-dev can do
> > > > it though).
> > > 
> > > I added the missing include reference by Michal Simek for the branch at
> > > mvebu/drivers.
> > 
> > Some other build issues were reported on x86 during the night (thanks
> > to automated build tests), and Andrew Murray has just sent a new
> > version v7 of the patch set addressing those issues, as well as the
> > missing include.
> > 
> > Also, please note that Andrew's patch set contains three patches, but
> > the Marvell PCIe driver only requires PATCH 1/3 and PATCH 2/3.
> 
> Ok.  Thanks Andrew!  Do you (AndrewM) want me to keep the series
> together?  Or drop 3/3 from my tree?  I can do either, I just need to
> know.

Patch 1 has an ack from Microblaze but not yet from PowerPC, it probably needs
an ack from both of these before moving upwards.

Patch 3 is awaiting feedback from Mips, ideally all three patches could stay
together but if feedback blocks this then I guess it could go alone later.

Andrew Murray
