From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: s3c-rtc: Use s3c6410-rtc instead of
 exynos3250-rtc
Date: Tue, 31 Mar 2015 08:38:30 +0900
Message-ID: <5519DE76.4080803@samsung.com>
References: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
 <1427728773-29065-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41339 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753850AbbC3Xic (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 19:38:32 -0400
In-reply-to: <1427728773-29065-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 03/31/2015 12:19 AM, Krzysztof Kozlowski wrote:
> Mark "samsung,exynos3250-rtc" compatible as deprecated because it
> duplicates the "samsung,s3c6410-rtc". Use "samsung,s3c6410-rtc" on
> Exynos3250 and Exynos4415 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/rtc/s3c-rtc.txt | 3 ++-
>  arch/arm/boot/dts/exynos3250.dtsi                 | 2 +-
>  arch/arm/boot/dts/exynos4415.dtsi                 | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> index ab757b84daa7..ac2fcd6ff4b8 100644
> --- a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> @@ -6,7 +6,8 @@ Required properties:
>      * "samsung,s3c2416-rtc" - for controllers compatible with s3c2416 rtc.
>      * "samsung,s3c2443-rtc" - for controllers compatible with s3c2443 rtc.
>      * "samsung,s3c6410-rtc" - for controllers compatible with s3c6410 rtc.
> -    * "samsung,exynos3250-rtc" - for controllers compatible with exynos3250 rtc.
> +    * "samsung,exynos3250-rtc" - (deprecated) for controllers compatible with
> +                                 exynos3250 rtc (use "samsung,s3c6410-rtc").
>  - reg: physical base address of the controller and length of memory mapped
>    region.
>  - interrupts: Two interrupt numbers to the cpu should be specified. First
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index e3bfb11c6ef8..8d58b550e925 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -189,7 +189,7 @@
>  		};
>  
>  		rtc: rtc@10070000 {
> -			compatible = "samsung,exynos3250-rtc";
> +			compatible = "samsung,s3c6410-rtc";
>  			reg = <0x10070000 0x100>;
>  			interrupts = <0 73 0>, <0 74 0>;
>  			interrupt-parent = <&pmu_system_controller>;
> diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
> index 5caea996e090..186cb8465683 100644
> --- a/arch/arm/boot/dts/exynos4415.dtsi
> +++ b/arch/arm/boot/dts/exynos4415.dtsi
> @@ -177,7 +177,7 @@
>  		};
>  
>  		rtc: rtc@10070000 {
> -			compatible = "samsung,exynos3250-rtc";
> +			compatible = "samsung,s3c6410-rtc";
>  			reg = <0x10070000 0x100>;
>  			interrupts = <0 73 0>, <0 74 0>;
>  			status = "disabled";
> 

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
