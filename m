From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/4] Samsung 3rd round of DT updates for v3.19
Date: Fri, 28 Nov 2014 13:30:51 +0100
Message-ID: <201411281330.52164.arnd@arndb.de>
References: <5476CD82.5050705@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:58369 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaK1MbB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:31:01 -0500
In-Reply-To: <5476CD82.5050705@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 27 November 2014, Kukjin Kim wrote:
> Samsung 3rd DT updates for v3.19
> 
> - exynos3250
>   : remove unused bootargs on exynos3250-rinato
>   : add new board dt file for exynos3250-monk
> - exynos4
>   : add missing clock for MFC
>   : specify default clocks for camera
> - exynos4x12
>   : add TMU related DT nodes
> - exynos4412-trats2
>   : add max77693-haptic and pwm nodes, enable TMU support
> - exynos4412-odroid
>   : specify audio clock parents and rates
> - exynos5250 and exynos5420
>   : add syscon based phandle to i2c device nodes
> - exynos5250-spring
>   : add trackpad, temperature sensor and usb3505 pinctrl
> 
> Note: based on previous tags/samsung-dt-2 for v3.19

Pulled into next/dt, thanks!

	Arnd
