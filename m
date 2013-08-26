From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 5/7] ARM: dts: Update DP controller DT Node for Exynos5
 based SoCs
Date: Mon, 26 Aug 2013 11:57:26 +0900
Message-ID: <002d01cea207$ff2c57d0$fd850770$%han@samsung.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
 <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16387 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755320Ab3HZC53 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Aug 2013 22:57:29 -0400
In-reply-to: <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, July 30, 2013 8:20 PM, Vikas Sajjan wrote:
>
> Moves the properties of DP controller to exynos5.dtsi which are common
> across exynos5 SoCs like Exynos5250 and Exynos5420.
> 
> The PHY DP Node is based on Jingoo Han's <jg1.han@samsung.com> patch at
> https://patchwork.linuxtv.org/patch/19189/
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi            |   11 +++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts  |    3 ++-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++-
>  arch/arm/boot/dts/exynos5250.dtsi         |   21 +++++++++------------
>  4 files changed, 24 insertions(+), 14 deletions(-)
>  

[....]

> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 238bdb2..1c017dc 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -614,20 +614,17 @@
>  		interrupts = <0 94 0>;
>  	};
> 
> -	dp-controller {
> -		compatible = "samsung,exynos5-dp";
> -		reg = <0x145b0000 0x1000>;
> -		interrupts = <10 3>;
> -		interrupt-parent = <&combiner>;
> +	dp_phy: video-phy@10040720 {
> +		compatible = "samsung,exynos5250-dp-video-phy";
> +		reg = <0x10040720 4>;
> +		#phy-cells = <0>;
> +	};

Oops!!!

This patch should be reverted.
Or, fix patch should be re-sent.
'dp phy' driver is not yet merged to mainline kernel.


> +
> +	dp-controller@145b0000 {
>  		clocks = <&clock 342>;
>  		clock-names = "dp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		dptx-phy {
> -			reg = <0x10040720>;
> -			samsung,enable-mask = <1>;
> -		};
> +		phys = <&dp_phy>;
> +		phy-names = "dp";
>  	};

Thus, 'dptx-phy' node should be used until dp phy driver is merged.

Vikas Sajjan,
Please test your patch on real boards when you send your patch.


Best regards,
Jingoo Han
