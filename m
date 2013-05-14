From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] ARM: exynos: Select PINCTRL_EXYNOS for exynos4/5 at
 chip level
Date: Tue, 14 May 2013 14:07:58 +0200
Message-ID: <CACRpkdZ3grCyf3x5dEbT6hAVDkpM3mwibVO5kT0Lv=a09-zBPA@mail.gmail.com>
References: <1368039168-24447-1-git-send-email-dianders@chromium.org>
	<1368123170-22906-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f175.google.com ([209.85.210.175]:51105 "EHLO
	mail-ia0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756632Ab3ENMH6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 08:07:58 -0400
Received: by mail-ia0-f175.google.com with SMTP id m10so530612iam.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 05:07:58 -0700 (PDT)
In-Reply-To: <1368123170-22906-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 9, 2013 at 8:12 PM, Doug Anderson <dianders@chromium.org> wrote:

> Previously if you had MACH_EXYNOS5_DT but not MACH_EXYNOS4_DT you'd be
> missing the pincontrol definitions.  Move PINCTRL selects to the arch
> level since we should be enabling the code for all exynos variants.
>
> Update the PINCTRL descriptions to indicate that PINCTRL_EXYNOS is not
> for exynos5440.  Also add basic dependencies for the PINCTRL_EXYNOS
> kernel config.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3:
> - Moved to chip level as per Tomasz.
> - Update PINCTRL Kconfig for exynos.
>
> Changes in v2:
> - Moved to the arch level as suggested by Olof.

Acked-by: Linus Walleij <linus.walleij@linaro.org> for the pinctrl
part, I guess this will be merged through the Samsung tree?

Yours,
Linus Walleij
