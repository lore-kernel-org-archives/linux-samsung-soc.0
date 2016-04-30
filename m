From: Anand Moon <linux.amoon@gmail.com>
Subject: Watchdog reset trigger for eMMC
Date: Sat, 30 Apr 2016 11:36:01 +0530
Message-ID: <CANAwSgTjQdDtQ1GpWVd6_c=epSG+kTFadimsAk=Hf84JasOhUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35394 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbcD3GGW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Apr 2016 02:06:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi All,

Using microSD card when I try to write into /dev/watchdog device
it triggers reboot of the board after timer expires.
-----------------------------------------------------------------------------------------------
root@odroidxu4l:~# echo 3 > /dev/watchdog
[ 1659.021844] watchdog: watchdog0: watchdog did not stop!
root@odroidxu4l:~#
root@odroidxu4l:~#
root@odroidxu4l:~#
root@odroidxu4l:~#
root@odroidxu4l:~#

U-Boot 2016.03-00665-g563d8d9-dirty (Apr 04 2016 - 22:27:07 +0930) for
ODROID-XU
                3

CPU:   Exynos5422 @ 800 MHz
Model: Odroid XU3 based on EXYNOS5422
Board: Odroid XU3 based on EXYNOS5422
Type:  xu4
DRAM:  2 GiB
-----------------------------------------------------------------------------------------------
But when I try this on eMMC it just freezes.
I know we have to set and unset gpio pin (SD_0.RST) to trigger reset
before reboot.
-----------------------------------------------------------------------------------------------
root@odroidxu4e:~# echo 4 > /dev/watchdog
[  639.192617] [c3] watchdog watchdog0: watchdog did not stop!
root@odroidxu4e:~#
root@odroidxu4e:~#
root@odroidxu4e:~#
-----------------------------------------------------------------------------------------------
I would like to know what is way board reset after watchdog reset after timeout.

Best Regards
-Anand Moon
