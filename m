From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: enable fimd for exynos5420 based
 peach-pit board
Date: Mon, 12 May 2014 13:52:06 +0900
Message-ID: <001701cf6d9d$ecacbbb0$c6063310$%han@samsung.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
 <1399630186-22610-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62760 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbaELEwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 00:52:08 -0400
In-reply-to: <1399630186-22610-4-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 09, 2014 7:10 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable fimd for peach-pit board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index fae33dd..f75da5b 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -145,3 +145,8 @@
>  &watchdog {
>  	timeout-sec = <32>;
>  };
> +
> +&fimd {
> +	status = "okay";
> +	samsung,invert-vclk;
> +};
> --
> 1.7.9.5
