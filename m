From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 0/2] ARM: Exynos: Enable I2S platform support for Exynos5
Date: Fri, 23 Nov 2012 16:51:38 +0530
Message-ID: <CAAgF-BdP=eTV40UyO9iqMAyvSmA3R2yxWbGL8jmm4VwOwfPguA@mail.gmail.com>
References: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:38438 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755851Ab2KWLVj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:21:39 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so4249873lag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:21:38 -0800 (PST)
In-Reply-To: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown

On Tue, Nov 6, 2012 at 10:14 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Changes since V2:
>         - Rebased to 3.7-rc3
>         - Custom DT bindings are prefixed with samsung
>         - idma address is moved from dts file dtsi file as it is soc specific
>           property
>
> Changes since V1:
>         - Rebased to 3.6-rc6
>
> This patch set enables device tree based platform support for the three I2S
> controllers on Samsung's Exynos5 SoC's.
>
> Padmavathi Venna (2):
>   ARM: dts: Add nodes for i2s controllers for Samsung Exynos5 platforms
>   ARM: EXYNOS: Enable platform support for I2S controllers
>
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         |   28 ++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-exynos5-dt.c    |    6 ++++++
>  3 files changed, 49 insertions(+), 0 deletions(-)
>
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
