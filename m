From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: enable fimd for exynos5800 based peach-pi
 board
Date: Tue, 13 May 2014 10:14:35 +0900
Message-ID: <004701cf6e48$b4578910$1d069b30$%han@samsung.com>
References: <1399877120-4634-1-git-send-email-rahul.sharma@samsung.com>
 <1399877120-4634-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61375 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752406AbaEMBOr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 21:14:47 -0400
In-reply-to: <1399877120-4634-3-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, May 12, 2014 3:45 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable FIMD for peach-pi board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 426705a..cccacdd 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -157,6 +157,11 @@
>  	};
>  };
> 
> +&fimd {
> +	status = "okay";
> +	samsung,invert-vclk;
> +};
> +
>  &hsi2c_9 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> --
> 1.7.9.5
