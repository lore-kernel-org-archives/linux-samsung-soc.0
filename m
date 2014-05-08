From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: dts: enable fimd for exynos5250 based snow
 board
Date: Thu, 08 May 2014 16:20:05 +0900
Message-ID: <002701cf6a8d$ef7b4540$ce71cfc0$%han@samsung.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
 <1399529995-8656-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20388 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbaEHHUH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 03:20:07 -0400
In-reply-to: <1399529995-8656-3-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, May 08, 2014 3:20 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable fimd node for snow board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 1ce1088..796954c 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -206,4 +206,10 @@
>  			clock-frequency = <24000000>;
>  		};
>  	};
> +
> +	fimd@14400000 {
> +		status = "okay";

(+cc Sachin Kamat, Tomasz Figa)

For readability, how about moving 'status' to the last entry of
the node? The same comment applies to other patches, too.

Best regards,
Jingoo Han

> +		samsung,invert-vclk;
> +	};
> +
>  };
> --
> 1.7.9.5
