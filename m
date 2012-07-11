From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/7] Add device tree based discovery support for drm-fimd
Date: Wed, 11 Jul 2012 14:50:53 +0530
Message-ID: <CAK9yfHwnf8PUsdnm8v68-uA8KiWNq0yZW+oinnq=tWPDu3_U=A@mail.gmail.com>
References: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:44928 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751835Ab2GKJUy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:20:54 -0400
Received: by vcbf11 with SMTP id f11so604586vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jul 2012 02:20:53 -0700 (PDT)
In-Reply-To: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com

Hi Leela,

Some nits and suggestions.
Please include device tree list (devicetree-discuss@lists.ozlabs.org)
for all dt related patches.

On 11/07/2012, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> From: Leela Krishna <l.krishna@samsung.com>
>
> The patches are created against "for-next" branch of Kukjin Kim's tree at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> This patch set adds Backlight, LCD support and device tree based discovery
> support for drm-fimd
>
> Leela Krishna (3):
>   ARM: EXYNOS5: add device tree based discovery support for FIMD

Just keep it EXYNOS (not EXYNOS5).


>   ARM: EXYNOS5: Add the bus clock for FIMD
>   ARM: EXYNOS5: Set parent clock to fimd
>
> Leela Krishna Amudala (4):

Better maintain same (author) name style atleast in a series.


>   ARM: SAMSUNG: add additional registers and SFR definitions for
>     writeback
>   ARM: EXYNOS5: add machine specific support for backlight
>   ARM: EXYNOS5: add machine specific support for LCD
>   ARM: EXYNOS: Adding DRM platform device
>
>  arch/arm/boot/dts/exynos5250-smdk5250.dts       |   16 +++
>  arch/arm/boot/dts/exynos5250.dtsi               |    7 ++
>  arch/arm/mach-exynos/Kconfig                    |    1 +
>  arch/arm/mach-exynos/clock-exynos5.c            |   30 ++++--
>  arch/arm/mach-exynos/include/mach/map.h         |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c          |  125
> +++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/clock.h      |    2 +
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |   10 ++
>  arch/arm/plat-samsung/include/plat/regs-fb.h    |   51 +++++++++
>  drivers/video/Kconfig                           |    6 +
>  10 files changed, 239 insertions(+), 10 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
With warm regards,
Sachin
