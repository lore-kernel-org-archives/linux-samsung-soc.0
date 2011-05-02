From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Suspend: Fix build error on ARCH_S5PC100
Date: Mon, 02 May 2011 10:09:55 +0900
Message-ID: <07e601cc0865$b08be8e0$11a3baa0$%kim@samsung.com>
References: <1301710155-16373-1-git-send-email-kgene.kim@samsung.com>
 <20110402091904.GH8482@n2100.arm.linux.org.uk>
 <02c701cbf2be$0ebebb80$2c3c3280$%kim@samsung.com>
 <20110428184332.GK17290@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18106 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752305Ab1EBBKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 May 2011 21:10:17 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKJ005GDN8HPPC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 May 2011 10:10:13 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKJ00A44N908C@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 May 2011 10:10:13 +0900 (KST)
In-reply-to: <20110428184332.GK17290@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Mon, Apr 04, 2011 at 08:47:17PM +0900, Kukjin Kim wrote:
> > Russell King - ARM Linux wrote:
> > >
> > > On Sat, Apr 02, 2011 at 11:09:15AM +0900, Kukjin Kim wrote:
> > > > The current mainline codes of ARCH_S5PC100 can not support
> > > > suspend to ram. So needs this for preventing build error.
> > > >
> > > > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > > > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > > > ---
> > > > Oops, I missed this in my previous patch.
> > > >
> > > > As I know, firstly ARCH_S5P64X0 will support suspend to ram
> > > > then ARCH_S5PC100 will do it. But right now, we need this.
> > >
> > > I'd much rather do this a different way - let me know if this means
> > > the SoC based dependencies can be dropped.  Patches to follow.
> >
> > Yeah, I checked your patches. It's ok to me but this is also needed
right
> > now for preventing build errors with s5pc100_defconfig...because there
is
> no
> > regarding headers for supporting suspend to ram.
> >
> > However as I mentioned, the suspend to ram will be supported soon on
them
> > then we can drop its dependencies.
> 
> Could I have an updated patch which applies to mainline please?

From: Kukjin Kim <kgene.kim@samsung.com>
Date: Mon, 2 May 2011 09:33:01 +0900
Subject: [PATCH] ARM: Suspend: Fix build error on ARCH_S5PC100

The current mainline codes of ARCH_S5PC100 cannot support
suspend to ram. So needs this for preventing build error.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 377a7a5..96839d9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2010,7 +2010,7 @@ menu "Power management options"
 source "kernel/power/Kconfig"

 config ARCH_SUSPEND_POSSIBLE
-	depends on !ARCH_S5P64X0 && !ARCH_S5P6442
+	depends on !ARCH_S5P64X0 && !ARCH_S5P6442 && !ARCH_S5PC100
 	depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
 		CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 || CPU_XSCALE
 	def_bool y
-- 

If any problems, please let me know.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
