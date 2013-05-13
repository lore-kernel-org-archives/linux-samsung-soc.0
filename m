From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add clock provider information for DP
 controller in Exynos5250 SoC
Date: Mon, 13 May 2013 10:21:59 +0900
Message-ID: <000801ce4f78$442ef140$cc8cd3c0$@samsung.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <1367992894-20198-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52879 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752227Ab3EMBWB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 May 2013 21:22:01 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMP0038FQEELD80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 May 2013 10:22:00 +0900 (KST)
In-reply-to: <1367992894-20198-3-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org, Jingoo Han <jg1.han@samsung.com>

On Wednesday, May 08, 2013 3:02 PM, Vikas Sajjan wrote:
> 
> Adds clock provider information for DP controller required by CCF.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

Hi Vikas Sajjan,

Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 4bd9e9c..2773d22 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -651,6 +651,8 @@
>  		reg = <0x145b0000 0x1000>;
>  		interrupts = <10 3>;
>  		interrupt-parent = <&combiner>;
> +		clocks = <&clock 342>;
> +		clock-names = "dp";
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> 
> --
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
