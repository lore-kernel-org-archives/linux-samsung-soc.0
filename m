From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/7] Exynos4: enable HDMI support for Odroid and UniversalC210
Date: Sat, 19 Jul 2014 19:40:14 +0900
Message-ID: <CAAQKjZPzWEkvCejGurkDh78BZTu_ad9saQPkg2cBFFd4=HktVg@mail.gmail.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:58444 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758166AbaGSKkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 06:40:15 -0400
Received: by mail-wi0-f169.google.com with SMTP id n3so2189611wiv.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jul 2014 03:40:14 -0700 (PDT)
In-Reply-To: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

2014-07-01 17:10 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Hello,
>
> This is a long awaited patch series enabling support for HDMI output
> available on Exynos4412-based Odroid boards (X/X2/U2/U3/U3+) and
> Exynos4210 Universal C210 board.
>
> This patch consists of 3 groups of patches, which are aimed to be merged
> to respective maintainer kernel trees.
>
> First patch ("clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER
> clocks") adds missing device tree support for hdmi related clocks. It is
> prepared for clk kernel tree.
>
> Next two patches ("drm: exynos: hdmi: make 'hdmi-en' regulator optional
> and keep it enabled" and "drm: hdmi/mixer: enable exynos 4210 and 4x12
> soc support") add proper support for Exynos4 SoCs to Exynos DRM drivers.
> Those patches should go to exynos-drm kernel tree.

Picked them up.

Thanks,
Inki Dae

>
> Last patches ("Exynos: add support for 'domain-always-on' property",
> "ARM: dts: exynos4: add hdmi related nodes", "ARM: dts:
> exynos4412-odroid: enable hdmi support" and "ARM: dts:
> exynos4210-universal_c210: enable hdmi support") adds changes to all DTS
> files and adds 'domain-always-on' property to Exynos power-domain
> driver. This property is needed to resolve the non-trivial dependences
> between TV and LCD0 power domains and the power on/off sequence of the
> TV and mixer modules.
>
> Patches are prepared on top of v3.16-rc3 with '[PATCH v2 0/4] Add
> Exynos4412 based Odroid X2 and U2/U3/U3+ support' series and '[PATCH]
> ARM: dts: exynos4412-odroid: add support for GPIO buttons' patch
> applied:
> http://www.spinics.net/lists/linux-samsung-soc/msg33115.html
> http://www.spinics.net/lists/linux-samsung-soc/msg33497.html
>
> Kernel tree with all Odroid related patches is available at
> http://git.linaro.org/git-ro/people/marek.szyprowski/linux-srpol.git
> on v3.16-odroid branch.
>
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
>
> Marek Szyprowski (6):
>   clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER clocks
>   drm: exynos: hdmi: make 'hdmi-en' regulator optional and keep it
>     enabled
>   drm: hdmi/mixer: enable exynos 4210 and 4x12 soc support
>   Exynos: add support for 'domain-always-on' property
>   ARM: dts: exynos4: add hdmi related nodes
>   ARM: dts: exynos4412-odroid: enable hdmi support
>
> Tomasz Stanislawski (1):
>   ARM: dts: exynos4210-universal_c210: enable hdmi support
>
>  .../bindings/arm/exynos/power_domain.txt           |  2 +
>  .../devicetree/bindings/video/exynos_mixer.txt     |  5 +-
>  arch/arm/boot/dts/exynos4.dtsi                     | 37 ++++++++++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts    | 65 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  |  5 ++
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 52 +++++++++++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 10 ++++
>  arch/arm/mach-exynos/pm_domains.c                  |  6 +-
>  drivers/clk/samsung/clk-exynos4.c                  |  4 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               | 29 +++++++++-
>  drivers/gpu/drm/exynos/exynos_mixer.c              | 51 ++++++++++++-----
>  include/dt-bindings/clock/exynos4.h                |  2 +
>  12 files changed, 247 insertions(+), 21 deletions(-)
>
> --
> 1.9.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
