From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: Add FIMD node to exynos4
Date: Tue, 5 Feb 2013 11:08:29 +0530
Message-ID: <CAGm_ybhw9TvoQ2i48GLs_=7tfB1wq+Lbr6oXK4X_FzU+ONiYNA@mail.gmail.com>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
	<1359718376-21947-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:53425 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751353Ab3BEFpe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 00:45:34 -0500
Received: by mail-wg0-f52.google.com with SMTP id 12so5338107wgh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 21:45:33 -0800 (PST)
In-Reply-To: <1359718376-21947-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Hi,

any more comments for the below patch.

On Fri, Feb 1, 2013 at 5:02 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This adds common FIMD device node for all Exynos4 SoCs.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index e1347fc..57744d6 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -289,4 +289,11 @@
>                         interrupts = <0 34 0>;
>                 };
>         };
> +
> +       fimd: fimd@11c00000 {
> +               compatible = "samsung,exynos4-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupts = <11 1>, <11 0>, <11 2>;
> +       };
>  };
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
