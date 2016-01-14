From: Vasco Steinmetz <vasco@kyberraum.net>
Subject: Re: Slow performance of Odroid XU4 - cpufreq-dt patch needed?
Date: Thu, 14 Jan 2016 18:30:29 +0100
Message-ID: <5697DB35.5000601@kyberraum.net>
References: <56967861.10305@kyberraum.net>
 <CAJKOXPdZr_GhUwtnh1p7wLgzs7DXOQKCVTmmfZJ2LnPao0XJZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from nexus.metro.kyberraum.net ([195.47.195.230]:42566 "EHLO
	mx1.kyberraum.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756281AbcANRac (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2016 12:30:32 -0500
In-Reply-To: <CAJKOXPdZr_GhUwtnh1p7wLgzs7DXOQKCVTmmfZJ2LnPao0XJZw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> Where there is no cpufreq driver, everything depends on the
> bootloader. Usually the bootloader sets the initial value of clocks
> and regulators. It shouldn't be the lowest value, though.

Right. The u-bloat in use is the pretty old one provided by hk (modified
u-boot-2012 IIRC), so that may explain unsuitable initial clock values.
Compiled a recent u-boot-2015.10 and also one from trunk, but it's image
size exceeds the hardcoded offsets within the signed firmware bootloader
from hk required to load u-boot.
Had also no success with another hk firmware bootloader I found which
could boot >500K u-boot images. It's a mess on this board (compared to
panda/beagle[bone]s).

Since I haven't got a 1.8v ttl uart cable with that rare connector,
debugging/analyzing bootloader or early kernel issues such as cpu init
or modifying the kconfig is pretty hard.

> There was a patch from Anand Moon ("ARM: dts: use vmmc-supply of
> emmc/sd for exynos5422-odroidxu3") but it did not reach the level of
> acceptance for merging. It would be nice to continue that work.

I saw that and hoped he'd repost an improved version based on your
comments. I'm new to this list so I will not try to bother you by
submitting patches (yet ;-).


Cheers,
Vasco
