From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add MFC node for exynos 5420
Date: Wed, 19 Jun 2013 11:50:50 +0200
Message-ID: <6487672.YargYngruR@amdc1227>
References: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
 <1371631969-10076-2-git-send-email-arun.kk@samsung.com>
 <CAK9yfHw2GETii9gvuSkUE53DaqBuy7+srhKpOxJX=N7iRBAz1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16160 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933830Ab3FSJvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 05:51:00 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOM00GB2WG1U5B0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 10:50:58 +0100 (BST)
In-reply-to: <CAK9yfHw2GETii9gvuSkUE53DaqBuy7+srhKpOxJX=N7iRBAz1w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, arunkk.samsung@gmail.com

Hi Arun, Sachin,

On Wednesday 19 of June 2013 14:54:01 Sachin Kamat wrote:
> On 19 June 2013 14:22, Arun Kumar K <arun.kk@samsung.com> wrote:
> > The patch adds MFC nodes for exynos 5420 and for
> > smdk 5420 board.
> > 
> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> > ---
> > 
> >  arch/arm/boot/dts/exynos5420-smdk5420.dts |    5 +++++
> >  arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > b/arch/arm/boot/dts/exynos5420-smdk5420.dts index 08607df..682532c 100644
> > --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > @@ -30,4 +30,9 @@
> > 
> >                         clock-frequency = <24000000>;
> >                 
> >                 };
> >         
> >         };
> > 
> > +
> > +       codec@11000000 {
> > +               samsung,mfc-r = <0x43000000 0x800000>;
> > +               samsung,mfc-l = <0x51000000 0x800000>;
> > +       };
> > 
> >  };
> > 
> > diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> > b/arch/arm/boot/dts/exynos5420.dtsi index 8474d63..cb74356 100644
> > --- a/arch/arm/boot/dts/exynos5420.dtsi
> > +++ b/arch/arm/boot/dts/exynos5420.dtsi
> > @@ -100,4 +100,12 @@
> > 
> >                 clocks = <&clock 260>, <&clock 131>;
> >                 clock-names = "uart", "clk_uart_baud0";
> >         
> >         };
> > 
> > +
> > +       codec@11000000 {
> > +               compatible = "samsung,mfc-v7";
> > +               reg = <0x11000000 0x10000>;
> > +               interrupts = <0 96 0>;
> > +               clocks = <&clock 401>;
> > +               clock-names = "mfc";
> > +       };
> 
> I think it is better if we disable the IPs in dtsi file and enbale
> them in respective board files as was followed for Exynos4.

+1

Best regards,
Tomasz
