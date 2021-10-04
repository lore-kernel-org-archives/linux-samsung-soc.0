Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660E2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 15:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4937D6115B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 15:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbhJDPxs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 11:53:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47367 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbhJDPxs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 11:53:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211004155157euoutp01e061994909a6fd801ee92a717ceb51f0~q3rzli7Xu0660206602euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Oct 2021 15:51:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211004155157euoutp01e061994909a6fd801ee92a717ceb51f0~q3rzli7Xu0660206602euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633362717;
        bh=mUTUnb44IWaxivdESJixW1Jwx5/Bau3zIGNbYLOOhR8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=FhrlvB33Om7hiZF2J+10Way+dQ+H8+/5E0Q4TP913Rz/UO/ynIevKTEoW+AAm6FB0
         6DAV/0hJBonPa8/l8ETzO83FPkQ8VQFCVzKQ7yj2K4gKmrIwirtSAW9vLwvx9OUn+i
         v9ubjSZVzrZw1UPVAjTQE+cv3uT1LupAd1C2MSOY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211004155157eucas1p1bdddc703fcf69dc38fc7d8868934b44d~q3rzOlKgL3172831728eucas1p1-;
        Mon,  4 Oct 2021 15:51:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E0.B9.45756.D132B516; Mon,  4
        Oct 2021 16:51:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211004155156eucas1p1323886caa7f22158e2d69247ec397a20~q3ry1lm5d2867428674eucas1p1H;
        Mon,  4 Oct 2021 15:51:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211004155156eusmtrp14e3e477c29688e98fe889c1d69c81ab2~q3ry07SDT0978609786eusmtrp1R;
        Mon,  4 Oct 2021 15:51:56 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-ca-615b231d964e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6C.2C.20981.C132B516; Mon,  4
        Oct 2021 16:51:56 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211004155156eusmtip21551e737134a24f2e32c70204a7d0da6~q3ryXR0J01091310913eusmtip2k;
        Mon,  4 Oct 2021 15:51:56 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <043cf847-729d-07ca-2395-411edfdf66de@samsung.com>
Date:   Mon, 4 Oct 2021 17:51:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <04ab2789-0218-42be-888d-a54ab2826e15@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87qyytGJBquuCFq8ujWZ2eLGrzZW
        i/PnN7BbzDi/j8li/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFFcNimpOZllqUX6dglcGd96V7MXTLCq2Lmwg6mBsUG/i5GTQ0LAROLs/neMXYxcHEICKxgl
        pjetZIFwvjBKrHuygw3C+cwo0TprIzNMy611W5khEssZJf5s/AvlfGSUeHPnAitIlbCAq8T5
        effBBosINDFKXN0yB8xhFjjDKLFv01U2kCo2AUOJrrddYDavgJ3E/cNrGUFsFgEVieNbPoPt
        ExVIlpj2t4kZokZQ4uTMJywgNidQ/Z91e8HizALyEs1bZ0PZ4hK3nsxnAlkmIXCHQ2LGpV6g
        BAeQ4yLRsNIT4gdhiVfHt7BD2DISpyf3sEDUNzNKPDy3lh3C6WGUuNw0gxGiylrizrlfbCCD
        mAU0Jdbvgoafo8Skho8sEPP5JG68FYS4gU9i0rbpUGt5JTrahCCq1SRmHV8Ht/bghUvMExiV
        ZiH5bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAtPQ6X/HP+1g
        nPvqo94hRiYOxkOMEhzMSiK8V70iE4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzrpq9Jl5IID2x
        JDU7NbUgtQgmy8TBKdXA1OpeP68jZLr7nx3S3WqOXRevnT9ek1x2q2d9xfWyC0zOXW/vWDru
        WCbiGfG9o5UxwW2ao7f7j96l7EXP7p8XkK6cqS4zVbZJQ2lto9beqvnrugoYt1k96rXQmmAQ
        emTNgT+Bwcahn2QkptdYXNcWXPTKvjPqHNeVkhAf583TpEXK5/978kjMSnDdzwX3VYMPHW/a
        r6a3haXJ3H338pfTREOetBx3fcgqzx6nUt9a/DT80rLStll32dx+zfpx6V438+K8rxqPcp+L
        SN8x6yt55fAvdOKuvERfwbgDyfJ8bCcFTv63k7S7X9jsFHFJ4rrvXYUPktXXug4+9d21r3TX
        Lr52xYOLqiR1H0uemndCiaU4I9FQi7moOBEAXLbrnbIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7oyytGJBht6zS1e3ZrMbHHjVxur
        xfnzG9gtZpzfx2SxftpPVov2py+ZLY6vDXdg99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkA
        1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jG+9
        q9kLJlhV7FzYwdTA2KDfxcjJISFgInFr3VbmLkYuDiGBpYwSF368YIVIyEicnNYAZQtL/LnW
        xQZR9J5R4tKyWWwgCWEBV4nz8+4zgtgiAi2MEl83eYAUMQucY5TYtPEhE0THVyaJc19/gnWw
        CRhKdL3tArN5Bewk7h9eC9bNIqAicXzLZ2YQW1QgWeLt6+9MEDWCEidnPmEBsTmB6v+s2wtW
        wyxgJjFv80MoW16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbS
        K07MLS7NS9dLzs/dxAiMu23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeK96RSYK8aYkVlalFuXH
        F5XmpBYfYjQF+mcis5Rocj4w8vNK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5NLUgt
        gulj4uCUamDaeGPljs9ztXU0G/pWcLMuXBGb9O1gKoNPtffJVQpfI2K2pa9cvm1CyKw1/7gL
        223XtxwrCzHwPLJPTvKHq03im53zsi623vbb9d5o59kd35ftq9i2pXnxtDi9yOnL38pGFVb8
        r72/vm9mY4/Ql1zt40c/b5O8bXA7zYzTMCxZc9eJ7R9umz+9PPm4QdHXFW4pTWI9+tKL6s7I
        djcXHVJnPDzbec1B0WOzuG3fy30vknP2yZrnkra14L9e27sZx2ezxJbNWjuXobv5TOFH69iz
        E+bY9rVpLezePZ136sGdO9e5vb4q53V78+eHHzf7T1Q5PXti5JqJb2J4l73f7fJjm5SP0fqj
        uydGfbX+Ghnf+02JpTgj0VCLuag4EQC5CukKRAMAAA==
X-CMS-MailID: 20211004155156eucas1p1323886caa7f22158e2d69247ec397a20
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
        <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
        <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
        <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
        <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
        <04ab2789-0218-42be-888d-a54ab2826e15@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 04.10.2021 15:01, Krzysztof Kozlowski wrote:
> On 04/10/2021 12:07, Marek Szyprowski wrote:
>> On 01.10.2021 02:40, Jaehoon Chung wrote:
>>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>>> <christianshewitt@gmail.com> wrote:
>>>>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>>>>
>>>>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>>>>
>>>>> Without:
>>>>>
>>>>> [    3.227837] mmc0: tuning execution failed: -5
>>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>>>> [    3.536450] mmc0: tuning execution failed: -5
>>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>>>> [    3.794056] mmc0: tuning execution failed: -5
>>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.111097] mmc0: tuning execution failed: -5
>>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.426164] mmc0: tuning execution failed: -5
>>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.756226] mmc0: tuning execution failed: -5
>>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>>>
>>>>> With:
>>>>>
>>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>>>>> [    3.315963]  mmcblk0: p1 p2
>>>>>
>>>>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>>>>
>>>>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
>>>> The patch might have sense but would require describing conditions -
>>>> what MMC input and output clock settings work and which do not work.
>>>> Also someone would need to test other Exynos5422 boards and other
>>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>>> this should not affect SD cards.
>>> Thanks for adding me.
>>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>>>
>>> [    4.561934] mmc1: new HS400 MMC card at address 0001
>>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
>>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>>
>>> Which kernel version did you use?
>> I came across this patch some time ago, but also didn't manage to
>> reproduce the issue - in my case eMMC was always detected properly. It
>> might be related to particular version or series of the eMMC modules.
>>
>> I've just checked that patch on XU3, XU4, PeachPi and TM2e boards. All
>> are working properly with it.
>>
>> I've also tried to benchmark the impact of that change and in some case
>> it causes some performance degradation.
>>
>> The main difference is clock configuration. Before this patch (XU4):
>>
>> # dmesg | grep mmc0
>> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz,
>> actual 396825HZ div = 63)
>> mmc_host mmc0: Bus speed (slot 0) = 200000000Hz (slot req 200000000Hz,
>> actual 200000000HZ div = 0)
>> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz,
>> actual 50000000HZ div = 0)
>> mmc_host mmc0: Bus speed (slot 0) = 400000000Hz (slot req 200000000Hz,
>> actual 200000000HZ div = 1)
>> mmc0: new HS400 MMC card at address 0001
>> mmcblk0: mmc0:0001 SDW16G 14.7 GiB
>> mmcblk0boot0: mmc0:0001 SDW16G 4.00 MiB
>> mmcblk0boot1: mmc0:0001 SDW16G 4.00 MiB
>> mmcblk0rpmb: mmc0:0001 SDW16G 4.00 MiB, chardev (245:0)
>>
>> After applying the patch (mmc device number is random depending on the
>> boot):
>>
>> # dmesg | grep mmc1
>> [    3.619177] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req
>> 400000Hz, actual 396825HZ div = 63)
>> [    4.057167] mmc_host mmc1: Bus speed (slot 0) = 200000000Hz (slot req
>> 200000000Hz, actual 200000000HZ div = 0)
>> [    4.070040] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req
>> 52000000Hz, actual 50000000HZ div = 0)
>> [    4.089028] mmc_host mmc1: Bus speed (slot 0) = 266666666Hz (slot req
>> 200000000Hz, actual 133333333HZ div = 1)
>> [    4.102296] mmc1: new HS400 MMC card at address 0001
>> [    4.119072] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>> [    4.173507] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>> [    4.196210] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>> [    4.215163] mmcblk1rpmb: mmc1:0001 SDW16G 4.00 MiB, chardev (245:0)
>>
>> The performance has been measured with:
>>
>> # dd if=/dev/mmcblk1p6 of=/dev/null bs=128k
>> 31944+0 records in
>> 31944+0 records out
>> 4186963968 bytes (4.2 GB) copied, 36.6981 s, 114 MB/s
>>
>> Results (XU4 board):
>>
>> exynos_defconfig: 145 MB/s (before) vs 114 MB/s (after)
>> exynos_defconfig + all devfreqs set to performance: 146 MB/s vs 115 MB/s
>> exynos_defconfig + cpufreq & all devfreqs set to performance: 154 MB/s
>> vs 139 MB/s
>> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ disabled: 130 MB/s vs
>> 108 MB/s
>> exynos_defconfig + CONFIG_CPUFREQ_DT disabled: 69 MB/s (no impact)
>> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ & CONFIG_CPUFREQ_DT: 66
>> MB/s (no impact)
>>
>>
>> Maybe some other clock configuration (I mean the rate of the top-level
>> clocks or even PLLS) will solve the issue without degrading the
>> performance, but it is hard to judge that without reproducing the issue.
>>
> Thanks for testing and performance measurements. The read speed seems to
> be a direct effect of lower mmc bus frequency (DIVRATIO changed from 2
> to 3).
>
> What next? Except what Marek suggested, maybe compare MMC card
> capabilities and try to find a difference? For example Marek's eMMC (at
> least one with logs) is from Sandisk SDW16G. Christian's and Marian's
> (Memeka / mihailescu2m) is apparently Samsung's 8GME4R.

I have also eMMC modules with AJTD4R and 016G92 IDs. I can test them, 
but that won't happen soon due to remote work.

> Because the patch reduces performance and not all users are affected, I
> have some doubts. Maybe use by default lower clock (so as in this patch)
> but if card is in list of known good cards go higher?
>
> Another idea is to use always slower bus because it is simply safer and
> we do not have resources to test 100x of different eMMC modules...
>
> Any comments from you?

I vote for the safer clock rates. Maybe we can add some dt-property for 
the higher rates for the boards with the known to be working properly 
eMMC modules.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

