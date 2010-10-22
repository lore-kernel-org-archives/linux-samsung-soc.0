From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5] ARM: S5P6442: Add DMA operation clock
Date: Fri, 22 Oct 2010 14:20:13 +0900
Message-ID: <002b01cb71a8$cf8893f0$6e99bbd0$%kim@samsung.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
 <1287622713-1657-2-git-send-email-kgene.kim@samsung.com>
 <4CC0BD13.5060303@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39104 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752793Ab0JVFTy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Oct 2010 01:19:54 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAO00KDJET4IUC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 14:19:52 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAO009ECET4AM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Oct 2010 14:19:52 +0900 (KST)
In-reply-to: <4CC0BD13.5060303@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Seungwhan Youn' <sw.youn@samsung.com>

Ben Dooks wrote:
> 
> On 21/10/10 01:58, Kukjin Kim wrote:
> > From: Seungwhan Youn <sw.youn@samsung.com>
> >
> > This patch adds DMA operation clock which is disabled as default.
> >
> > Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> > Acked-by: Jassi Brar <jassi.brar@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-s5p6442/clock.c                   |   28
> +++++++++++++++++++++++
> >  arch/arm/mach-s5p6442/include/mach/regs-clock.h |    1 +
> >  2 files changed, 29 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5p6442/clock.c
b/arch/arm/mach-s5p6442/clock.c
> > index dcd20f1..16d6e7e 100644
> > --- a/arch/arm/mach-s5p6442/clock.c
> > +++ b/arch/arm/mach-s5p6442/clock.c
> > @@ -192,6 +192,11 @@ static struct clk clk_pclkd1 = {
> >  	.parent		= &clk_hclkd1,
> >  };
> >
> > +int s5p6442_clk_ip0_ctrl(struct clk *clk, int enable)
> > +{
> > +	return s5p_gatectrl(S5P_CLKGATE_IP0, clk, enable);
> > +}
> > +
> >  int s5p6442_clk_ip3_ctrl(struct clk *clk, int enable)
> >  {
> >  	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
> > @@ -335,6 +340,16 @@ void __init_or_cpufreq s5p6442_setup_clocks(void)
> >  	clk_pclkd1.rate = pclkd1;
> >  }
> >
> > +static struct clk init_clocks_disable[] = {
> > +	{
> > +		.name		= "pdma",
> > +		.id		= -1,
> > +		.parent		= &clk_pclkd1,
> > +		.enable		= s5p6442_clk_ip0_ctrl,
> > +		.ctrlbit	= (1 << 3),
> > +	},
> > +};
> > +
> >  static struct clk init_clocks[] = {
> >  	{
> >  		.name		= "systimer",
> > @@ -393,10 +408,23 @@ static struct clk *clks[] __initdata = {
> >
> >  void __init s5p6442_register_clocks(void)
> >  {
> > +	struct clk *clkptr;
> > +	int i, ret;
> > +
> >  	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
> >
> >  	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
> >  	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
> >
> > +	clkptr = init_clocks_disable;
> > +	for (i = 0; i < ARRAY_SIZE(init_clocks_disable); i++, clkptr++) {
> > +		ret = s3c24xx_register_clock(clkptr);
> > +		if (ret < 0) {
> > +			printk(KERN_ERR "Fail to register clock %s (%d)\n",
> > +					clkptr->name, ret);
> > +		} else
> > +			(clkptr->enable)(clkptr, 0);
> > +	}
> 
> how about using s3c_register_clocks and then s3c_disable_clocks() ?

Yeah, your suggestion is better to me also :-)
But I think other Samsung SoCs need it too..so I'd like to apply this now
then will update all regarding stuff for our Samsung SoCs soon..if you're
ok.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
