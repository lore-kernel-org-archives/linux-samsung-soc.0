From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung DT updates for v4.4
Date: Wed, 14 Oct 2015 18:03:26 +0200
Message-ID: <41536735.3LmBWhHMre@wuerfel>
References: <561C111F.3060704@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:65207 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713AbbJNQEB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Oct 2015 12:04:01 -0400
In-Reply-To: <561C111F.3060704@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Tuesday 13 October 2015 04:59:27 Kukjin Kim wrote:
> Samsung DT updates for v4.4
> 
> - New board support
>   : add exynos5250-snow-rev5 DT file to support Snow Rev5+ board
>   : add exynos5422-odroidxu4 DT file to support Odroid XU4 board
>   : split exynos5422-odroidxu3-audio DT file from odroidxu3-common
> 
> - USE GPIO constants for flags cells for exynos boards
> - fix cpu compatible value to 'arm926ej-s' for s3c2416
> 
> - add DMA support for serial ports for exynos4
> - add suspend opp for exynos4412
> - remove regulator-compatible usage for exynos4412-trats2
> 
> - enable EC vboot context support for Peach boards
> - move display-timings node to DP for exynos5250-arndale, smdk5250 and
> smdk5420
> 
> - for exynos4412-odroid/odroidu3
>   : unify voltage regulator style and
>   : remove redundant pinctrl settings
>   : add pwm-fan node and use it as a colling device
> 
> - for exynos5422-odroidxu3
>   : fix power off method and LEDs
> 
> - dt-bindings
>   : grounded AC0KB pin on S2MPS11
>   : entry how to use PWM FAN as a cooling device

Pulled into next/dt, thanks!

	Arnd
