From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v10 2/3] ARM: dts: Add FIMD node and display timing node
 to exynos4412-origen.dts
Date: Mon, 01 Apr 2013 20:37:16 +0200
Message-ID: <5159D3DC.4070507@gmail.com>
References: <1364826153-8925-1-git-send-email-vikas.sajjan@linaro.org> <1364826153-8925-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:59290 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758903Ab3DAShW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Apr 2013 14:37:22 -0400
Received: by mail-ea0-f175.google.com with SMTP id r16so1121407ead.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2013 11:37:21 -0700 (PDT)
In-Reply-To: <1364826153-8925-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

On 04/01/2013 04:22 PM, Vikas Sajjan wrote:
> This patch adds FIMD related nodes for the Origen Quad board.
>
> Signed-off-by: Vikas Sajjan<vikas.sajjan@linaro.org>
> ---
>   arch/arm/boot/dts/exynos4412-origen.dts |   21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index a5478bd..cb0c507 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -70,6 +70,27 @@
>   		status = "okay";
>   	};
>
> +	fimd@11c00000 {
> +		pinctrl-0 =<&lcd_clk&lcd_data24&pwm1_out>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	display-timings {
> +		native-mode =<&timing0>;
> +		timing0: timing@0 {

I think you could leave out '@0' part, since there is only one node.
And if you decide to keep it, then this node should contain 'reg'
property AFAICT.

Otherwise the series looks good to me. With the above issue addressed
feel free to add

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> +			clock-frequency =<50000>;
> +			hactive =<1024>;
> +			vactive =<600>;
> +			hfront-porch =<64>;
> +			hback-porch =<16>;
> +			hsync-len =<48>;
> +			vback-porch =<64>;
> +			vfront-porch =<16>;
> +			vsync-len =<3>;
> +		};
> +	};
> +
>   	serial@13800000 {
>   		status = "okay";
>   	};

Thanks,
Sylwester
