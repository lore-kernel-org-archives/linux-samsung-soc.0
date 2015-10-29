From: Pankaj Dubey <dubepankaj1980@gmail.com>
Subject: Re: [PATCH v4 0/4] [PATCH v4 0/4] Exynos SROMc configuration and
 Ethernet support for SMDK5410
Date: Thu, 29 Oct 2015 23:16:44 +0530
Message-ID: <CAGcde9GtepdzFLCfW+ughAdyU_sKXUhgK35z434FPOFXpmRX9Q@mail.gmail.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:36057 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757914AbbJ2RrF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 13:47:05 -0400
In-Reply-To: <cover.1446122247.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>
Cc: devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>

On 29 October 2015 at 18:12, Pavel Fedin <p.fedin@samsung.com> wrote:
> This patch extends Exynos SROM controller driver with ability to configure
> controller outputs and enables SMSC9115 Ethernet chip on SMDK5410 board,
> which is connected via SROMc bank #3.
>
> With this patchset, support for the whole existing SMDK range can be added.
> Actually, only bank number is different.
>
> This patchset also depends on Exynos 5410 pinctrl support, introduced by
> patches 0003 and 0004 from this set:
> [PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html
>
> Pinctrl support is necessary in order to correctly configure
> multifunctional pins of the Exynos chip.
>
> v3 => v4:
> - Devices are now added as subnodes, with additional properties. This allows
>   to cleary specify dependency. If configuration fails, error will be reported
>   and child devices will not be probed.
> - These additional properties now have "samsung,srom-XXX" format
> - Fixed code style, now better understood.
>
> v2 => v3:
> - Fixed up SROMc region size in the device tree
> - Reordered patches, documentation goes first now
>
> v1 => v2:
> - Fixed some typos and bad labels in device tree
> - Improved documentation
>
> Pavel Fedin (4):
>   Documentation: dt-bindings: Describe SROMc configuration
>   ARM: dts: Add SROMc to Exynos 5410
>   drivers: exynos-srom: Add support for bank configuration
>   ARM: dts: Add Ethernet chip to SMDK5410
>
>  .../bindings/arm/samsung/exynos-srom.txt           | 50 ++++++++++++++++++-
>  arch/arm/boot/dts/exynos5410-smdk5410.dts          | 41 +++++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi                  | 15 ++++++
>  arch/arm/mach-exynos/Kconfig                       |  2 +-
>  drivers/soc/samsung/Kconfig                        |  2 +-
>  drivers/soc/samsung/exynos-srom.c                  | 58 +++++++++++++++++++++-
>  6 files changed, 162 insertions(+), 6 deletions(-)
>

Something wrong here, I am not able to find V4 1/4 and 3/4 in this mailing list.

Thanks,
Pankaj Dubey
> --
> 2.4.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
