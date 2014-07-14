From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add mask-tpm-reset DT node to the exynos5800-peach-pi
Date: Mon, 14 Jul 2014 18:11:52 +0530
Message-ID: <CAHfPSqCCvmgYYkPpXtA2H9CWwNsvkvhre7ipHN3rxHD=9Ea-8A@mail.gmail.com>
References: <1405339577-7878-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:35677 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754564AbaGNMmN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:42:13 -0400
Received: by mail-qg0-f47.google.com with SMTP id i50so571674qgf.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 05:42:12 -0700 (PDT)
In-Reply-To: <1405339577-7878-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, olof@lixom.net, Thomas Abraham <thomas.ab@samsung.com>

Hello Vikas,

On 14 July 2014 17:36, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
> being reset across sleep/wake.  If we don't set it to anything then
> the TPM will be reset.  U-Boot will detect this as invalid
> and will reset the system on resume time. This GPIO can always be low
> and not hurt anything.  It will get pulled back high again during a
> normal warm reset when it will default back to an input.
>
> To properly preserve the TPM state across suspend/resume and to make
> the chrome U-Boot happy, properly set the GPIO to mask the
> reset to the TPM.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>

After merging Linus Walleij's for-next of pinctrl git.

S2R on Exynos5800 based Peach PI works fine.

Tested-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>

> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 28f2a25..caa8952 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -209,6 +209,18 @@
>
>
>  &pinctrl_0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mask_tpm_reset>;
> +
> +       /* We need GPX0_6 to be low at sleep time; just keep it low always */
> +       mask_tpm_reset: mask-tpm-reset {
> +               samsung,pins = "gpx0-6";
> +               samsung,pin-function = <1>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <0>;
> +               samsung,pin-val = <0>;
> +       };
> +
>         max98091_irq: max98091-irq {
>                 samsung,pins = "gpx0-2";
>                 samsung,pin-function = <0>;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
