From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: dts: Enable watchdog in Exynos4
Date: Tue, 12 Nov 2013 20:03:17 +0900
Message-ID: <086501cedf96$cab39be0$601ad3a0$@org>
References: <1383208845-17227-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47414 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab3KLLDT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:03:19 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MW5009MZDDE6G00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Nov 2013 20:03:18 +0900 (KST)
In-reply-to: <1383208845-17227-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> Enabled watchdog in Exynos4.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> index ce24edba7f6d..b7378154c0a1 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -196,7 +196,6 @@
>  		interrupts = <0 43 0>;
>  		clocks = <&clock 345>;
>  		clock-names = "watchdog";
> -		status = "disabled";
>  	};
> 
>  	rtc@10070000 {
> --
> 1.7.9.5

Sachin, please see my comments on your RTC enabling patch.

Thanks,
Kukjin
