From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Enable USB hub on Arndale
Date: Wed, 14 Aug 2013 16:00:16 +0530
Message-ID: <CAHbNUh2WTiRtvvUnqa7NSvRgZ22XdaEMb57w2umF5Jfhf_yohg@mail.gmail.com>
References: <1376474314-32491-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:46625 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759628Ab3HNKaR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 06:30:17 -0400
Received: by mail-oa0-f47.google.com with SMTP id g12so12768589oah.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 03:30:16 -0700 (PDT)
In-Reply-To: <1376474314-32491-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 14 August 2013 15:28, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> The Arndale has a SMSC USB3503 connected in hardware only mode like a PHY,
> support it using the usb-nop-xceiv binding.
>
> Note that due to a regrettable decision to use a regulator to represent
> the reset signal this uses a fixed voltage regulator to do that, there
> is a plan to use the reset controller binding once that is merged so it
> does not seem worthwhile to fix the usb-nop-xceiv driver at this point.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>
> This doesn't 100% work right now since we don't yet have a solution to
> ensure that this gets started after the USB controller but those
> modifications are small (or can be done at runtime with module loading).
>
>  arch/arm/boot/dts/exynos5250-arndale.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 96d528d..e477e23 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -539,4 +539,22 @@
>         rtc {
>                 status = "okay";
>         };
> +
> +       usb_hub_bus {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               // SMSC USB3503 connected in hardware only mode as a PHY
> +               usb_hub: usb_hub {
> +                       compatible = "smsc,usb3503a";
> +
> +                       reset-gpios = <&gpx3 5 1>;
> +                       connect-gpios = <&gpd1 7 1>;
> +               };
> +       };
> +


> +       usb@12110000 {
> +               usb-phy = <&usb2_phy>;
> +       };

ehci-s5p driver doesn't use 'usb-phy' property to find the PHY driver,
hence this is not required.

Without this change,
Tested-by: Tushar Behera <tushar.behera@linaro.org>

-- 
Tushar Behera
