From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM64: dts: exynos: Add support for S3FWRN5 NFC chip to
 TM2(e) boards
Date: Thu, 30 Nov 2017 15:57:50 +0900
Message-ID: <5A1FABEE.5080904@samsung.com>
References: <CGME20171129111327eucas1p2ddc03a0352a7bf2b3e1b9d4f9db99511@eucas1p2.samsung.com>
        <20171129111320.14592-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34138 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751487AbdK3G5v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 01:57:51 -0500
In-reply-to: <20171129111320.14592-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 2017년 11월 29일 20:13, Marek Szyprowski wrote:
> Add device tree node with S3FWRN5 NFC chip to TM2(e) boards. The chip is
> connected through HS-I2C bus #4.
> 
> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> [mszyprow: rebased onto v4.15-rc1, moved node to exynos5433-tm2-common.dtsi,
>  rephrased commit message]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 297597442c44..5028d7352856 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -741,6 +741,19 @@
>  	};
>  };
>  
> +&hsi2c_4 {
> +	status = "okay";
> +
> +	s3fwrn5: nfc@27 {
> +		compatible = "samsung,s3fwrn5-i2c";
> +		reg = <0x27>;
> +		interrupt-parent = <&gpa1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +		s3fwrn5,en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
> +		s3fwrn5,fw-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
>  &hsi2c_5 {
>  	status = "okay";
>  
> 

I tested it by using neard daemon. The NFC device on TM2
detects the external NFC id card.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
