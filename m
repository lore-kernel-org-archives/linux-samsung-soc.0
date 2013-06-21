From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V10 0/4] PCIe support for Samsung Exynos5440 SoC
Date: Fri, 21 Jun 2013 16:14:49 +0200
Message-ID: <201306211614.49434.arnd@arndb.de>
References: <003901ce6e50$03d039a0$0b70ace0$@samsung.com>
 <201306211030.47440.arnd@arndb.de>
 <20130621141144.GP31667@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130621141144.GP31667@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, 'Andrew Murray' <andrew.murray@arm.com>, 'Pratyush Anand' <pratyush.anand@st.com>, 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 June 2013, Jason Cooper wrote:
> On Fri, Jun 21, 2013 at 10:30:47AM +0200, Arnd Bergmann wrote:
> > On Friday 21 June 2013, Thomas Petazzoni wrote:
> > > I am by far not an expert on how to solve merge strategies and so on,
> > > but to avoid conflicts at Linus's level while merging the arm-soc and
> > > pci trees, it would be better if this Samsung PCIe driver could go
> > > through arm-soc (with Bjorn ACK, of course), so that Arnd/Olof can
> > > make sure the ordering is correct with regard to the of/pci changes and
> > > the mvebu/pci driver.
> > 
> > Yes, good point.
> > 
> > The alternative would be that Bjorn also takes the PCI branch dependencies
> > that are already in arm-soc into his tree. Either way works, but I agree
> > that what you suggest would be simpler.
> 
> Yes, that is why we did it this way.  It was my understanding based on
> previous comments by yourself and LinusW that you both had patches
> depending on (now called) mvebu/of_pci.  So we got it into arm-soc
> early so those branches could depend on it.

Right. I wasn't paying enough attention for the early merges that
Olof did.

	Arnd
