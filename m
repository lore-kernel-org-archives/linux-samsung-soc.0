From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 5/7] ARM: dts: enable hdmi for exynos5250 based snow board
Date: Mon, 28 Apr 2014 12:00:19 +0530
Message-ID: <535DF57B.5030301@linaro.org>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com> <1397993044-14564-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:57901 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751573AbaD1Ga1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 02:30:27 -0400
Received: by mail-pd0-f172.google.com with SMTP id w10so5350315pde.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2014 23:30:26 -0700 (PDT)
In-Reply-To: <1397993044-14564-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com

On 04/20/2014 04:54 PM, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable support for HDMI for exynos5250 based Snow board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi |   13 ++++++++++++-
>  arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)

[ ... ]

> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 52ae335..586cd38 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -343,4 +343,11 @@
>  			pinctrl-0 = <&ptn3460_gpios>;
>  		};
>  	};
> +
> +	hdmi {
> +		hdmi-en-supply = <&tps65090_fet7>;

Looks like tps65090_fet7 is not defined yet or might be not mentioned as
dependency.

> +		vdd-supply = <&ldo8_reg>;
> +		vdd_osc-supply = <&ldo10_reg>;
> +		vdd_pll-supply = <&ldo8_reg>;
> +	};
>  };
> 

-- 
Tushar Behera
