From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 Resend 2/2] ARM: dts: Add secure firmware support for
 Arndale-octa
Date: Sat, 31 May 2014 03:20:23 +0900
Message-ID: <5388CBE7.40202@samsung.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org> <1401250382-24046-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:34158 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413AbaE3SU2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:20:28 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so1983987pbc.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:20:28 -0700 (PDT)
In-Reply-To: <1401250382-24046-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tushar.behera@linaro.org, tomasz.figa@gmail.com

On 05/28/14 13:13, Sachin Kamat wrote:
> From: Tushar Behera<tushar.behera@linaro.org>
>
> Arndale-Octa board is always configured to work with trustzone
> firmware binary. Added DTS node entry to enable this support.
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index 6ee8149fd5c4..434fd9d3e09d 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -26,6 +26,11 @@
>   		bootargs = "console=ttySAC3,115200";
>   	};
>
> +	firmware@02073000 {
> +		compatible = "samsung,secure-firmware";
> +		reg =<0x02073000 0x1000>;
> +	};
> +
>   	fixed-rate-clocks {
>   		oscclk {
>   			compatible = "samsung,exynos5420-oscclk";

Applied, thanks.

- Kukjin
