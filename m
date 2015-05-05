From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: exynos3250: add JPEG codec device node
Date: Tue, 05 May 2015 14:00:30 +0900
Message-ID: <55484E6E.20906@gmail.com>
References: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35262 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754996AbbEEFAe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 01:00:34 -0400
Received: by pabtp1 with SMTP id tp1so180519413pab.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 22:00:33 -0700 (PDT)
In-Reply-To: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Kukjin Kim <kgene@kernel.org>

W dniu 24.01.2015 o 00:39, Jacek Anaszewski pisze:
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 2246549..3c043d9 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -228,6 +228,19 @@
>  			interrupts = <0 240 0>;
>  		};
>  
> +		jpeg: codec@11830000 {
> +			compatible = "samsung,exynos3250-jpeg";
> +			reg = <0x11830000 0x1000>;
> +			interrupts = <0 171 0>;
> +			clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
> +			clock-names = "jpeg", "sclk";
> +			samsung,power-domain = <&pd_cam>;

Please switch to generic binding: power-domains.

Best regards,
Krzysztof
