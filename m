From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: exynos: Select PINCTRL_EXYNOS for exynos5
Date: Wed, 8 May 2013 11:19:38 -0700
Message-ID: <CAOesGMia9kLGh6B6QJZAKS1UpBg86v32S2um+0fjx5HYjje3cw@mail.gmail.com>
References: <1368034349-15091-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:55637 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757655Ab3EHSTj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 May 2013 14:19:39 -0400
Received: by mail-wg0-f44.google.com with SMTP id z12so2194535wgg.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 May 2013 11:19:38 -0700 (PDT)
In-Reply-To: <1368034349-15091-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Wed, May 8, 2013 at 10:32 AM, Doug Anderson <dianders@chromium.org> wrote:
> If you've got MACH_EXYNOS5_DT but not MACH_EXYNOS4_DT you'll be
> missing the pincontrol definitions.  Add them for exynos5.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm/mach-exynos/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 6e77432..cdcd7fa 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -428,6 +428,8 @@ config MACH_EXYNOS5_DT
>         depends on ARCH_EXYNOS5
>         select ARM_AMBA
>         select CLKSRC_OF
> +       select PINCTRL
> +       select PINCTRL_EXYNOS

Nit:

Seems like this should be selected by the SoC (ARCH_EXYNOS5) instead
of the board. Actually, I'm not sure we need the board Kconfig entry
long-term; all boards will be dt-only.


-Olof
