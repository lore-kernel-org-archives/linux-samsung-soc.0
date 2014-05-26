From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add mclk entry for Snow/Peach-pit boards
Date: Mon, 26 May 2014 13:40:06 +0530
Message-ID: <CAHbNUh3GtjabLrcaug9Uku1J=EK23PUcOqM2eP2WUknnCEswdQ@mail.gmail.com>
References: <1400561355-9484-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:56842 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751913AbaEZIKG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 04:10:06 -0400
Received: by mail-oa0-f43.google.com with SMTP id l6so8049903oag.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 01:10:06 -0700 (PDT)
In-Reply-To: <1400561355-9484-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On 20 May 2014 10:19, Tushar Behera <tushar.behera@linaro.org> wrote:
> On Snow/Peach-pit boards, XCLKOUT provides master clock (mclk) to codec.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---

This patch is obsolete now because the proposed clock bindings for
XCLKOUT is now different (change in #clock-cells). Updated patch will
be sent once the XCLKOUT drivers are accepted.

> Dependency:
> 1. Driver side changes have been posted here.
> https://lkml.org/lkml/2014/5/20/4
>
> 2. XCLKOUT clock driver support
> https://lkml.org/lkml/2014/5/15/530
>
>  arch/arm/boot/dts/exynos5250-snow.dts      |    3 +++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 67391b9..1014ce0 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -346,6 +346,9 @@
>
>                 samsung,i2s-controller = <&i2s0>;
>                 samsung,audio-codec = <&max98095>;
> +
> +               clocks = <&pmu_system_controller>;
> +               clock-names = "mclk";
>         };
>
>         usb@12110000 {
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index f4b2a16..c0664e9 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -64,6 +64,9 @@
>
>                 samsung,i2s-controller = <&i2s0>;
>                 samsung,audio-codec = <&max98090>;
> +
> +               clocks = <&pmu_system_controller>;
> +               clock-names = "mclk";
>         };
>  };
>
> --
> 1.7.9.5
>



-- 
Tushar Behera
