From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/4] Samsung exynos7 updates for v3.19
Date: Fri, 28 Nov 2014 13:35:55 +0100
Message-ID: <201411281335.55663.arnd@arndb.de>
References: <5476CD88.1030406@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:60517 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339AbaK1Mg2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:36:28 -0500
In-Reply-To: <5476CD88.1030406@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, Mike Turquette <mturquette@linaro.org>

On Thursday 27 November 2014, Kukjin Kim wrote:
> Samsung arch/arm64 DT updates for v3.19
> 
> - to support ARMv8 based exynos7 SoC
>   : add initial device tree and add pinctrl, PMU, mmc, i2c, rtc,
>     watchdog, and adc nodes for exynos7 SoC and exynos7 based
>     espresso board.
> 
> NOTE that this is including following dependencies
> : cleanup/dts-subdirs in arm-soc for arm64 vendor support
> : tags/samsung-driver for samsung serial
> : for-v3.19/exynos-clk in samsung-clk tree for exynos7 clk
> 
> One more NOTE, for support exynos7 we need Liviu's "arm64: Create
> link to include/dt-bindings to enable C preprocessor use" in arm-soc
> tree and arm64 defconfig update should be handled directly.

I'm confused by the dependencies. I don't see a "for-v3.19/exynos-clk"
in arm-soc, you haven't put the clk maintainer on Cc and I see no indication
that he has this in his tree already, so I'm not pulling this until further
clarification.

	Arnd
