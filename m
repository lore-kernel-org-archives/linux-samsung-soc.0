From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC PATCH 14/14] ARM: dts: exynos5420: add dsi node
Date: Tue, 15 Apr 2014 13:34:07 +0530
Message-ID: <CAK9yfHyC4gvj6eLQnJ1k=6=q2NXOS2ePyBC5rz1poOsN+1x3zg@mail.gmail.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
	<1397540862-21359-15-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:32939 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbaDOIEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 04:04:08 -0400
Received: by mail-ob0-f173.google.com with SMTP id wn1so2846162obc.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 01:04:07 -0700 (PDT)
In-Reply-To: <1397540862-21359-15-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Hi YoungJun,

On 15 April 2014 11:17, YoungJun Cho <yj44.cho@samsung.com> wrote:
> This patch adds common part of dsi node.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index f0184c7..aa2350a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -422,6 +422,20 @@
>                 #phy-cells = <1>;
>         };
>
> +       dsi@14500000 {
> +               compatible = "samsung,exynos5420-mipi-dsi";
> +               reg = <0x14500000 0x10000>;
> +               interrupts = <0 82 0>;
> +               samsung,power-domain = <&disp_pd>;
> +               phys = <&mipi_phy 1>;
> +               phy-names = "dsim";
> +               clocks = <&clock 411>, <&clock 146>;

Please use macros instead of numbers.

> +               clock-names = "bus_clk", "pll_clk";
> +               status = "disabled";

nit: Move this to the end for readability.

-- 
With warm regards,
Sachin
