From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 1/3] of/pci: Unify pci_process_bridge_OF_ranges from
 Microblaze and PowerPC
Date: Wed, 17 Apr 2013 17:00:15 +0100
Message-ID: <20130417160015.777453E2B73@localhost>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-2-git-send-email-Andrew.Murray@arm.com>
 <20130416103005.GB12726@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130416103005.GB12726@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <andrew.murray@arm.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, "paulus@samba.org" <paulus@samba.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, bhelgaas
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 16 Apr 2013 11:30:06 +0100, Andrew Murray <andrew.murray@arm.com> wrote:
> On Tue, Apr 16, 2013 at 11:18:26AM +0100, Andrew Murray wrote:
> > The pci_process_bridge_OF_ranges function, used to parse the "ranges"
> > property of a PCI host device, is found in both Microblaze and PowerPC
> > architectures. These implementations are nearly identical. This patch
> > moves this common code to a common place.
> > 
> > Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> > Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Michal Simek <monstr@monstr.eu>
> > ---
> >  arch/microblaze/include/asm/pci-bridge.h |    5 +-
> >  arch/microblaze/pci/pci-common.c         |  192 ----------------------------
> >  arch/powerpc/include/asm/pci-bridge.h    |    5 +-
> >  arch/powerpc/kernel/pci-common.c         |  192 ----------------------------
> 
> Is there anyone on linuxppc-dev/linux-mips that can help test this patchset?
> 
> I've tested that it builds on powerpc with a variety of configs (some which
> include fsl_pci.c implementation). Though I don't have hardware to verify that
> it works.
> 
> I haven't tested this builds or runs on MIPS.
> 
> You shouldn't see any difference in behaviour or new warnings and PCI devices
> should continue to operate as before.

I've got through a line-by-line comparison between powerpc, microblaze,
and then new code. The differences are purely cosmetic, so I have
absolutely no concerns about this patch. I've applied it to my tree.

g.
