From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add HDMI related I2C nodes for Arndale board
Date: Tue, 08 Oct 2013 07:15:23 +0900
Message-ID: <5253327B.7080504@samsung.com>
References: <1380601861-4903-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33239 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719Ab3JGWP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 18:15:27 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so7878520pad.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Oct 2013 15:15:27 -0700 (PDT)
In-Reply-To: <1380601861-4903-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>

On 10/01/13 13:31, Tushar Behera wrote:
> From: Sachin Kamat<sachin.kamat@linaro.org>
>
> Updated I2C nodes for HDMI-DDC and HDMI-PHY for Arndale board.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts |   20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index cee55fa..3a11fa0 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -324,7 +324,14 @@
>   	};
>
>   	i2c@12C80000 {
> -		status = "disabled";
> +		samsung,i2c-sda-delay =<100>;
> +		samsung,i2c-max-bus-freq =<66000>;
> +		samsung,i2c-slave-addr =<0x50>;
> +
> +		hdmiddc@50 {
> +			compatible = "samsung,exynos4210-hdmiddc";
> +			reg =<0x50>;
> +		};
>   	};
>
>   	i2c@12C90000 {
> @@ -362,6 +369,17 @@
>   		status = "disabled";
>   	};
>
> +	i2c@12CE0000 {
> +		samsung,i2c-sda-delay =<100>;
> +		samsung,i2c-max-bus-freq =<66000>;
> +		samsung,i2c-slave-addr =<0x38>;
> +
> +		hdmiphy@38 {
> +			compatible = "samsung,exynos4212-hdmiphy";
> +			reg =<0x38>;
> +		};
> +	};
> +
>   	i2c@121D0000 {
>   		status = "disabled";
>   	};

Applied, thanks.
Kukjin
