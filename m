From: sunil joshi <sjoshi.open@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos5420: add ADC device tree node
Date: Fri, 2 Aug 2013 10:20:38 +0530
Message-ID: <CANruHrQXh=aE5-DkaNzdd=PpByTqyszyh2G0cvcW2iBGH8VH4A@mail.gmail.com>
References: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,
exynos5250.dtsi also needs this entry.
Pls consider adding adc node in exynos5250.dtsi as well, and move the
common content of adc node to exynos5.dtsi.

Regards
Sunil


On Thu, Aug 1, 2013 at 2:58 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> From: Jaehoon Kim <jh228.kim@samsung.com>
>
> Add device tree node for ADC in exynos5420.dtsi
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8c54c4b..074e1bc 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -145,4 +145,15 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       adc: adc@12D10000 {
> +               compatible = "samsung,exynos-adc-v2";
> +               reg = <0x12D10000 0x100>, <0x10040720 0x4>;
> +               interrupts = <0 106 0>;
> +               #io-channel-cells = <1>;
> +               io-channel-ranges;
> +               clocks = <&clock 270>;
> +               clock-names = "adc";
> +               status = "disabled";
> +       };
>  };
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
