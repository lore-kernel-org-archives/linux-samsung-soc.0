From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Keep LDO4 always ON on Arndale board
Date: Tue, 20 May 2014 01:16:24 +0900
Message-ID: <537A2E58.2090401@samsung.com>
References: <1398056599-327-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:34752 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754143AbaESQQ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 12:16:29 -0400
Received: by mail-pb0-f43.google.com with SMTP id up15so6102390pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 09:16:28 -0700 (PDT)
In-Reply-To: <1398056599-327-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 04/21/14 14:03, Sachin Kamat wrote:
> LDO4 regulator was getting disabled preventing the system from
> going into low power states. Keep it always on to fix it.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 090f983..cde19c8 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -107,6 +107,7 @@
>   					regulator-name = "VDD_IOPERI_1.8V";
>   					regulator-min-microvolt =<1800000>;
>   					regulator-max-microvolt =<1800000>;
> +					regulator-always-on;
>   					op_mode =<1>;
>   				};
>
Applied, thanks.

- Kukjin
