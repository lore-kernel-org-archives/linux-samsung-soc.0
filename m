From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: Watchdog reset trigger for eMMC
Date: Tue, 3 May 2016 08:05:43 +0530
Message-ID: <CANAwSgS4Go_LSay5hN+sWK-gV5uFqnNmU_Uzm9Wried5GSkMhg@mail.gmail.com>
References: <CANAwSgTjQdDtQ1GpWVd6_c=epSG+kTFadimsAk=Hf84JasOhUw@mail.gmail.com>
 <707055b5-6a94-1f78-717f-082574ea9ce6@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35627 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932239AbcECCgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 22:36:05 -0400
In-Reply-To: <707055b5-6a94-1f78-717f-082574ea9ce6@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Marek

On 2 May 2016 at 11:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Hi Anand
>
>
> On 2016-04-30 08:06, Anand Moon wrote:
>>
>> Hi All,
>>
>> Using microSD card when I try to write into /dev/watchdog device
>> it triggers reboot of the board after timer expires.
>>
>> -----------------------------------------------------------------------------------------------
>> root@odroidxu4l:~# echo 3 > /dev/watchdog
>> [ 1659.021844] watchdog: watchdog0: watchdog did not stop!
>> root@odroidxu4l:~#
>> root@odroidxu4l:~#
>> root@odroidxu4l:~#
>> root@odroidxu4l:~#
>> root@odroidxu4l:~#
>>
>> U-Boot 2016.03-00665-g563d8d9-dirty (Apr 04 2016 - 22:27:07 +0930) for
>> ODROID-XU
>>                  3
>>
>> CPU:   Exynos5422 @ 800 MHz
>> Model: Odroid XU3 based on EXYNOS5422
>> Board: Odroid XU3 based on EXYNOS5422
>> Type:  xu4
>> DRAM:  2 GiB
>>
>> -----------------------------------------------------------------------------------------------
>> But when I try this on eMMC it just freezes.
>> I know we have to set and unset gpio pin (SD_0.RST) to trigger reset
>> before reboot.
>>
>> -----------------------------------------------------------------------------------------------
>> root@odroidxu4e:~# echo 4 > /dev/watchdog
>> [  639.192617] [c3] watchdog watchdog0: watchdog did not stop!
>> root@odroidxu4e:~#
>> root@odroidxu4e:~#
>> root@odroidxu4e:~#
>>
>> -----------------------------------------------------------------------------------------------
>> I would like to know what is way board reset after watchdog reset after
>> timeout.
>
>
> In my opinion hw watchdog reset is non-functional on Odroid U3/XU3/XU4
> boards due to
> hardware design (eMMC reset line triggered from software). I see no way to
> workaround
> this issue in the software.
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Yes It's difficult to reset eMMC card.
Thanks for clarification.

Best Regards
-Anand Moon
