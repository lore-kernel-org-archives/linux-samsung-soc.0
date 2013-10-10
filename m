From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RESEND] [PATCH] ARM: dts: exynos5: add pwm DT nodes to
 Exynos5250 and Exynos5420
Date: Thu, 10 Oct 2013 11:18:00 +0530
Message-ID: <CAK9yfHyB=Uqjg1HhMx6BXSihDmwRpmpkeLrm2YgDj2Yyo4ySuA@mail.gmail.com>
References: <1381383731-4359-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:52496 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977Ab3JJFsE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:48:04 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so2093894pde.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Oct 2013 22:48:03 -0700 (PDT)
In-Reply-To: <1381383731-4359-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, abrestic@chromium.org, olofj@chromium.org

Hi Leela,

On 10 October 2013 11:12, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> Add the device-tree binding for the PWM controller to Exynos5250 and Exynos5420
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Olof Johansson <olofj@chromium.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
>  arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 864ae90..99abc72 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -521,6 +521,15 @@
>                 };
>         };
>
> +       pwm: pwm@12dd0000 {
> +               compatible = "samsung,exynos4210-pwm";
> +               reg = <0x12dd0000 0x100>;
> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
> +               #pwm-cells = <3>;
> +               clocks = <&clock 311>;
> +               clock-names = "timers";
> +       };
> +
>         amba {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index d537cd7..80afc8b 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -206,6 +206,15 @@
>                 clock-names = "uart", "clk_uart_baud0";
>         };
>
> +       pwm: pwm@12dd0000 {
> +               compatible = "samsung,exynos4210-pwm";
> +               reg = <0x12dd0000 0x100>;
> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
> +               #pwm-cells = <3>;
> +               clocks = <&clock 279>;
> +               clock-names = "timers";
> +       };
> +

Looking at the properties in the above 2 nodes, can't we have the
common ones defined in exynos5.dtsi?

-- 
With warm regards,
Sachin
