From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: add pwm node for exynos4412-trats2
Date: Sat, 22 Nov 2014 23:20:40 +0900
Message-ID: <54709BB8.1060309@kernel.org>
References: <1416493576-10129-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:57842 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750716AbaKVOUo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 09:20:44 -0500
In-Reply-To: <1416493576-10129-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

On 11/20/14 23:26, Jaewon Kim wrote:
> This patch add PWM(Pulse Width Modulation) node and
> handle to use pwm property.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 8ee20bd..72462e8 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -636,6 +636,13 @@
>  		};
>  	};
>  
> +	pwm: pwm@139D0000 {
> +		pinctrl-0 = <&pwm0_out>;
> +		pinctrl-names = "default";
> +		samsung,pwm-outputs = <0>;
> +		status = "okay";
> +	};
> +
>  	dsi_0: dsi@11C80000 {
>  		vddcore-supply = <&ldo8_reg>;
>  		vddio-supply = <&ldo10_reg>;

Applied this and 2nd.

Thanks,
Kukjin
