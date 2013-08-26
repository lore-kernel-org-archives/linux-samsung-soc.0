From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH V2] ARM: dts: Remove DP PHY node from exynos5250.dtsi
Date: Mon, 26 Aug 2013 12:37:40 +0530
Message-ID: <CAD025yS2XoQ_GNk_qvo4b0r52idrAfFCXxJzojxMvP74UMrc3w@mail.gmail.com>
References: <003601cea228$ef97fd30$cec7f790$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:40241 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756478Ab3HZHIC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 03:08:02 -0400
Received: by mail-la0-f50.google.com with SMTP id es20so1947091lab.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 00:08:00 -0700 (PDT)
In-Reply-To: <003601cea228$ef97fd30$cec7f790$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>

On 26 August 2013 12:23, Jingoo Han <jg1.han@samsung.com> wrote:
> Since DP PHY driver is not yet merged, DP PHY node should be
> removed from exynos5250.dtsi.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Changes since v1:
> - Removed duplicated properties such as #address-cells, #size-cells.
>
>  arch/arm/boot/dts/exynos5250.dtsi |   13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 864ae90..c3d6e3b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -625,17 +625,14 @@
>                 interrupts = <0 94 0>;
>         };
>
> -       dp_phy: video-phy@10040720 {
> -               compatible = "samsung,exynos5250-dp-video-phy";
> -               reg = <0x10040720 4>;
> -               #phy-cells = <0>;
> -       };
> -
>         dp-controller@145B0000 {
>                 clocks = <&clock 342>;
>                 clock-names = "dp";
> -               phys = <&dp_phy>;
> -               phy-names = "dp";
> +
> +               dptx-phy {
> +                       reg = <0x10040720>;
> +                       samsung,enable-mask = <1>;
> +               };
>         };
>

Reviewed-by: Vikas Sajjan <vikas.sajjan@linaro.org>


>         fimd@14400000 {
> --
> 1.7.10.4
>
>



-- 
Thanks and Regards
 Vikas Sajjan
