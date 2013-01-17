From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Add vmmc regulator node in
 exynos4412-origen.dts
Date: Thu, 17 Jan 2013 15:59:47 -0800
Message-ID: <001a01cdf50e$bbead8d0$33c08a70$@samsung.com>
References: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
 <5436877.rqOLY7SjmE@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45754 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754301Ab3ARAAB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 19:00:01 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGS00IXMNZ4Y700@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 08:59:59 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGS009ICNZXKZB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 08:59:59 +0900 (KST)
In-reply-to: <5436877.rqOLY7SjmE@amdc1227>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Tomasz Figa wrote:
> 
> Hi Sachin,
> 
> On Thursday 17 of January 2013 11:18:12 Sachin Kamat wrote:
> > Added vmmc regulator node in exynos4412-origen.dts file.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  arch/arm/boot/dts/exynos4412-origen.dts |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> > b/arch/arm/boot/dts/exynos4412-origen.dts index df880c4..fe70bc6
> 100644
> > --- a/arch/arm/boot/dts/exynos4412-origen.dts
> > +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> > @@ -27,6 +27,15 @@
> >  		bootargs ="console=ttySAC2,115200";
> >  	};
> >
> > +	mmc_reg: voltage-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VMEM_VDD_2.8V";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +		gpio = <&gpx1 1 0>;
> > +		enable-active-high;
> > +	};
> > +
> >  	serial@13800000 {
> >  		status = "okay";
> >  	};
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Looks good to me, applied 1/2 and 2/2.

Thanks for review and posting.

- Kukjin
