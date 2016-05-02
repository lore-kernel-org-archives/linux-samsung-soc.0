From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Watchdog reset trigger for eMMC
Date: Mon, 02 May 2016 08:27:38 +0200
Message-ID: <707055b5-6a94-1f78-717f-082574ea9ce6@samsung.com>
References: <CANAwSgTjQdDtQ1GpWVd6_c=epSG+kTFadimsAk=Hf84JasOhUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35518 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960AbcEBG1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 02:27:52 -0400
In-reply-to: <CANAwSgTjQdDtQ1GpWVd6_c=epSG+kTFadimsAk=Hf84JasOhUw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Anand


On 2016-04-30 08:06, Anand Moon wrote:
> Hi All,
>
> Using microSD card when I try to write into /dev/watchdog device
> it triggers reboot of the board after timer expires.
> -----------------------------------------------------------------------------------------------
> root@odroidxu4l:~# echo 3 > /dev/watchdog
> [ 1659.021844] watchdog: watchdog0: watchdog did not stop!
> root@odroidxu4l:~#
> root@odroidxu4l:~#
> root@odroidxu4l:~#
> root@odroidxu4l:~#
> root@odroidxu4l:~#
>
> U-Boot 2016.03-00665-g563d8d9-dirty (Apr 04 2016 - 22:27:07 +0930) for
> ODROID-XU
>                  3
>
> CPU:   Exynos5422 @ 800 MHz
> Model: Odroid XU3 based on EXYNOS5422
> Board: Odroid XU3 based on EXYNOS5422
> Type:  xu4
> DRAM:  2 GiB
> -----------------------------------------------------------------------------------------------
> But when I try this on eMMC it just freezes.
> I know we have to set and unset gpio pin (SD_0.RST) to trigger reset
> before reboot.
> -----------------------------------------------------------------------------------------------
> root@odroidxu4e:~# echo 4 > /dev/watchdog
> [  639.192617] [c3] watchdog watchdog0: watchdog did not stop!
> root@odroidxu4e:~#
> root@odroidxu4e:~#
> root@odroidxu4e:~#
> -----------------------------------------------------------------------------------------------
> I would like to know what is way board reset after watchdog reset after timeout.

In my opinion hw watchdog reset is non-functional on Odroid U3/XU3/XU4 
boards due to
hardware design (eMMC reset line triggered from software). I see no way 
to workaround
this issue in the software.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
