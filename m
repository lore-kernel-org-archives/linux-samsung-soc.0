From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 08 Apr 2014 18:47:28 +0200
Message-ID: <53442820.30501@linaro.org>
References: <533EAE57.1080202@linaro.org> <5343D709.10708@samsung.com> <CAGm_ybjL-oA_C=VH4MMt_X45hrdKt8GMkwQtq5EJ94TvA4iqYw@mail.gmail.com> <5344075D.2030203@linaro.org> <5344203B.6080702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:38956 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757249AbaDHQrM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 12:47:12 -0400
Received: by mail-wg0-f47.google.com with SMTP id x12so1246651wgg.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 09:47:11 -0700 (PDT)
In-Reply-To: <5344203B.6080702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, sunil joshi <joshi@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>

On 04/08/2014 06:13 PM, Tomasz Figa wrote:
> Hi Daniel, Vikas, Chander,
>
> On 08.04.2014 16:27, Daniel Lezcano wrote:
>> On 04/08/2014 03:32 PM, Vikas Sajjan wrote:
>>>   Hi Daniel,
>>>
>>>   I checked AFTR on v3.14 (
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log=
/?id=3Drefs/tags/v3.14)
>>>
>>>
>>>   on exynos5250 based chromebook (exynos5250-snow.dtb)
>>>
>>> I am able to hotplug CPU1  (echo 0 >
>>> /sys/devices/system/cpu/cpu1/online).
>>> I can see, it enters exynos4_enter_core0_aftr() when I hotplug CPU1=
=2E
>>
>> Hi,
>>
>> thanks a lot for your help.
>>
>> I reproduced it on my arndale board with linux-samsung/for-next and =
on
>> v3.14.
>>
>> Used the exynos_defconfig, enabled cpuidle and used
>> exynos5250-arndale.dtb.
>>
>
> You should compare your bootloader versions as this is one of the
> aspects that can break AFTR support as it relies on kind of ABI betwe=
en
> bootloader and kernel.

U-Boot 2013.01.-rc1 (Jul 10 2013 - 15:16:09) for ARNDALE5250
gcc-4.7 (Ubuntu/Linaro 4.7.3-1ubuntu1) 4.7.3
GNU ld (GNU Binutils for Ubuntu) 2.23.2



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
