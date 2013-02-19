From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v6 16/16] ARM: dts: add board specific fixed rate clock
 nodes for Exynos based platforms
Date: Mon, 18 Feb 2013 21:11:26 -0800
Message-ID: <CAOesGMjXv6DnGKx3=Xvgae_z=Jj5dZ5ncXyRNQ7wmmpSNkh==g@mail.gmail.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
	<1361175686-19400-17-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:63219 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab3BSFL2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Feb 2013 00:11:28 -0500
Received: by mail-we0-f170.google.com with SMTP id z53so5590095wey.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Feb 2013 21:11:26 -0800 (PST)
In-Reply-To: <1361175686-19400-17-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Hi,

On Mon, Feb 18, 2013 at 12:21 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> The clock frequency of xxti and xusbxti clocks is dependent on the frequency of the
> on-board oscillator that is used to generate these clocks. So allow the frequency
> of these clocks to be specfied from device tree.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts   |   12 ++++++++++++
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |   12 ++++++++++++
>  arch/arm/boot/dts/exynos4210-trats.dts    |   12 ++++++++++++
>  arch/arm/boot/dts/exynos4412-odroidx.dts  |   12 ++++++++++++
>  arch/arm/boot/dts/exynos4412-origen.dts   |   12 ++++++++++++
>  arch/arm/boot/dts/exynos4412-smdk4412.dts |   12 ++++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts  |    7 +++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    7 +++++++
>  arch/arm/boot/dts/exynos5250-snow.dts     |    7 +++++++
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts |    7 +++++++
>  10 files changed, 100 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index 052606b..1b30bc8 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -127,4 +127,16 @@
>                         linux,default-trigger = "heartbeat";
>                 };
>         };
> +
> +       fixed-rate-clocks {
> +               xxti {
> +                       compatible = "samsung,clock-xxti";
> +                       clock-frequency = <0>;
> +               };
> +
> +               xusbxti {
> +                       compatible = "samsung,clock-xusbxti";
> +                       clock-frequency = <24000000>;
> +               };
> +       };

Looks like xxti = 0 and xusbxti = 24MHz is the common frequencies on
nearly all boards. It probably makes sense to add that to the defaults
in dtsi, and override on the boards where it isn't the case. Saves
some boilerplate code in the .dts files.


-Olof
