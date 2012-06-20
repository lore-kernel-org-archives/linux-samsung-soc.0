From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH-Resend 1/2] ARM: EXYNOS: Update HSOTG PHY clock setting for
 Exynos4x12
Date: Wed, 20 Jun 2012 13:28:21 +0900
Message-ID: <028d01cd4e9d$1ff5b200$5fe11600$%kim@samsung.com>
References: <1337849726-17744-1-git-send-email-sachin.kamat@linaro.org>
 <019e01cd4df8$b01a8a90$104f9fb0$%kim@samsung.com>
 <CAK9yfHw8oeW2D4G2izKu2W6-bXB84cML7+nsFBJRDd08qd5=0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41266 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab2FTE2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 00:28:22 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5W00KBKF0M9RI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:28:21 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5W002OUF39YE20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:28:21 +0900 (KST)
In-reply-to: <CAK9yfHw8oeW2D4G2izKu2W6-bXB84cML7+nsFBJRDd08qd5=0g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Sachin Kamat wrote:
> 
> On 19/06/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Sachin Kamat wrote:
> >>
> >> Adds clock setting entries for Exynos4212 and Exynos4412 platforms.
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> ---
> >>  arch/arm/mach-exynos/include/mach/regs-usb-phy.h |   20 ++++++--
> >>  arch/arm/mach-exynos/setup-usb-phy.c             |   55
> > ++++++++++++++++-----
> >>  arch/arm/plat-samsung/include/plat/cpu.h         |    4 ++
> >>  3 files changed, 61 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> >> b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> >> index c337cf3..0727773 100644
> >> --- a/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> >> +++ b/arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> >> @@ -35,11 +35,21 @@
> >>  #define PHY1_COMMON_ON_N		(1 << 7)
> >>  #define PHY0_COMMON_ON_N		(1 << 4)
> >>  #define PHY0_ID_PULLUP			(1 << 2)
> >> -#define CLKSEL_MASK			(0x3 << 0)
> >> -#define CLKSEL_SHIFT			(0)
> >> -#define CLKSEL_48M			(0x0 << 0)
> >> -#define CLKSEL_12M			(0x2 << 0)
> >> -#define CLKSEL_24M			(0x3 << 0)
> >> +
> >> +#define EXYNOS4_CLKSEL_SHIFT		(0)
> >> +
> >> +#define EXYNOS4210_CLKSEL_MASK		(0x3 << 0)
> >> +#define EXYNOS4210_CLKSEL_48M		(0x0 << 0)
> >> +#define EXYNOS4210_CLKSEL_12M		(0x2 << 0)
> >> +#define EXYNOS4210_CLKSEL_24M		(0x3 << 0)
> >> +
> >> +#define EXYNOS4X12_CLKSEL_MASK		(0x7 << 0)
> >> +#define EXYNOS4X12_CLKSEL_9600K		(0x0 << 0)
> >> +#define EXYNOS4X12_CLKSEL_10M		(0x1 << 0)
> >> +#define EXYNOS4X12_CLKSEL_12M		(0x2 << 0)
> >> +#define EXYNOS4X12_CLKSEL_19200K	(0x3 << 0)
> >> +#define EXYNOS4X12_CLKSEL_20M		(0x4 << 0)
> >> +#define EXYNOS4X12_CLKSEL_24M		(0x5 << 0)
> >>
> >>  #define EXYNOS4_RSTCON			EXYNOS4_HSOTG_PHYREG(0x08)
> >>  #define HOST_LINK_PORT_SWRST_MASK	(0xf << 6)
> >> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-
> >> exynos/setup-usb-phy.c
> >> index 1af0a7f..8f90ce0 100644
> >> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> >> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> >> @@ -31,22 +31,51 @@ static void exynos4210_usb_phy_clkset(struct
> >> platform_device *pdev)
> >>  	struct clk *xusbxti_clk;
> >>  	u32 phyclk;
> >>
> >> -	/* set clock frequency for PLL */
> >> -	phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
> >>
> >>  	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
> >>  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> >> -		switch (clk_get_rate(xusbxti_clk)) {
> >> -		case 12 * MHZ:
> >> -			phyclk |= CLKSEL_12M;
> >> -			break;
> >> -		case 24 * MHZ:
> >> -			phyclk |= CLKSEL_24M;
> >> -			break;
> >> -		default:
> >> -		case 48 * MHZ:
> >> -			/* default reference clock */
> >> -			break;
> >> +		if (soc_is_exynos4210()) {
> >> +			/* set clock frequency for PLL */
> >> +			phyclk = readl(EXYNOS4_PHYCLK) &
> >> ~EXYNOS4210_CLKSEL_MASK;
> >> +
> >> +			switch (clk_get_rate(xusbxti_clk)) {
> >> +			case 12 * MHZ:
> >> +				phyclk |= EXYNOS4210_CLKSEL_12M;
> >> +				break;
> >> +			case 24 * MHZ:
> >> +				phyclk |= EXYNOS4210_CLKSEL_24M;
> >> +				break;
> >> +			default:
> >> +			case 48 * MHZ:
> >> +				/* default reference clock */
> >
> > Shouldn't this 24Mhz? Because the clk_xusbxti.rate is 24Mhz in most
> board
> > file?
> 
> Yes, you are right. I will modify the same.
> 
> >
> >> +				break;
> >> +			}
> >> +		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
> >> +			/* set clock frequency for PLL */
> >> +			phyclk = readl(EXYNOS4_PHYCLK) &
> >> ~EXYNOS4X12_CLKSEL_MASK;
> >> +
> >> +			switch (clk_get_rate(xusbxti_clk)) {
> >> +			case 9600 * KHZ:
> >> +				phyclk |= EXYNOS4X12_CLKSEL_9600K;
> >> +				break;
> >> +			case 10 * MHZ:
> >> +				phyclk |= EXYNOS4X12_CLKSEL_10M;
> >> +				break;
> >> +			case 12 * MHZ:
> >> +				phyclk |= EXYNOS4X12_CLKSEL_12M;
> >> +				break;
> >> +			case 19200 * KHZ:
> >> +				phyclk |= EXYNOS4X12_CLKSEL_19200K;
> >> +				break;
> >> +			case 20 * MHZ:
> >> +				phyclk |= EXYNOS4X12_CLKSEL_20M;
> >> +				break;
> >
> > Please list in order of the value?
> 
> I think they are already in increasing values in MHz (9.6, 10, 12,
> 19.2, 20 and 24).
> Please let me know if this is what you meant.
> 
Ah, OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
