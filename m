From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: enable pwm backlight on exynos5250-snow
Date: Wed, 07 May 2014 22:34:47 +0200
Message-ID: <536A98E7.9030007@gmail.com>
References: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:61315 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892AbaEGUe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 16:34:58 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so1080340eei.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 May 2014 13:34:56 -0700 (PDT)
In-Reply-To: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ajaynumb@gmail.com, kgene.kim@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Olof Johansson <olof@lixom.net>

Hi Ajay,

On 07.05.2014 14:56, Ajay Kumar wrote:
> Add PWM backlight node for exynos5250 and enable the same on exynos5250
> based snow board.
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>   arch/arm/boot/dts/exynos5250-snow.dts     |    5 +++++
>   arch/arm/boot/dts/exynos5250.dtsi         |   10 ++++++++++
>   3 files changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> index 9a49e68..2a4680c 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -351,6 +351,13 @@
>   			samsung,pin-drv = <0>;
>   		};
>
> +		backlight_pwm: backlight-pwm {
> +			samsung,pins = "gpb2-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};

This looks like a generic PWM output function, not specific to backlight 
in any way.

Please see patch [1] adding PWM output pin groups for Exynos5420 for 
reference.

[1] 
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg29869.html

Best regards,
Tomasz
