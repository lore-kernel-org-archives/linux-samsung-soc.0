From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Thu, 28 May 2015 10:49:05 +0200
Message-ID: <5566D681.2030107@samsung.com>
References: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
 <55667652.5050102@samsung.com> <025901d098fa$da62d320$8f287960$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57246 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbbE1ItJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 04:49:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NP100LK0XTVJ050@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 May 2015 09:49:07 +0100 (BST)
In-reply-to: <025901d098fa$da62d320$8f287960$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, kgene@kernel.org, k.kozlowski@samsung.com
Cc: cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, Przemyslaw Marczak <p.marczak@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2015-05-28 06:00, Chanho Park wrote:
>> -----Original Message-----
>> From: Joonyoung Shim [mailto:jy0922.shim@samsung.com]
>> Sent: Thursday, May 28, 2015 10:59 AM
>> To: Chanho Park; kgene@kernel.org; k.kozlowski@samsung.com
>> Cc: cw00.choi@samsung.com; linux-samsung-soc@vger.kernel.org;
>> javier.martinez@collabora.co.uk; khilman@linaro.org;
>> sjoerd.simons@collabora.co.uk; heesub.shin@samsung.com
>> Subject: Re: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
>>
>> Hi Chanho,
>>
>> On 05/28/2015 12:15 AM, Chanho Park wrote:
>>> The odroid-xu3 board which is based on exynos5422 not exynos5800 is
>>> booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu
>> order
>>> is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
>>> cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
>>> and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7
>> and
>>> cpu4-7 are cortex-a15.
>> The exynos5422 SoC can boot using cortex-a15 cpu depending on gpio
>> GPG2CON[1],
> Yes, But, the pin is not controllable because it's checked in  the iROM
> area.
>
>> i think this is just Odroid-XU3 board problem. Is it
>> possible to overwrite cpus information directly from
>> exynos5422-odroidxu3.dts?
> It's possible to override the info in the odroidxu3.dts. As you know,
> however, a new exynos5422 board will be added soon. The board also has same
> configuration of the gpio pin and booted cpu0 from a cortex-a7 core.
>
> BTW, booting of secondary cpus are still broken. Is there any progress of
> the patch[1]?
> This patch is also generated top of the patch with some fixes.

Przemyslaw is checking how to solve this issue in the bootloader like it has
been solved for Exynos 5800 based Chromebooks. The plan is to use the same
SPL code as mentioned here:
https://www.mail-archive.com/u-boot@lists.denx.de/msg159960.html

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
