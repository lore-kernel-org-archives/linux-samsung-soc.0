From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning in
 setup-usb-phy.c file
Date: Thu, 12 Jul 2012 18:30:39 +0900
Message-ID: <0fb601cd6011$0014b500$003e1f00$%kim@samsung.com>
References: <1341899860-17979-1-git-send-email-sachin.kamat@linaro.org>
 <0fa801cd600e$1b1e6d80$515b4880$%kim@samsung.com>
 <CAK9yfHw=obimeLs_sKA-kJuD1yRF_65gPzirHvvJnZ_uKa1gqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36767 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757206Ab2GLJaw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:30:52 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M71008VUJR3QTX0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:30:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71003T5JR39340@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:30:39 +0900 (KST)
In-reply-to: <CAK9yfHw=obimeLs_sKA-kJuD1yRF_65gPzirHvvJnZ_uKa1gqw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, patches@linaro.org



> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Thursday, July 12, 2012 6:22 PM
> To: Kukjin Kim
> Cc: linux-samsung-soc@vger.kernel.org; arnd@arndb.de; patches@linaro.org
> Subject: Re: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning in setup-
> usb-phy.c file
> 
> On 12/07/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Sachin Kamat wrote:
> >>
> >> Fixes the following warning:
> >> arch/arm/mach-exynos/setup-usb-phy.c: In function
> >> 'exynos4210_usb_phy_clkset':
> >> arch/arm/mach-exynos/setup-usb-phy.c:83:2:
> >> warning: 'phyclk' may be used uninitialized in this function [-
> >> Wuninitialized]
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> ---
> >>  arch/arm/mach-exynos/setup-usb-phy.c |    8 ++++----
> >>  1 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-
> >> exynos/setup-usb-phy.c
> >> index d26deb7..1eaa0b0 100644
> >> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> >> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> >> @@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct
> >> platform_device *pdev)
> >>  	struct clk *xusbxti_clk;
> >>  	u32 phyclk;
> >>
> >> -
> >>  	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
> >>  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> >>  		if (soc_is_exynos4210()) {
> >> @@ -50,6 +49,8 @@ static void exynos4210_usb_phy_clkset(struct
> >> platform_device *pdev)
> >>  				phyclk |= EXYNOS4210_CLKSEL_48M;
> >>  				break;
> >>  			}
> >> +			clk_put(xusbxti_clk);
> >> +			writel(phyclk, EXYNOS4_PHYCLK);
> >>  		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
> >>  			/* set clock frequency for PLL */
> >>  			phyclk = readl(EXYNOS4_PHYCLK) &
> >> ~EXYNOS4X12_CLKSEL_MASK;
> >> @@ -76,11 +77,10 @@ static void exynos4210_usb_phy_clkset(struct
> >> platform_device *pdev)
> >>  				phyclk |= EXYNOS4X12_CLKSEL_24M;
> >>  				break;
> >>  			}
> >> +			clk_put(xusbxti_clk);
> >> +			writel(phyclk, EXYNOS4_PHYCLK);
> >>  		}
> >> -		clk_put(xusbxti_clk);
> >>  	}
> >> -
> >> -	writel(phyclk, EXYNOS4_PHYCLK);
> >>  }
> >>
> >>  static int exynos4210_usb_phy0_init(struct platform_device *pdev)
> >> --
> >> 1.7.4.1
> >
> > Well, I think, following is enough?
> No. That will still give the same warning if none of the cases are true.
> 
Oops, yeah I missed :(

Yeah, the writing should being inside of 'if' and 'else if' which phyclk is
read.

OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> >
> > And if you're ok on this, I will squash into your original one which is
> > still in my tree.
> 
> OK.
> 
> >
> > diff --git a/arch/arm/mach-exynos/setup-usb-phy.c
> > b/arch/arm/mach-exynos/setup-usb-phy.c
> > index d26deb7..3f82414 100644
> > --- a/arch/arm/mach-exynos/setup-usb-phy.c
> > +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> > @@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct
> > platform_device *pdev)
> >  	struct clk *xusbxti_clk;
> >  	u32 phyclk;
> >
> > -
> >  	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
> >  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> >  		if (soc_is_exynos4210()) {
> > @@ -78,9 +77,8 @@ static void exynos4210_usb_phy_clkset(struct
> > platform_device *pdev)
> >  			}
> >  		}
> >  		clk_put(xusbxti_clk);
> > +		writel(phyclk, EXYNOS4_PHYCLK);
> >  	}
> > -
> > -	writel(phyclk, EXYNOS4_PHYCLK);
> >  }
> >
> >  static int exynos4210_usb_phy0_init(struct platform_device *pdev)
> >
> > Thanks.
> >
> > Best regards,
> > Kgene.
> > --
> > Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> > SW Solution Development Team, Samsung Electronics Co., Ltd.
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> 
> --
> With warm regards,
> Sachin
