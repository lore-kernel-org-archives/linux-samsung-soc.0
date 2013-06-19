From: sunil joshi <sjoshi.open@gmail.com>
Subject: Re: [PATCH V3 0/2] Add pinctrl support to Exynos5420
Date: Wed, 19 Jun 2013 16:43:37 +0530
Message-ID: <CANruHrTQvAeiDdcF=AqYXMYzE_dLsg8ivXoMVUUgeKUz_J=RYA@mail.gmail.com>
References: <1371625929-12906-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:54490 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933666Ab3FSLNi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 07:13:38 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so5780460obc.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 04:13:38 -0700 (PDT)
In-Reply-To: <1371625929-12906-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

Tested these patches on SMDK 5420, works fine with MMC getting probed

Tested-by : Sunil Joshi <joshi@samsung.com>

Regards
Sunil

On Wed, Jun 19, 2013 at 12:42 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> This patchset adds the pinctrl support to Exynos5420.
> This series is rebased and tested on for-next branch of kgene tree.
>
> Changes since V2:
>         - As Tomasz figa suggested, changed the sd0_bus4, sd1_bus4 and sd2_bus4
>           nodes in pinctrl file so that gpio pins don't overlap between groups.
>         - GPIO interrupt register offsets are added for exynos5420_pin_ctrl structure
>         - Changed the gpio pin count from 8 to 7 for gpz
>         - Added Acked-by: Linus Walleij <linus.walleij@linaro.org>
>         - Removed the patch "gpio: samsung: skip gpiolib registration if pinctrl support
>           is enabled for exynos5420" from the series.
>
> Changes since V1:
>         - As gpy7 bank supports interrupts, it is defined using EINTG macro
>
> Leela Krishna Amudala (2):
>   ARM: dts: add pinctrl support to Exynos5420
>   pinctrl: exynos: add exynos5420 SoC specific data
>
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |  680 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   45 ++
>  drivers/pinctrl/pinctrl-exynos.c                   |  118 ++++
>  drivers/pinctrl/pinctrl-samsung.c                  |    2 +
>  drivers/pinctrl/pinctrl-samsung.h                  |    1 +
>  6 files changed, 847 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
