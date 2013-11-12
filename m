From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Tue, 12 Nov 2013 20:01:44 +0900
Message-ID: <086401cedf96$933b0450$b9b10cf0$@org>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37158 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab3KLLBq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:01:46 -0500
In-reply-to: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org

Sachin Kamat wrote:
> 
> Since there are no board specific properties for the RTC node,
> keep it enabled in the dtsi file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> index a73eeb5..e262946 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -205,7 +205,6 @@
>  		interrupts = <0 44 0>, <0 45 0>;
>  		clocks = <&clock 346>;
>  		clock-names = "rtc";
> -		status = "disabled";
>  	};
> 
>  	keypad@100A0000 {
> --
> 1.7.9.5

Well, I don't think every exynos4 boards want to make the default
enabled...so I don't want to take this. If any opinions, please let me know.

Thanks,
Kukjin
