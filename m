From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: use 'status' property for PCIe nodes
Date: Tue, 29 Oct 2013 08:50:14 -0700
Message-ID: <526FD936.8040604@samsung.com>
References: <002601ced46d$dbfa97c0$93efc740$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f53.google.com ([209.85.128.53]:33376 "EHLO
	mail-qe0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264Ab3J2PuT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 11:50:19 -0400
Received: by mail-qe0-f53.google.com with SMTP id cy11so23830qeb.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2013 08:50:18 -0700 (PDT)
In-Reply-To: <002601ced46d$dbfa97c0$93efc740$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>

On 10/28/13 23:12, Jingoo Han wrote:
> Set the default status for PCIe to disabled in the exynos5440.dtsi
> file and let the board dts files such as exynos5440-ssdk5440.dts
> enable the PCIe. However, keep the PCIe for SD5v1 board disabled,
> because there is no PCIe slot on SD5v1 board.
>
> Signed-off-by: Jingoo Han<jg1.han@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Olof, please pick this into your tree directly :-)

If any problems, please kindly let me know.

Thanks,
Kukjin

> ---
> Tested on SSDK5440 board.
>
>   arch/arm/boot/dts/exynos5440-ssdk5440.dts |    2 ++
>   arch/arm/boot/dts/exynos5440.dtsi         |    2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> index a7cb848..d58cb78 100644
> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> @@ -68,9 +68,11 @@
>
>   	pcie@290000 {
>   		reset-gpio =<&pin_ctrl 5 0>;
> +		status = "okay";
>   	};
>
>   	pcie@2a0000 {
>   		reset-gpio =<&pin_ctrl 22 0>;
> +		status = "okay";
>   	};
>   };
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 5d6cf49..8da1070 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -276,6 +276,7 @@
>   		interrupt-map-mask =<0 0 0 0>;
>   		interrupt-map =<0x0 0&gic 53>;
>   		num-lanes =<4>;
> +		status = "disabled";
>   	};
>
>   	pcie@2a0000 {
> @@ -296,5 +297,6 @@
>   		interrupt-map-mask =<0 0 0 0>;
>   		interrupt-map =<0x0 0&gic 56>;
>   		num-lanes =<4>;
> +		status = "disabled";
>   	};
>   };
