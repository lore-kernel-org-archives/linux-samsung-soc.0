Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3104FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12C80610E6
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhJFWNd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:13:33 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:61831 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJFWNc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 18:13:32 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211006221138epoutp01f634c5dc5ba5093b7207d6c07f612069~rkJ4IkzZj0379803798epoutp01o
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 22:11:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211006221138epoutp01f634c5dc5ba5093b7207d6c07f612069~rkJ4IkzZj0379803798epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633558298;
        bh=xV3O9FAdtIzJWwH367eFF6u8bGcHQgtg8LEkM2DZNuo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=QDf5kqeLuVAi1JcqyHLKD2Y76+iK40Qa8y93EdWktXgTQ5VvmHAdOTfPrzgsWHlpU
         CpJreOL12JsV1e9hmrDNLLj7wbIau0BR/desQZol8O5JiRSfUYH1XpiHzJPgH4FDoz
         ZAoUbpBiRXO1IADafesRQQKMdZWbGHaaPCrUU4Vo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211006221137epcas1p12910942853d3262771a567faf087bead~rkJ3vAZrp0370903709epcas1p1E;
        Wed,  6 Oct 2021 22:11:37 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HPpZX3pL5z4x9Px; Wed,  6 Oct
        2021 22:11:32 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        B0.4F.24398.11F1E516; Thu,  7 Oct 2021 07:11:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20211006221132epcas1p4ce65b2f24cbcb5bb869c074567205cc5~rkJydSeVN0693506935epcas1p40;
        Wed,  6 Oct 2021 22:11:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211006221132epsmtrp26d1d01a6b0268c573abe4de864ccfa48~rkJycZtTc0941309413epsmtrp2x;
        Wed,  6 Oct 2021 22:11:32 +0000 (GMT)
X-AuditID: b6c32a35-0d7ff70000005f4e-a3-615e1f110b62
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.69.08750.01F1E516; Thu,  7 Oct 2021 07:11:28 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211006221131epsmtip1fcfe5b21d1f1ed07ecc25d5054e2389f~rkJyInAfg2698426984epsmtip1L;
        Wed,  6 Oct 2021 22:11:31 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <1c345d2e-e028-2a3c-6b38-368841542332@samsung.com>
Date:   Thu, 7 Oct 2021 07:12:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFr0gbjzTPs1gxAg=1DPhe7tM6R9sGT9rSCX2BtFh2hekA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmga6gfFyiQeNLYYtXtyYzW5w/v4Hd
        Ysb5fUwWa4/cZbdYP+0nq0X705fMFsfXhjuwe+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        a1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QFUoK
        ZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAtMCveLE3OLSvHS9vNQSK0MDAyNToMKE
        7IwVE66yFxx3rDh58i5zA2OzaRcjJ4eEgInEwp2L2LsYuTiEBHYwSvTf/ccE4XxilHj1fztU
        5jOjxNKNNxhhWtYuWQJVtYtRYv7RPqiq94wSb04vB6sSFnCVOD/vPpgtIlAn8Xh5CxtIEbPA
        dUaJKw9XsIEk2AR0JLZ/O84EYvMK2Ek8+tAM1sAioCLRO283O4gtKhAp8ffkLlaIGkGJkzOf
        sIDYnAKBEt9fzgezmQXEJW49mc8EYctLNG+dzQyyTEJgIofEwR/v2SHudpHYduUhE4QtLPHq
        +BaouJTE53d72SDsaoldzWegmjsYJW5ta4JqMJbYv3QykM0BtEFTYv0ufYiwosTO33MZIRbz
        Sbz72sMKUiIhwCvR0SYEUaIicen1SyaYVXef/Icq8ZDYs1h9AqPiLCSfzULyzSwk38xC2LuA
        kWUVo1hqQXFuemqxYYEhPLqT83M3MYKTqJbpDsaJbz/oHWJk4mA8xCjBwawkwptvH5soxJuS
        WFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OBaTyvJN7QxNLAxMzI2MTC0MxQSZz32GvLRCGB9MSS
        1OzU1ILUIpg+Jg5OqQYmJrbDt5ie33nFduXcP0vvGayfL67c+dekTown7Oyd7enfG2/E2q3d
        7zBB7uhDqT5zr/OzuWdcZH5V/Xzipjj7ad8tRR5P2j/V4VWTW/ydjHnef2fdMTjqZHFwm7Ha
        YtkTnQt8tE9UH+1oMXaIafq0feI0zXsNRkI3F/REXue+aFjRtiFGyCn9y1/PBZwdQetL3PZM
        fff+59cqgZsKJbVp3h+SAi2VWvp3n34RP3/y1v/dE06xVrBE9TLJXwq8fdKs6rXTixPavF8S
        XnrfSO9Xf9Xa2ubE/rJsaXueYa/dzJkS23fcbZBmlZWx/9G1tGVGy+WCkx5vDPgYJ8y4u4NN
        327lg0/LozS2sj1ctpRlmRJLcUaioRZzUXEiAOOdxvYrBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnK6AfFyiwaW7phavbk1mtjh/fgO7
        xYzz+5gs1h65y26xftpPVov2py+ZLY6vDXdg99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkA
        1igum5TUnMyy1CJ9uwSujBUTrrIXHHesOHnyLnMDY7NpFyMnh4SAicTaJUuYuhi5OIQEdjBK
        /Ju8nh0iISXx+elUti5GDiBbWOLw4WKImreMEs+Pf2YCqREWcJU4P+8+I0hCRKCBUaJn4SsW
        EIdZ4DqjxIe169lAqoQEPjJL/FmeCWKzCehIbP92HKybV8BO4tGHZkYQm0VARaJ33m6wzaIC
        kRJNJ7ayQdQISpyc+YQFxOYUCJT4/nI+mM0soC7xZ94lZghbXOLWk/lMELa8RPPW2cwTGIVm
        IWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4bLa0djHtW
        fdA7xMjEwXiIUYKDWUmEN98+NlGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZ
        qakFqUUwWSYOTqkGppAEjXB2+0tNIas3Zl//lmvs2dh491XeFv622R+557gfjty148ar8kLO
        6VLXkhO6ChnklhpE7zD8YK77c/asiMw186qd2+NSDR56aLhprG9RuHn/eeUSw9q8NZlH1u6W
        v/Tu7u3pOg3aFyPcusoDt5/f/Z3ri+DzJ0tdzX6vPxG03K1QSWqL/Gmmhi/8YllTpdX13Q0z
        le/tYeKpyZp52a906bbAzX8U/loESmR2Vj6XEV7yMWnKJv3XZ65/8LoqJa0VmOgfqjBvbvPf
        bBXnNYXP7Wp/KGUpbPrg8ZeH68VzqQkP4zs8A/9p5jXoBnH61qR4hKYH7Pl2+99LHrsLNdo7
        pm9PFPurezWnZpqmEktxRqKhFnNRcSIArxCkJgoDAAA=
X-CMS-MailID: 20211006221132epcas1p4ce65b2f24cbcb5bb869c074567205cc5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
        <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
        <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
        <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
        <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
        <04ab2789-0218-42be-888d-a54ab2826e15@kernel.org>
        <043cf847-729d-07ca-2395-411edfdf66de@samsung.com>
        <CAPDyKFr0gbjzTPs1gxAg=1DPhe7tM6R9sGT9rSCX2BtFh2hekA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/6/21 7:40 PM, Ulf Hansson wrote:
> On Mon, 4 Oct 2021 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On 04.10.2021 15:01, Krzysztof Kozlowski wrote:
>>> On 04/10/2021 12:07, Marek Szyprowski wrote:
>>>> On 01.10.2021 02:40, Jaehoon Chung wrote:
>>>>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>>>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>>>>> <christianshewitt@gmail.com> wrote:
>>>>>>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>>>>>>
>>>>>>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>>>>>>
>>>>>>> Without:
>>>>>>>
>>>>>>> [    3.227837] mmc0: tuning execution failed: -5
>>>>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>>>>>> [    3.536450] mmc0: tuning execution failed: -5
>>>>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>>>>>> [    3.794056] mmc0: tuning execution failed: -5
>>>>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>>>>>> [    4.111097] mmc0: tuning execution failed: -5
>>>>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>>>>>> [    4.426164] mmc0: tuning execution failed: -5
>>>>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>>>>>> [    4.756226] mmc0: tuning execution failed: -5
>>>>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>>>>>
>>>>>>> With:
>>>>>>>
>>>>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>>>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>>>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>>>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>>>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>>>>>>> [    3.315963]  mmcblk0: p1 p2
>>>>>>>
>>>>>>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>>>>>>
>>>>>>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
>>>>>> The patch might have sense but would require describing conditions -
>>>>>> what MMC input and output clock settings work and which do not work.
>>>>>> Also someone would need to test other Exynos5422 boards and other
>>>>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>>>>> this should not affect SD cards.
>>>>> Thanks for adding me.
>>>>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>>>>>
>>>>> [    4.561934] mmc1: new HS400 MMC card at address 0001
>>>>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>>>>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
>>>>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>>>>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>>>>
>>>>> Which kernel version did you use?
>>>> I came across this patch some time ago, but also didn't manage to
>>>> reproduce the issue - in my case eMMC was always detected properly. It
>>>> might be related to particular version or series of the eMMC modules.
>>>>
>>>> I've just checked that patch on XU3, XU4, PeachPi and TM2e boards. All
>>>> are working properly with it.
>>>>
>>>> I've also tried to benchmark the impact of that change and in some case
>>>> it causes some performance degradation.
>>>>
>>>> The main difference is clock configuration. Before this patch (XU4):
>>>>
>>>> # dmesg | grep mmc0
>>>> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz,
>>>> actual 396825HZ div = 63)
>>>> mmc_host mmc0: Bus speed (slot 0) = 200000000Hz (slot req 200000000Hz,
>>>> actual 200000000HZ div = 0)
>>>> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz,
>>>> actual 50000000HZ div = 0)
>>>> mmc_host mmc0: Bus speed (slot 0) = 400000000Hz (slot req 200000000Hz,
>>>> actual 200000000HZ div = 1)
>>>> mmc0: new HS400 MMC card at address 0001
>>>> mmcblk0: mmc0:0001 SDW16G 14.7 GiB
>>>> mmcblk0boot0: mmc0:0001 SDW16G 4.00 MiB
>>>> mmcblk0boot1: mmc0:0001 SDW16G 4.00 MiB
>>>> mmcblk0rpmb: mmc0:0001 SDW16G 4.00 MiB, chardev (245:0)
>>>>
>>>> After applying the patch (mmc device number is random depending on the
>>>> boot):
>>>>
>>>> # dmesg | grep mmc1
>>>> [    3.619177] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req
>>>> 400000Hz, actual 396825HZ div = 63)
>>>> [    4.057167] mmc_host mmc1: Bus speed (slot 0) = 200000000Hz (slot req
>>>> 200000000Hz, actual 200000000HZ div = 0)
>>>> [    4.070040] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req
>>>> 52000000Hz, actual 50000000HZ div = 0)
>>>> [    4.089028] mmc_host mmc1: Bus speed (slot 0) = 266666666Hz (slot req
>>>> 200000000Hz, actual 133333333HZ div = 1)
>>>> [    4.102296] mmc1: new HS400 MMC card at address 0001
>>>> [    4.119072] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>>>> [    4.173507] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>>>> [    4.196210] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>>> [    4.215163] mmcblk1rpmb: mmc1:0001 SDW16G 4.00 MiB, chardev (245:0)
>>>>
>>>> The performance has been measured with:
>>>>
>>>> # dd if=/dev/mmcblk1p6 of=/dev/null bs=128k
>>>> 31944+0 records in
>>>> 31944+0 records out
>>>> 4186963968 bytes (4.2 GB) copied, 36.6981 s, 114 MB/s
>>>>
>>>> Results (XU4 board):
>>>>
>>>> exynos_defconfig: 145 MB/s (before) vs 114 MB/s (after)
>>>> exynos_defconfig + all devfreqs set to performance: 146 MB/s vs 115 MB/s
>>>> exynos_defconfig + cpufreq & all devfreqs set to performance: 154 MB/s
>>>> vs 139 MB/s
>>>> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ disabled: 130 MB/s vs
>>>> 108 MB/s
>>>> exynos_defconfig + CONFIG_CPUFREQ_DT disabled: 69 MB/s (no impact)
>>>> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ & CONFIG_CPUFREQ_DT: 66
>>>> MB/s (no impact)
>>>>
>>>>
>>>> Maybe some other clock configuration (I mean the rate of the top-level
>>>> clocks or even PLLS) will solve the issue without degrading the
>>>> performance, but it is hard to judge that without reproducing the issue.
>>>>
>>> Thanks for testing and performance measurements. The read speed seems to
>>> be a direct effect of lower mmc bus frequency (DIVRATIO changed from 2
>>> to 3).
>>>
>>> What next? Except what Marek suggested, maybe compare MMC card
>>> capabilities and try to find a difference? For example Marek's eMMC (at
>>> least one with logs) is from Sandisk SDW16G. Christian's and Marian's
>>> (Memeka / mihailescu2m) is apparently Samsung's 8GME4R.
>>
>> I have also eMMC modules with AJTD4R and 016G92 IDs. I can test them,
>> but that won't happen soon due to remote work.
>>
>>> Because the patch reduces performance and not all users are affected, I
>>> have some doubts. Maybe use by default lower clock (so as in this patch)
>>> but if card is in list of known good cards go higher?
>>>
>>> Another idea is to use always slower bus because it is simply safer and
>>> we do not have resources to test 100x of different eMMC modules...
>>>
>>> Any comments from you?
>>
>> I vote for the safer clock rates. Maybe we can add some dt-property for
>> the higher rates for the boards with the known to be working properly
>> eMMC modules.
> 
> We already have a common mmc DT property, "max-frequency". I think
> that should fit well, as it allows us to cap the frequency on those
> boards that need this, right?

It's already using "max-frequency" for those boards.I think that its value is correct.
I will check this issue on this week. Will share after checking what's best solution.

> 
> Having a card quirk could be another option, but then we need to be
> sure that it's actually the card that has the limitation.

I don't want to use a card quirk if there is no solution to issue.

Best Regards,
Jaehoon Chung

> 
> Kind regards
> Uffe
> 

