From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V2] ARM: dts: Enable RTC node for Arndale
Date: Tue, 18 Jun 2013 00:10:50 +0900
Message-ID: <51BF26FA.9010807@samsung.com>
References: <CAHbNUh2byimQ_ep0j9XkUjRFaU3K6YZE_ANcch5UhP4QsuZxPw@mail.gmail.com> <1371442179-23597-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:63190 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab3FQPK5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 11:10:57 -0400
Received: by mail-pb0-f44.google.com with SMTP id uo1so2878167pbc.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 08:10:56 -0700 (PDT)
In-Reply-To: <1371442179-23597-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, dianders@chromium.org, patches@linaro.org

On 06/17/13 13:09, Tushar Behera wrote:
> The issues reported in commit 522ccdb6fd0e ("ARM: dts: Disable the RTC
> by default on exynos5") are no longer reproduced on EXYNOS5250 based
> Arndale board. Hence re-enabling RTC support for Arndale board.
>
> This is helpful for testing S2R on Arndale board.
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
> Changes for V2:
> * RTC node is enabled only for Arndale board. Earlier it was enabled
> in exynos5250.dtsi.
>
>   arch/arm/boot/dts/exynos5250-arndale.dts |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 02cfc76..b38080a 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -449,4 +449,8 @@
>   			clock-frequency =<24000000>;
>   		};
>   	};
> +
> +	rtc {
> +		status = "okay";
> +	};
>   };

Applied, thanks.

- Kukjin
