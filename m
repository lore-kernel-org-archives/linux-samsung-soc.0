From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: fix pwm-cells in pwm node
Date: Thu, 12 Jun 2014 14:51:42 +0530
Message-ID: <CAK5sBcGyDJ9n+_ei_p-5ukW0NMW_ytSXv8dGkkMx2TquDFWBOQ@mail.gmail.com>
References: <1402561392-21702-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:54144 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932673AbaFLJVo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 05:21:44 -0400
In-Reply-To: <1402561392-21702-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, Sachin Kamat <spk.linux@gmail.com>

Hi Jaewon,

On Thu, Jun 12, 2014 at 1:53 PM, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
> pwm-cells should be 3. Third cell is optional PWM flags.
> And This flag supported by this binding is PWM_POLARITY_INVERTED
>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index b8ece4b..b687e53 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -548,13 +548,13 @@
>                 status = "disabled";
>         };
>
> -       pwm@139D0000 {
> +       pwm: pwm@139D0000 {

unrelated change.

>                 compatible = "samsung,exynos4210-pwm";
>                 reg = <0x139D0000 0x1000>;
>                 interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
>                 clocks = <&clock CLK_PWM>;
>                 clock-names = "timers";
> -               #pwm-cells = <2>;
> +               #pwm-cells = <3>;
>                 status = "disabled";
>         };

Otherwise looks good.
Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>

Regards,
Sachin
