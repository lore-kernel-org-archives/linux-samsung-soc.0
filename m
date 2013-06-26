From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V10 1/4] pci: Add PCIe driver for Samsung Exynos
Date: Wed, 26 Jun 2013 20:17:04 +0200
Message-ID: <201306262017.04689.arnd@arndb.de>
References: <003a01ce6e50$6d5418b0$47fc4a10$@samsung.com>
 <20130625021102.GA13310@google.com>
 <007e01ce7153$4d4b0730$e7e11590$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <007e01ce7153$4d4b0730$e7e11590$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, linux-samsung-soc@vger.kernel.org, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, 'Andrew Murray' <andrew.murray@arm.com>, 'Pratyush Anand' <pratyush.anand@st.com>, 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 25 June 2013, Kukjin Kim wrote:
> Bjorn Helgaas wrote:
> > 
> > On Fri, Jun 21, 2013 at 04:24:54PM +0900, Jingoo Han wrote:
> > > Exynos5440 has a PCIe controller which can be used as Root Complex.
> > > This driver supports a PCIe controller as Root Complex mode.
> > >
> > > Signed-off-by: Surendranath Gurivireddy Balla <suren.reddy@samsung.com>
> > > Signed-off-by: Siva Reddy Kallam <siva.kallam@samsung.com>
> > > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Please merge this through arm-soc as you discussed.
> > 
> Sounds great.
> 
> Arnd, please take this series into arm-soc tree directly by yourself with my
> ack on arch/exynos stuff if you want ;)
> 

Ok, done.

I've put this on top of the next/soc tree, which already contains the
other PCI host controller support.

	Arnd
