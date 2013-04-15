From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/7] ARM: exynos: add missing properties for combiner IRQs
Date: Mon, 15 Apr 2013 11:57:25 +0530
Message-ID: <CAJuYYwSJyDt7aBLyY0S8LUaGf9-VwuSeM_n3V1UuBzgTyDyTUQ@mail.gmail.com>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de>
	<1365775405-115297-4-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:33981 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230Ab3DOG1Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 02:27:25 -0400
Received: by mail-ie0-f171.google.com with SMTP id e14so5408389iej.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Apr 2013 23:27:25 -0700 (PDT)
In-Reply-To: <1365775405-115297-4-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 12 April 2013 19:33, Arnd Bergmann <arnd@arndb.de> wrote:
> The exynos combiner irqchip needs to find the parent interrupts
> and needs to know their number, so add the missing properties
> for exynos4 as they were already present for exynos5.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 1 +
>  arch/arm/boot/dts/exynos4212.dtsi | 9 +++++++++
>  arch/arm/boot/dts/exynos4412.dtsi | 9 +++++++++
>  3 files changed, 19 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index 15143bd..c102869 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -41,6 +41,7 @@
>         };
>
>         combiner:interrupt-controller@10440000 {
> +               combiner-nr = <16>;

The default value of the combiner-nr is case it is not specified is
16. The default value is documented in the bindings documentation.

>                 interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
>                              <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
>                              <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
> index 36d4299..f83c3c1 100644
> --- a/arch/arm/boot/dts/exynos4212.dtsi
> +++ b/arch/arm/boot/dts/exynos4212.dtsi
> @@ -26,6 +26,15 @@
>                 cpu-offset = <0x8000>;
>         };
>
> +       interrupt-controller@10440000 {
> +                combiner-nr = <18>;
> +               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> +                            <0 107 0>, <0 108 0>;
> +       };
> +
>         mct@10050000 {
>                 compatible = "samsung,exynos4412-mct";
>                 reg = <0x10050000 0x800>;
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index d75c047..4cb657e 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -26,6 +26,15 @@
>                 cpu-offset = <0x4000>;
>         };
>
> +       interrupt-controller@10440000 {
> +               combiner-nr = <20>;
> +               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> +                            <0 107 0>, <0 108 0>>, <0 48 0>, <0 42 0>;

Extra '>' for <0 108 0> can be removed.

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org?

> +       };
> +
>         mct@10050000 {
>                 compatible = "samsung,exynos4412-mct";
>                 reg = <0x10050000 0x800>;
> --
> 1.8.1.2
>
