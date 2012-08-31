From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Use active low flag for gpio-keys on Origen
Date: Fri, 31 Aug 2012 13:03:08 +0530
Message-ID: <CAJuYYwRq6Ckb-a_cKF7c7cteP1m5h7SuXOEHgMSC_WsjFy+8rA@mail.gmail.com>
References: <1346386430-3619-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:53411 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751774Ab2HaHdK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 03:33:10 -0400
Received: by lagy9 with SMTP id y9so2089345lag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Aug 2012 00:33:08 -0700 (PDT)
In-Reply-To: <1346386430-3619-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, patches@linaro.org, Olof Johansson <olof@lixom.net>

On 31 August 2012 09:43, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Commit: f447ed8b31d (gpio: samsung: add flags specifier to
> device-tree binding) adds a flag to represent active low state
> for gpio line. Since gpio-keys on Origen board are active low,
> using this flag to represent the same.
>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index 0c49caa..c37edf0 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -62,31 +62,31 @@
>
>                 up {
>                         label = "Up";
> -                       gpios = <&gpx2 0 0 0 2>;
> +                       gpios = <&gpx2 0 0 0x10000 2>;
>                         linux,code = <103>;
>                 };
>
>                 down {
>                         label = "Down";
> -                       gpios = <&gpx2 1 0 0 2>;
> +                       gpios = <&gpx2 1 0 0x10000 2>;
>                         linux,code = <108>;
>                 };
>
>                 back {
>                         label = "Back";
> -                       gpios = <&gpx1 7 0 0 2>;
> +                       gpios = <&gpx1 7 0 0x10000 2>;
>                         linux,code = <158>;
>                 };
>
>                 home {
>                         label = "Home";
> -                       gpios = <&gpx1 6 0 0 2>;
> +                       gpios = <&gpx1 6 0 0x10000 2>;
>                         linux,code = <102>;
>                 };
>
>                 menu {
>                         label = "Menu";
> -                       gpios = <&gpx1 5 0 0 2>;
> +                       gpios = <&gpx1 5 0 0x10000 2>;
>                         linux,code = <139>;
>                 };
>         };
> --
> 1.7.4.1
>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
