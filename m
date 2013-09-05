From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8
 cpus
Date: Thu, 05 Sep 2013 11:55:52 +0200
Message-ID: <3875313.jvPsk6a1oV@amdc1227>
References: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
 <1378373086-30676-3-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36776 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763559Ab3IEJz4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 05:55:56 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MSN00HWFCX1GO20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Sep 2013 10:55:54 +0100 (BST)
In-reply-to: <1378373086-30676-3-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Hi Chander,

On Thursday 05 of September 2013 14:54:46 Chander Kashyap wrote:
> Exynos5420 is octacore SoC from samsung.
> Hence populate all the cpu node enteries.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi index e97c87b..59489f6 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -57,6 +57,34 @@
>  			reg = <0x3>;
>  			clock-frequency = <1800000000>;
>  		};
> +
> +		cpu4: cpu@4 {

I believe this is a typo. The @unit-address suffix should match the value 
of reg property.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x100>;
> +			clock-frequency = <1000000000>;
> +		};
> +
> +		cpu5: cpu@5 {

Ditto.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x101>;
> +			clock-frequency = <1000000000>;
> +		};
> +
> +		cpu6: cpu@6 {

Ditto.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x102>;
> +			clock-frequency = <1000000000>;
> +		};
> +
> +		cpu7: cpu@7 {

Ditto.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x103>;
> +			clock-frequency = <1000000000>;
> +		};
>  	};

Best regards,
Tomasz
