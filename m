From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 5/5] Samsung exynos updates for v3.19
Date: Fri, 28 Nov 2014 13:20:10 +0100
Message-ID: <201411281320.10442.arnd@arndb.de>
References: <546F493B.50605@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:60875 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbaK1MUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:20:22 -0500
In-Reply-To: <546F493B.50605@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Friday 21 November 2014, Kukjin Kim wrote:
> Samsung exynos updates in arch/arm/mach-exynos/ for v3.19
> 
> - add SOC_EXYNOS4415 config to be used in audio driver
> - add support platform driver for exynos PMU
> - move PMU specific definitions from common.h to exynos-pmu.h
> - for exynos5420, add support PMU and Suspend-to-RAM
>   use MCPM call backs and call regulator core suspend prepare
>   and finish functions

Pulled into next/soc, thanks!

	Arnd
