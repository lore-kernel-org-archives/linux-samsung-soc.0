From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add initial configuration for
 DISP clocks for TM2/TM2e
Date: Thu, 26 Jan 2017 21:35:29 +0200
Message-ID: <20170126193529.5dyynx5dpmtmje5b@kozik-lap>
References: <CGME20170126123806eucas1p2dfbb67c5248e6c3dd979bdd343a3b7cb@eucas1p2.samsung.com>
 <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
 <1485434274-6579-4-git-send-email-m.szyprowski@samsung.com>
 <CAGTfZH1A49arLe3nRfeYS02M-8052SU6xqhvPMYg_8hRO3yYBA@mail.gmail.com>
 <081f6c7d-2d48-933f-f13b-cb9a0ae7b4b0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33135 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753188AbdAZUFE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 15:05:04 -0500
Received: by mail-wm0-f68.google.com with SMTP id r144so52877874wme.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 12:04:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <081f6c7d-2d48-933f-f13b-cb9a0ae7b4b0@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: cwchoi00@gmail.com, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Jan 26, 2017 at 04:20:22PM +0100, Andrzej Hajda wrote:
> On 26.01.2017 15:49, Chanwoo Choi wrote:
> > Hi Marek
> >

(...)

> >> +       assigned-clock-rates = <278000000>, <400000000>;
> > Except for setting the assigned-clock-rate for CLK_FOUT_DISP_PLL,
> > tm2.dts and tm2e.dts has the same dt node of cmu_disp.
> > If there is same value between tm2 and tm2e, you should keep the same value
> > in exynos5433-tm2-common.dtsi.
> >
> > So, I think that exynos5433-tm2-common.dtsi include the relationships
> > between clocks and parent clocks as following without assigning the clocks.
> >
> > And then, each tm2 and tm2e.dts can assign the clock rate for CLK_FOUT_DISP_PLL
> > and CLK_DIV_SCLK_DECON_TV_ECLK.
> >
> > For example,
> > In exynos5433-tm2-common.dtsi
> >
> > &cmu_disp {
> >        assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> >                          <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> >                          <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
> >                          <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
> >                          <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
> >                          <&cmu_disp CLK_MOUT_DISP_PLL>,
> >                          <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> >                          <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> >        assigned-clock-parents = <0>, <0>,
> >                                 <&cmu_mif CLK_ACLK_DISP_333>,
> >                                 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> >                                 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> >                                 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> >                                 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> >                                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
> >                                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
> >                                 <&cmu_disp CLK_FOUT_DISP_PLL>,
> >                                 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> >                                 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> >                                 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> >     };
> >
> >
> > In exynos5433-tm2.dts
> > &cmu_disp {
> >      assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> >                                    <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>;
> >      assigned-clock-rates = <250000000>, <400000000>;
> > };
> >
> >
> > In exynos5433-tm2e.dts
> > &cmu_disp {
> >      assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> >                                   <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>;
> >      assigned-clock-rates = <278000000>, <400000000>;
> > };
> >
> I guess in such case common properties will be overwritten.
> 

Indeed.

> If one really want to put as much as possible into common part it could
> be done this way:
> 
> exynos5433-tm2.dts before '#include "exynos5433-tm2-common.dtsi"':
> 
> #define CLK_FOUT_DISP_PLL_RATE 250000000
> 
> exynos5433-tm2e.dts before '#include "exynos5433-tm2-common.dtsi"':
> 
> #define CLK_FOUT_DISP_PLL_RATE 278000000
> 
> and in exynos5433-tm2-common.dtsi:
> 
> +&cmu_disp {
> +       assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
> +                         <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> +                         <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
> +                         <&cmu_disp CLK_MOUT_DISP_PLL>,
> +                         <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> +       assigned-clock-parents = <0>, <0>,
> +                                <&cmu_mif CLK_ACLK_DISP_333>,
> +                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> +                                <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
> +                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
> +                                <&cmu_disp CLK_FOUT_DISP_PLL>,
> +                                <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> +                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> +       assigned-clock-rates = <CLK_FOUT_DISP_PLL_RATE>, <400000000>;
> +};
> +
> 
> The question is if such macro games will be accepted? :)

Interesting idea... The DTSI would look nice but the real problem is
hidden by a dependency on #define. In the same time one would have two
definitions of this value - when looking at DTSI, one would have to
look at DTS as well. This would be rather a new way of overriding
things (reading DTSI and then jumping to DTS) and I prefer
consistency...

assigned-clocks and assigned-clock-parents are the same, right? Only
assigned-clock-rates differ?

Ideas:
1. Make common assigned-clocks+assigned-clock-parents in DTSI and customize
   only the rates in DTS.
   Mention the reason behind the split for assigned-* properties in a
   comment in all files (common + boards).  Anyone looking at final DTS
   will find that assigned-clocks/parents are somewhere else (and
   vice-versa). Also anyone looking at DTSI will see a comment that one
   part is missing - rates are somewhere else.

2. Duplicate the nodes like it is in Marek's patch but please mention in
   a comment that assigned-clocks+assigned-clock-parents are expected to be
   the same between boards.
   The goal behind the comment is to make reader's life easier:
    - no need to figure out why this is duplicated,
    - if there would be a mistake (difference between boards), then
      easily understand that this was a mistake, not a feature.

The benefit of Andrzej's approach is that there will be compile time
dependency - missing define causes build failure.  In my approach, there
will be only comments. Anyway in all cases the reader have to look at
both DTSI and DTS to find the final answer.

What do you think?

Best regards,
Krzysztof
