From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH] ARM: dts: Remove DP PHY node from exynos5250.dtsi
Date: Mon, 26 Aug 2013 12:12:57 +0530
Message-ID: <CAD025yTVbZnycfwQKq8OEL_WBzDbQECFQt-ZTuwpCXbWhtTv+A@mail.gmail.com>
References: <003401cea225$a3dc0c40$eb9424c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:40967 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755929Ab3HZGnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 02:43:19 -0400
Received: by mail-la0-f53.google.com with SMTP id el20so2011473lab.26
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Aug 2013 23:43:17 -0700 (PDT)
In-Reply-To: <003401cea225$a3dc0c40$eb9424c0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>

Hi Mr. Han,

On 26 August 2013 11:59, Jingoo Han <jg1.han@samsung.com> wrote:
> Since DP PHY driver is not yet merged, DP PHY node should be
> removed from exynos5250.dtsi.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 864ae90..72aec7f 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -625,17 +625,16 @@
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
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +

I think you can skip the above 2 lines, as those are already present
in exynos5.dtsi.


> +               dptx-phy {
> +                       reg = <0x10040720>;
> +                       samsung,enable-mask = <1>;
> +               };
>         };
>
>         fimd@14400000 {
> --
> 1.7.10.4
>
>



-- 
Thanks and Regards
 Vikas Sajjan
