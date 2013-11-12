From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: Update display clock frequency for
 Origen-4412
Date: Tue, 12 Nov 2013 19:17:45 +0900
Message-ID: <085801cedf90$6e2a6580$4a7f3080$@org>
References: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
 <1380171018-24229-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43302 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754443Ab3KLKRr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 05:17:47 -0500
In-reply-to: <1380171018-24229-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: tushar.behera@linaro.org, patches@linaro.org, devicetree@vger.kernel.org

Sachin Kamat wrote:
> 
+ dt ml.

> As per the timing information for supported panel, the value should
> be between 47.2 MHz to 47.9 MHz for 60Hz refresh rate.
> 
> Total horizontal pixels = 1024 (x-res) + 80 (margin) + 48 (hsync) = 1152
> Total vertical pixels = 600 (y-res) + 80 (margin) + 3 (vsync) = 653

Should be 683?

> 
> Target pixel clock rate for refresh rate @60 Hz
> 	= 1152 * 653 * 60 = 47208960 Hz ~ 47.5 MHz
> 
Same here.

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> b/arch/arm/boot/dts/exynos4412-origen.dts
> index 8768b03..923bcd7 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -152,7 +152,7 @@
>  	display-timings {
>  		native-mode = <&timing0>;
>  		timing0: timing {
> -			clock-frequency = <50000>;
> +			clock-frequency = <47500000>;
>  			hactive = <1024>;
>  			vactive = <600>;
>  			hfront-porch = <64>;
> --
> 1.7.9.5

Please make sure it works fine on both origen boards with your two fixes.

If so, let me pick them up into Samsung tree after squash into one patch.

Thanks,
Kukjin
