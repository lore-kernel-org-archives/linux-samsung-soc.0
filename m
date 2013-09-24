From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix PL330 MDMA1 address in DT for Universal
 C210 board
Date: Tue, 24 Sep 2013 12:41:09 +0200
Message-ID: <6623559.ohkzlhvA2o@amdc1032>
References: <8667689.9TcYbn9cHO@amdc1032> <5328103.I4Op9muCR3@amdc1032>
 <000001ceb912$2df4a240$89dde6c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42953 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784Ab3IXKlO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 06:41:14 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MTM005BGLOIJHO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Sep 2013 19:41:13 +0900 (KST)
In-reply-to: <000001ceb912$2df4a240$89dde6c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>


Hi,

On Tuesday, September 24, 2013 07:38:13 PM Kukjin Kim wrote:
> Bartlomiej Zolnierkiewicz wrote:
> > 
> > 
> > Hi Kukjin,
> > 
> Hi Bart,
> 
> > Could you please apply this patch?
> > 
> Can you make sure there is no rev1 for universal c210 board?

Universal C210 always used Exynos4210 rev0.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> - Kukjin
> 
> > Best regards,
> > --
> > Bartlomiej Zolnierkiewicz
> > Samsung R&D Institute Poland
> > Samsung Electronics
> > 
> > On Tuesday, August 20, 2013 01:22:45 PM Bartlomiej Zolnierkiewicz wrote:
> > > Revision 0 of Exynos4210 SoC (used on Universal C210 board) requires
> > > 'secure' PL330 MDMA1 address (0x12840000) instead of 'non-secure' one
> > > (0x12850000). Fix it by overriding the default PL330 MDMA1 address in
> > > exynos4210-universal_c210.dts.
> > >
> > > This is a Device Tree (DT) version of commit 91280e7 ("ARM: EXYNOS:
> > > PL330 MDMA1 fix for revision 0 of Exynos4210 SOC") and fixes recent
> > > regression caused by conversion to DT-only setup on ARM EXYNOS.
> > >
> > > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > >  arch/arm/boot/dts/exynos4210-universal_c210.dts | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> > b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> > > index 889cdad..d2e3f5f 100644
> > > --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> > > +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> > > @@ -350,3 +350,7 @@
> > >  		status = "okay";
> > >  	};
> > >  };
> > > +
> > > +&mdma1 {
> > > +	reg = <0x12840000 0x1000>;
> > > +};
