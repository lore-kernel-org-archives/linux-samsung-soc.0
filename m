From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Slow performance of Odroid XU4 - cpufreq-dt patch needed?
Date: Thu, 14 Jan 2016 14:38:41 +0900
Message-ID: <CAJKOXPdZr_GhUwtnh1p7wLgzs7DXOQKCVTmmfZJ2LnPao0XJZw@mail.gmail.com>
References: <56967861.10305@kyberraum.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:37471 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270AbcANFin (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2016 00:38:43 -0500
Received: by mail-ig0-f169.google.com with SMTP id h5so122385984igh.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2016 21:38:42 -0800 (PST)
In-Reply-To: <56967861.10305@kyberraum.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasco Steinmetz <linux@kyberraum.net>
Cc: linux-samsung-soc@vger.kernel.org

2016-01-14 1:16 GMT+09:00 Vasco Steinmetz <linux@kyberraum.net>:
> Hello,
>
> I'm trying to get an Odroid XU4 to run a more recent (e.g. 4.4+) kernel
> than the last semiofficial 4.2 port from hardkernel (which doesn't boot
> here at all).
>
> Currently (thanks to a lot of patches from you guys) the board boots
> happily with a kernel build from linux-next.
>
> Nonetheless the CPU performance is rather poor, though all 8 cores are
> enabled (no b/l switcher).
>
> It seems to me the Cortex A15s are running in their slowest performance
> mode (that is: lowest clock).
> I don't know a way to read the core clocks, as no cpufreq driver is working.
> Tried that also with exynos_defconfig, but with the same effect.

Where there is no cpufreq driver, everything depends on the
bootloader. Usually the bootloader sets the initial value of clocks
and regulators. It shouldn't be the lowest value, though.

> Another point:
>
> The XU4's SD card controller supports UHS mode (tested by booting the
> original ubuntu with an ancient 3.x kernel on the emmc flash and reading
> from a UHS SD card), the current linux mainline kernel (4.4+) apparently
> doesn't either detect or enable UHS mode. The maximum SD speed is around
> 20MB/s instead of the 90MB/s the card supports and was shown with the
> test above.
>
> Is there patch available (maybe some missing dt clock or flag to enable
> UHS)?

There was a patch from Anand Moon ("ARM: dts: use vmmc-supply of
emmc/sd for exynos5422-odroidxu3") but it did not reach the level of
acceptance for merging. It would be nice to continue that work.

Best regards,
Krzysztof
