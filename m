From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4x12-pinctrl: Correct pin configuration of
 SD 4
Date: Tue, 12 Feb 2013 10:49:39 -0800
Message-ID: <1d7401ce0951$b7cd9e70$2768db50$@samsung.com>
References: <1360578073-16207-1-git-send-email-s.shirish@samsung.com>
 <2881673.R8geCWDSpT@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47465 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933812Ab3BLSuB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 13:50:01 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI400K01EZ61B00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 03:49:59 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI400JI9EZ91J80@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 03:49:59 +0900 (KST)
In-reply-to: <2881673.R8geCWDSpT@amdc1227>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Shirish S' <s.shirish@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Tomasz Figa wrote:
> 
> On Monday 11 of February 2013 05:21:13 Shirish S wrote:
> > This patch corrects the pin function value of sd4_bus8 from 3
> > to 4.
> > This is verified on origen board for testing eMMC on
> > dw_mci controller.
> >
> > Signed-off-by: Shirish S <s.shirish@samsung.com>
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> > b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi index 8e6115a..099cec7
> > 100644
> > --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> > @@ -661,7 +661,7 @@
> >
> >  		sd4_bus8: sd4-bus-width8 {
> >  			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-
> 6";
> > -			samsung,pin-function = <3>;
> > +			samsung,pin-function = <4>;
> >  			samsung,pin-pud = <4>;
> >  			samsung,pin-drv = <3>;
> >  		};
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Applied into next/fixes-samsung for v3.9 because this is not a critical bug
fix.

BTW, I'd preferred to use 'ARM: dts: .... for exynos4x12-pinctrl' in subject
because if we use the title like "ARM: dts: exynos4x12-pinctrl: ...", the
main description should be moved back and head of subject is a bit long. So
sometimes we cannot understand the title in the e-mail box before
checking/opening the patch. See below. 

Shirish S   [PATCH] ARM: dts: exynos4x12-pinctrl: Correct pin...
Mon/2/11/2013 ...
Shirish S   [PATCH] ARM: dts: Correct pin configuration of SD...
Mon/2/11/2013 ...

Thanks.

- Kukjin
