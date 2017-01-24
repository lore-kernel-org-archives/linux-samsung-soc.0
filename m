From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Tue, 24 Jan 2017 19:52:06 +0200
Message-ID: <20170124175206.m2hquaf7eylslydq@kozik-lap>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
 <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34421 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750732AbdAXRwL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 12:52:11 -0500
Received: by mail-wm0-f65.google.com with SMTP id c85so36222672wmi.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2017 09:52:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, Jan 24, 2017 at 01:45:28PM +0100, Andrzej Hajda wrote:
> LDO7 regulator beside DSI and HDMI provides power for core blocks in Exynos
> 5433 SoC. Disabling it causes serious current leak - about 200mA.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 5f1e172..b22bec8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -432,6 +432,10 @@
>  				regulator-name = "VDD18_MIPI2L_1.8V_AP";
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};

Thanks, applied.

Just to satisfy my curiosity, how disabling the regulator causes current
leak? What happens exactly?

Best regards,
Krzysztof
