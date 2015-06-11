From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL 3/5] Samsung DT updates for v4.2
Date: Thu, 11 Jun 2015 14:50:20 -0700
Message-ID: <7hh9qddieb.fsf@deeprootsystems.com>
References: <5571E4CB.3070302@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34451 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbbFKVuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:50:23 -0400
Received: by payr10 with SMTP id r10so9991286pay.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:50:23 -0700 (PDT)
In-Reply-To: <5571E4CB.3070302@kernel.org> (Kukjin Kim's message of "Sat, 06
	Jun 2015 03:04:59 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin Kim <kgene@kernel.org> writes:

> The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:
>
>   Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-3
>
> for you to fetch changes up to 5ec1d441a4227b2dfdc47fdc13aa7c6c50496194:
>
>   ARM: dts: Add syscon property to the MIPI DPHY for exynos4415
> (2015-06-03 09:47:05 +0900)
>
> ----------------------------------------------------------------
> Samsung DT updates for v4.2
>
> - for exyos3250
>   : use s3c6410-rtc instead of exynos3250-rtc
>   : add JPEG codec node and support it on exynos3250-rinato
>   : use s3c-rtc clock id for exynos3250-rinato and monk boards
>
> - for exynos4
>   : add JPEG codec node and syscon property to MIPI DPHY
>   : remove obsolete MIPI DPHY reg property
>   : enable s3c-rtc on exynos4412-trats2
>
> - for exynos5
>   : add syscon property to MIPI DPHY for exynos5420
>   : enable s3c-rtc on exynos5420-arndale-octa
>   : add missing irq pinctrl for max77686 on exynos5250-smdk5250
>
>   : clk: add bindings for 32kHz clocks from s2mps11
>   : fix pinctrl for s2mps11-irq on exynos5420-arndale-octa
>
> - for exynos5422-odroidxu3
>   : add mmc detect gpio and LEDs
>   : add HS400 support, simple-audio-card and rtc_src clock
>
> ----------------------------------------------------------------

Pulled into next/dt.

Thanks,

Kevin
