From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Enable RTC node for exynos5250-snow
Date: Tue, 18 Jun 2013 00:32:00 +0900
Message-ID: <51BF2BF0.6000100@samsung.com>
References: <1371481572-926-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:57809 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259Ab3FQPcI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 11:32:08 -0400
In-Reply-To: <1371481572-926-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Tushar Behera <tushar.behera@linaro.org>

On 06/18/13 00:06, Doug Anderson wrote:
> By default the exynos RTC is disabled.  Enable it for snow.  There's
> also an external RTC on the max77686 PMIC but we haven't yet enabled
> that.
>
> Signed-off-by: Doug Anderson<dianders@chromium.org>
> ---
>   arch/arm/boot/dts/exynos5250-snow.dts | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index d449feb..05244f1 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -171,6 +171,10 @@
>   		};
>   	};
>
> +	rtc {
> +		status = "okay";
> +	};
> +
>   	/*
>   	 * On Snow we've got SIP WiFi and so can keep drive strengths low to
>   	 * reduce EMI.

OK, applied.

Thanks,
- Kukjin
