From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 08 Apr 2014 18:13:47 +0200
Message-ID: <5344203B.6080702@samsung.com>
References: <533EAE57.1080202@linaro.org> <5343D709.10708@samsung.com>
 <CAGm_ybjL-oA_C=VH4MMt_X45hrdKt8GMkwQtq5EJ94TvA4iqYw@mail.gmail.com>
 <5344075D.2030203@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38104 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932117AbaDHQNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 12:13:52 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3P00GP0ZR07370@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Apr 2014 17:13:48 +0100 (BST)
In-reply-to: <5344075D.2030203@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Vikas Sajjan <sajjan.linux@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, sunil joshi <joshi@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>

Hi Daniel, Vikas, Chander,

On 08.04.2014 16:27, Daniel Lezcano wrote:
> On 04/08/2014 03:32 PM, Vikas Sajjan wrote:
>>   Hi Daniel,
>>
>>   I checked AFTR on v3.14 (
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?id=refs/tags/v3.14)
>>
>>   on exynos5250 based chromebook (exynos5250-snow.dtb)
>>
>> I am able to hotplug CPU1  (echo 0 >
>> /sys/devices/system/cpu/cpu1/online).
>> I can see, it enters exynos4_enter_core0_aftr() when I hotplug CPU1.
>
> Hi,
>
> thanks a lot for your help.
>
> I reproduced it on my arndale board with linux-samsung/for-next and on
> v3.14.
>
> Used the exynos_defconfig, enabled cpuidle and used exynos5250-arndale.dtb.
>

You should compare your bootloader versions as this is one of the 
aspects that can break AFTR support as it relies on kind of ABI between 
bootloader and kernel.

Bets regards,
Tomasz
