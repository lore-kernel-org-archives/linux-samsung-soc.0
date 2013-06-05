From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Fix gpio number for UART3 in exynos5250
Date: Wed, 05 Jun 2013 20:56:03 +0900
Message-ID: <08e401ce61e3$a7b0dee0$f7129ca0$%kim@samsung.com>
References: <1366371573-19310-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63271 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753570Ab3FEL4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 07:56:05 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX0088O55AXJX0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 20:56:04 +0900 (KST)
In-reply-to: <1366371573-19310-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Tushar Behera wrote:
> 
> UART3 uses GPA1-4 and GPA1-5 instead.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> index d1650fb..299d786 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -256,7 +256,7 @@
>  		};
> 
>  		uart3_data: uart3-data {
> -			samsung,pins = "gpa1-4", "gpa1-4";
> +			samsung,pins = "gpa1-4", "gpa1-5";
>  			samsung,pin-function = <2>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
> --
> 1.7.9.5

Applied, thanks.

- Kukjin
