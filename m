From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Add sdhci node for exynos4412-smdk4412
Date: Tue, 5 Feb 2013 11:22:57 +0530
Message-ID: <CAK9yfHyXZA78ub3Ogqj6we8+kV74bUBVoDv0J0SWnx3qkBGnPQ@mail.gmail.com>
References: <1359114686-7871-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:42585 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383Ab3BEFw6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 00:52:58 -0500
Received: by mail-ob0-f173.google.com with SMTP id dn14so7081924obc.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 21:52:58 -0800 (PST)
In-Reply-To: <1359114686-7871-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

ping..

On 25 January 2013 17:21, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Added sdhci node for exynos4412-smdk4412.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-smdk4412.dts |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> index f05bf57..e885971 100644
> --- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> +++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> @@ -27,6 +27,13 @@
>                 bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
>         };
>
> +       sdhci@12530000 {
> +               bus-width = <4>;
> +               pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
> +               pinctrl-names = "default";
> +               status = "okay";
> +       };
> +
>         serial@13800000 {
>                 status = "okay";
>         };
> --
> 1.7.4.1
>



-- 
With warm regards,
Sachin
