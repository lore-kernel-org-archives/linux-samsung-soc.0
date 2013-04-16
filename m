From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v6 0/3] of/pci: Provide common support for PCI DT parsing
Date: Tue, 16 Apr 2013 07:29:51 -0400
Message-ID: <20130416112951.GZ28693@titan.lakedaemon.net>
References: <1365693969-23907-1-git-send-email-Andrew.Murray@arm.com>
 <20130415175641.GM28693@titan.lakedaemon.net>
 <CACRpkdbSd8pRG5pUS0ymqXDSp=ZhoQa2ctVuRA0cCmUcX5qFAA@mail.gmail.com>
 <1366096361.24994.49.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1366096361.24994.49.camel@pasglop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: siva.kallam@samsung.com, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, Liviu.Dudau@arm.com, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Michal Simek <monstr@monstr.eu>linux-
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 16, 2013 at 09:12:41AM +0200, Benjamin Herrenschmidt wrote:
> On Mon, 2013-04-15 at 20:29 +0200, Linus Walleij wrote:
> > > As agreed with Rob Herring, series applied to mvebu/drivers to
> > support
> > > mvebu pcie driver.
> > 
> > Will this hit ARM SoC soon-ish so I can base a pull request for the
> > Integrator on this stuff as well?
> 
> Do not send this series upstream (or even in -next) until it has been at
> least build-tested and acked by the affected architectures. AFAIK it
> breaks microblaze build (simple missing #include) and isn't yet tested
> on powerpc (I'm on vacation, maybe somebody else on linuxppc-dev can do
> it though).

I added the missing include reference by Michal Simek for the branch at
mvebu/drivers.

thx,

Jason.
