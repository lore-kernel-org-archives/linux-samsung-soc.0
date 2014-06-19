From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos4: fix pwm-cells in pwm node
Date: Thu, 19 Jun 2014 11:37:48 +0530
Message-ID: <CAK5sBcFJpSvpwXGPckDcUoZP_Xqqo3Bm6p5qjF_mnZg6b7+T3g@mail.gmail.com>
References: <1403143414-6242-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:40021 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbaFSGHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 02:07:50 -0400
Received: by mail-la0-f45.google.com with SMTP id hr17so1145383lab.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 23:07:48 -0700 (PDT)
In-Reply-To: <1403143414-6242-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>

Hi Jaewon,

On Thu, Jun 19, 2014 at 7:33 AM, Jaewon Kim <jaewon02.kim@samsung.com> wrote:
> pwm-cells should be 3. Third cell is optional PWM flags. And This flag
> supported by this binding is PWM_POLARITY_INVERTED.
>
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>
> Changes in v2:
>  - Remove unnecessary handle.
>
>  arch/arm/boot/dts/exynos4.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index b8ece4b..e118356 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -554,7 +554,7 @@
>                 interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
>                 clocks = <&clock CLK_PWM>;
>                 clock-names = "timers";
> -               #pwm-cells = <2>;
> +               #pwm-cells = <3>;
>                 status = "disabled";
>         };

I think I had already reviewed this patch. Anyway,
Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>
