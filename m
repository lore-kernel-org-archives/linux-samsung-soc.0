From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS5440: DTS: Add virtual GIC DT bindings
Date: Tue, 02 Apr 2013 19:37:32 +0900
Message-ID: <239601ce2f8e$154b9720$3fe2c560$%kim@samsung.com>
References: <1363858839-13578-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9104 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760938Ab3DBKhe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 06:37:34 -0400
In-reply-to: <1363858839-13578-1-git-send-email-giridhar.maruthy@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Giridhar Maruthy' <giridhar.maruthy@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org, kvm@vger.kernel.org

Giridhar Maruthy wrote:
> 
> Exynos5440 has GIC which has virtualization support
> in them. These are used by KVM.
> 
> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi
> b/arch/arm/boot/dts/exynos5440.dtsi
> index c374a31..25c6134 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -26,7 +26,11 @@
>  		compatible = "arm,cortex-a15-gic";
>  		#interrupt-cells = <3>;
>  		interrupt-controller;
> -		reg = <0x2E1000 0x1000>, <0x2E2000 0x1000>;
> +		reg =	<0x2E1000 0x1000>,
> +			<0x2E2000 0x1000>,
> +			<0x2E4000 0x2000>,
> +			<0x2E6000 0x2000>;
> +		interrupts = <1 9 0xf04>;
>  	};
> 
>  	cpus {
> --
> 1.7.9.5

Looks ok to me, applied.

Thanks.

- Kukjin
