From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: exynos: add exynos5420 SoC specific data
Date: Wed, 12 Jun 2013 14:37:16 -0700
Message-ID: <CAD=FV=U9+cRaAspDDCrChgpSfeNkVCG_QDKCDO7zjKRrVoj7pA@mail.gmail.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
	<1371048688-9089-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:32857 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab3FLVhS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:37:18 -0400
Received: by mail-lb0-f182.google.com with SMTP id r11so7838866lbv.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:37:16 -0700 (PDT)
In-Reply-To: <1371048688-9089-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Leela,

On Wed, Jun 12, 2013 at 7:51 AM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> Add Samsung Exynos5420 SoC specific data to enable pinctrl support for
> all platforms based on Exynos5420.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
>  drivers/pinctrl/pinctrl-exynos.c                   |  115 ++++++++++++++++++++
>  drivers/pinctrl/pinctrl-samsung.c                  |    2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |    1 +
>  4 files changed, 119 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index b2bc219..fe949c7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -15,6 +15,7 @@ Required Properties:
>    - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-controller.
>    - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-controller.
>    - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-controller.
> +  - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
>
>  - reg: Base address of the pin controller hardware module and length of
>    the address space it occupies.
> diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
> index 2d76f66..753a8cd 100644
> --- a/drivers/pinctrl/pinctrl-exynos.c
> +++ b/drivers/pinctrl/pinctrl-exynos.c
> @@ -941,3 +941,118 @@ struct samsung_pin_ctrl exynos5250_pin_ctrl[] = {
>                 .label          = "exynos5250-gpio-ctrl3",
>         },
>  };
> +
> +/* pin banks of exynos5420 pin-controller 0 */
> +static struct samsung_pin_bank exynos5420_pin_banks0[] = {
> +       EXYNOS_PIN_BANK_EINTN(8, 0x000, "gpy7"),

As Tomasz points out, it looks like this should be EINTG.

Otherwise looks good.

Reviewed-by: Doug Anderson <dianders@chromium.org>
