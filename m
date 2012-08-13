From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM: S5PV310: Set bit 22 in the PL310 (cache
 controller) AuxCtlr register
Date: Mon, 13 Aug 2012 08:39:44 +0100
Message-ID: <20120813073944.GA13508@arm.com>
References: <1289976931-9759-1-git-send-email-kgene.kim@samsung.com>
 <1289984848.2351.2.camel@e102109-lin.cambridge.arm.com>
 <CAPub14_9vNoiOMEeBDSkJo6NQaazcNvAYu8oD_E2ReEYLfrX+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:55414 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751797Ab2HMHzn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Aug 2012 03:55:43 -0400
Content-Disposition: inline
In-Reply-To: <CAPub14_9vNoiOMEeBDSkJo6NQaazcNvAYu8oD_E2ReEYLfrX+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: shiraz hashim <shiraz.linux.kernel@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Changhwan Youn <chaos.youn@samsung.com>, "stable@kernel.org" <stable@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Aug 13, 2012 at 08:21:14AM +0100, shiraz hashim wrote:
> On Wed, Nov 17, 2010 at 2:37 PM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> >
> > On Wed, 2010-11-17 at 06:55 +0000, Kukjin Kim wrote:
> > > --- a/arch/arm/mach-s5pv310/cpu.c
> > > +++ b/arch/arm/mach-s5pv310/cpu.c
> > > @@ -168,7 +168,7 @@ static int __init s5pv310_l2x0_cache_init(void)
> > >         __raw_writel(L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN,
> > >                      S5P_VA_L2CC + L2X0_POWER_CTRL);
> > >
> > > -       l2x0_init(S5P_VA_L2CC, 0x7C070001, 0xC200ffff);
> > > +       l2x0_init(S5P_VA_L2CC, 0x7C470001, 0xC200ffff);
> >
> > The patch is fine.
> >
> > But I think we should also set this bit in the cache-l2x0.c file if
> > PL310. That's such a fundamental issue and it's easy to miss in the
> > platform code.
> 
> Sorry for reviving this old patch but any reasons why it didn't
> go to the cache-l2x0.c directly (for PL310).

The cache-l2x0.c patch has been around for a while:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=6529/1

It may no longer apply cleanly but I haven't revived it since it wasn't
accepted at the time.

-- 
Catalin
