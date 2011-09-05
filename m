From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: EXYNOS4: Add support for 8-bit bus width in SDHCI
 for ORIGEN
Date: Mon, 05 Sep 2011 19:27:54 +0900
Message-ID: <002801cc6bb6$79ea9b60$6dbfd220$%kim@samsung.com>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
 <1314351524-10942-4-git-send-email-tushar.behera@linaro.org>
 <000601cc6779$7fe130b0$7fa39210$%kim@samsung.com> <4E60B715.6090801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56375 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448Ab1IEK15 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 06:27:57 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR1004U1P1SYTF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 19:27:56 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LR100K56P2JHS@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 19:27:56 +0900 (KST)
In-reply-to: <4E60B715.6090801@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:

> 
> On Wednesday 31 August 2011 06:31 AM, Kukjin Kim wrote:
> > Tushar Behera wrote:
> >>
> >> Platform data for SDHCI controller on ORIGEN board is missing the
> >> support for 8-bit bus width. The platform data is extended in sync
> >> with other EXYNOS4 machines.
> >>
> >> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> >> ---
> >>   arch/arm/mach-exynos4/mach-origen.c |    8 ++++++++
> >>   1 files changed, 8 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos4/mach-origen.c
> > b/arch/arm/mach-exynos4/mach-
> >> origen.c
> >> index ae18812..6b6cd77 100644
> >> --- a/arch/arm/mach-exynos4/mach-origen.c
> >> +++ b/arch/arm/mach-exynos4/mach-origen.c
> >> @@ -75,11 +75,19 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
> > __initdata =
> >> {
> >>   static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
> >>   	.cd_type		= S3C_SDHCI_CD_INTERNAL,
> >>   	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> >> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
> >> +	.max_width		= 8,
> >> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> >> +#endif
> >>   };
> >>
> >>   static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
> >>   	.cd_type		= S3C_SDHCI_CD_INTERNAL,
> >>   	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> >> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
> >> +	.max_width		= 8,
> >> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> >> +#endif
> >>   };
> >>
> >>   static struct platform_device *origen_devices[] __initdata = {
> >> --
> >> 1.7.4.1
> >
> > Hi Tushar,
> >
> > I wonder the bus width of SDHCI controller can be changed manually on
ORIGEN
> > like SMDK board.
> >
> Thanks for your review.
> 
> On ORIGEN board, we have wire connections for HSMMC-0/2/3 between the
> MMC port and the SoC. Hence ideally we can work with HSMMC2 in both
> 4-bit and 8-bit mode. However HSMMC0 can only work in 4-bit mode.
> 
> Also IIRC WLAN would be using HSMMC-3 controller for its operations. So
> we would have conflict when HSMMC2 is working in 8-bit mode and WLAN is
> also enabled. Hence it appears better to drop this patch now.
> 
OK.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
