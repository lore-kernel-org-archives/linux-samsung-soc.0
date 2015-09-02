From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid-*: add workaround for
 CPUfreq/reboot issue
Date: Wed, 02 Sep 2015 11:00:09 +0900
Message-ID: <55E65829.3050200@samsung.com>
References: <1441112929-6751-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPcgG+vABGk6Kgg-ct8LWGkZwQFmsaECZ-K90dN48N8XQw@mail.gmail.com>
 <15844858.D7Muz8OFGX@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55292 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbbIBCAM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 22:00:12 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NU100CCT1KA9420@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Sep 2015 03:00:10 +0100 (BST)
In-reply-to: <15844858.D7Muz8OFGX@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On 01.09.2015 23:08, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Tuesday, September 01, 2015 10:57:37 PM Krzysztof Kozlowski wrote:
>> 2015-09-01 22:08 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>>> Exynos4412-based Odroid boards (X2, U3, U3+) don't reset PMIC
>>> configuration during hardware reset. This causes serious issues with
>>> CPUfreq, when ARM voltage is set below 1.0V. When one resets the board
>>> when CPUfreq selected one of lower Exynos 4412 operating points (for
>>> example: 200MHz and 0.9V), the bootloader crashes and it is not possible
>>
>> s/crashes/hangs/ ? I did not observe a crash but a silent hang.
>>
>>> to restart the board without turning power off.
>>>
>>> This patch provides a workaround for this issue by increasing the start
>>> of valid range for vdd_arm regulator from 1.0V. After such change,
>>> CPUfreq can still use lower operating points, but the voltage won't be
>>> decreased below 1.0V and as a result it will be possible to reset board
>>> at any time.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> Do you plan to send the same fix for Trats2 board? Everything above
>> applies there as well plus suspend is affected. The board cannot
>> properly resume.
>>
>>> ---
>>> Hello,
>>>
>>> This issue was there from the beggining, but I was not able to reproduce
>>> it. It has been already reported by Tobias in early Feb 2015
>>> (http://www.spinics.net/lists/linux-samsung-soc/msg42294.html).
>>> Recently, after CPUfreq changes (conversion to generic cpufreq dt and
>>> enabling cpufreq in exynos_defconfig) it was much easier to observe this
>>> issue.
>>>
>>> This workaround lets one still use CPUfreq and avoid unexpect board
>>> crashes during reboot (both 'standard' and emergency).
>>
>> Work-around looks nice and clean. It still allows to use cpufreq and
>> reduce the energy consumption. The patch should go along with
>> cpufreq-dt support for Exynos4412 which hopefully would be for v4.3.
>> If cpufreq-dt for Exynos4412 won't get to v4.3 we can figure out
>> proper solution, not a work-around.
> 
> This work-around is needed also for the old exynos-cpufreq driver
> as the problem was already there on some Odroid setups (please read
> the mail from February pointed by Marek for details).

This probably would mean that this should go to stable as well but was
not marked as such. Any reason against backporting?


BTW, on old driver it seems that Trats2 is not affected. Both suspend
and reboot works.

Best regards,
Krzysztof

> 
> We don't have a better fix for the time being so I think that it
> should be merged now regardless of cpufreq-dt changes status.
> 
>> Anyway for the time being:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Thanks Marek,
>> BR
> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
