From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add hs-i2c nodes to exynos5420
Date: Thu, 07 Nov 2013 14:37:37 +0100
Message-ID: <9545471.VCNkjpVQx6@amdc1227>
References: <1383651560-322-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23660 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753577Ab3KGNhp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Nov 2013 08:37:45 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MVW00DVNB5I3NA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Nov 2013 13:37:43 +0000 (GMT)
In-reply-to: <1383651560-322-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

Please see my comments inline.

On Tuesday 05 of November 2013 17:09:20 Sachin Kamat wrote:
> Added high speed I2C nodes to Exynos5420 DT file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   98 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 9ce5f82..469769a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -34,6 +34,13 @@
>  		i2c1 = &i2c_1;
>  		i2c2 = &i2c_2;
>  		i2c3 = &i2c_3;
> +		i2c4 = &hsi2c_4;
> +		i2c5 = &hsi2c_5;
> +		i2c6 = &hsi2c_6;
> +		i2c7 = &hsi2c_7;
> +		i2c8 = &hsi2c_8;
> +		i2c9 = &hsi2c_9;
> +		i2c10 = &hsi2c_10;
>  		gsc0 = &gsc_0;
>  		gsc1 = &gsc_1;
>  	};
> @@ -339,6 +346,97 @@
>  		status = "disabled";
>  	};
>  
> +	hsi2c_4: hsi2c@12CA0000 {

nit: Node name should be generic, so simply i2c@unit-address should be
enough.

The same for remaining instances.

Best regards,
Tomasz
