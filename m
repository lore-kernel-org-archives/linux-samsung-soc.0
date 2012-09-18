From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: dts: use uart2 for console on smdkv310 and smdk5250
Date: Tue, 18 Sep 2012 09:50:40 +0530
Message-ID: <CAJuYYwQ0A9c_R=HzjeBCxL7E5bpw3j+64ApsCH5Uc8Q6i+HY4Q@mail.gmail.com>
References: <052601cd94ca$058db4d0$10a91e70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:57603 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757Ab2IREUl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 00:20:41 -0400
Received: by lbbgj3 with SMTP id gj3so4697617lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Sep 2012 21:20:40 -0700 (PDT)
In-Reply-To: <052601cd94ca$058db4d0$10a91e70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 17 September 2012 17:16, Kukjin Kim <kgene.kim@samsung.com> wrote:
>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> index 1beccc8..cb01e3d 100644
> --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> @@ -26,7 +26,7 @@
>         };
>
>         chosen {
> -               bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
> +               bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>         };

Dear Mr. Kim,

What is the reason for changing the console port to 2 for smdkv310 board?

Thanks,
Thomas.

>
>         sdhci@12530000 {
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 8a5e348..62e1039 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -21,7 +21,7 @@
>         };
>
>         chosen {
> -               bootargs = "root=/dev/ram0 rw ramdisk=8192 console=ttySAC1,115200";
> +               bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>         };
>
>         i2c@12C60000 {
> --
> 1.7.4.1
>
