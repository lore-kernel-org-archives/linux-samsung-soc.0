From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Tue, 24 Jan 2017 20:26:36 +0200
Message-ID: <20170124182636.qyh4zki4zuktm3u7@kozik-lap>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
 <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
 <20170124175206.m2hquaf7eylslydq@kozik-lap>
 <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35446 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750774AbdAXS0m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 13:26:42 -0500
Received: by mail-wm0-f66.google.com with SMTP id d140so36686175wmd.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2017 10:26:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, Jan 24, 2017 at 02:57:00PM -0300, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 01/24/2017 02:52 PM, Krzysztof Kozlowski wrote:
> > On Tue, Jan 24, 2017 at 01:45:28PM +0100, Andrzej Hajda wrote:
> >> LDO7 regulator beside DSI and HDMI provides power for core blocks in Exynos
> >> 5433 SoC. Disabling it causes serious current leak - about 200mA.
> >>
> >> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> >> ---
> >>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> index 5f1e172..b22bec8 100644
> >> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> @@ -432,6 +432,10 @@
> >>  				regulator-name = "VDD18_MIPI2L_1.8V_AP";
> >>  				regulator-min-microvolt = <1800000>;
> >>  				regulator-max-microvolt = <1800000>;
> 
> I see you already applied, but I think it would be good to have some comments
> here explaining why the regulator should be always-on. Otherwise, in future a
> developer might want to disable the regulator since it may think that is not
> needed due dsi and hdmi already enabling it.

It is a good idea however we never put such information for other
regulators... If agreed, we might make it a requirement for new DTS and
new changes.

Anyway one could get this from the log itself.

> 
> >> +				regulator-always-on;
> >> +				regulator-state-mem {
> >> +					regulator-off-in-suspend;
> >> +				};
> > 
> > Thanks, applied.
> >
> > Just to satisfy my curiosity, how disabling the regulator causes current
> > leak? What happens exactly?
> >
> 
> I was wondering the same.
> 
