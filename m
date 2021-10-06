Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A5DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3012B611C1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhJFWCt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:02:49 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:53855 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhJFWCs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 18:02:48 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211006220054epoutp01898f7501ea4ad72b729fb8ee3c489442~rkAgyZTLj2967829678epoutp01w
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 22:00:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211006220054epoutp01898f7501ea4ad72b729fb8ee3c489442~rkAgyZTLj2967829678epoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633557654;
        bh=J6N3jKUnBzuGs8cvg6sSMdnE3jWgNsEja+sEMStLA70=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=oiT6n/dKxoZFrOrTz0YDzAI9e1yY4TU5qsRjY01zmz6mqoKeAZvc3pPn2cGxVwEwO
         am/TH9hNY/ouuwS/9Wid+Q+uKp0lPu8CZfR2qwz4M65vCZ5euEociQdtTR92wgrI3r
         95e9NalTEzRJ/gl/CRT2xFkQDo7GagwsDBQSguTQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211006220054epcas1p2f1ce86b16d04c9ef9411c7e14319bc8a~rkAgehLEs1284712847epcas1p2B;
        Wed,  6 Oct 2021 22:00:54 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.237]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HPpLB2pCwz4x9Q1; Wed,  6 Oct
        2021 22:00:50 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        78.3F.13696.E8C1E516; Thu,  7 Oct 2021 07:00:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20211006220049epcas1p329dfe07456b97711c64a13628904f435~rkAcH3nxz0409604096epcas1p3A;
        Wed,  6 Oct 2021 22:00:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211006220049epsmtrp265ccbb6c07802e78dd53746ea06119a2~rkAcHHgXL0352303523epsmtrp2q;
        Wed,  6 Oct 2021 22:00:49 +0000 (GMT)
X-AuditID: b6c32a37-281ff70000023580-ea-615e1c8e12ca
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.D8.08750.E8C1E516; Thu,  7 Oct 2021 07:00:46 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211006220049epsmtip2e8b9e2494f45ae7025f1f80adaade78c~rkAb4P5i11157411574epsmtip2D;
        Wed,  6 Oct 2021 22:00:49 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <1a4870b9-b57a-461b-83a1-2410bd84bbd7@samsung.com>
Date:   Thu, 7 Oct 2021 07:01:29 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmnm6fTFyiwcL9Yhavbk1mtjh/fgO7
        xYzz+5gs1h65y26xftpPVov2py+ZLY6vDXdg99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkA
        1qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygK5QU
        yhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BaYFesWJucWleel6eaklVoYGBkamQIUJ
        2Rlblq9nLThrXLHj2kGmBsZNml2MnBwSAiYSXz+vYeli5OIQEtjBKPH5wxk2COcTo8Sx3c1Q
        mc+MElv+7GaBaen5dZIdxBYS2MUo8finO0TRe0aJlusPGEESwgKuEufn3WcESYgItDNKbFu/
        lR3EYRY4wyixb9NVNpAqNgEdie3fjjOB2LwCdhKzHu0CW8EioCJxp/c+K4gtKhAp8ffkLlaI
        GkGJkzOfgNVwCthLLL07ByzOLCAucevJfCYIW16ieetsZpBlEgJTOST2XtjFBnG3i8Tqxo2M
        ELawxKvjW9ghbCmJz+/2QtVUS+xqPgPV3MEocWtbExNEwlhi/9LJQDYH0AZNifW79CHCihI7
        f89lhFjMJ/Huaw8rSImEAK9ER5sQRImKxKXXL5lgVt198h+qxENiz2L1CYyKs5B8NgvJN7OQ
        fDMLYe8CRpZVjGKpBcW56anFhgXG8OhOzs/dxAhOolrmOxinvf2gd4iRiYPxEKMEB7OSCG++
        fWyiEG9KYmVValF+fFFpTmrxIUZTYFhPZJYSTc4HpvG8knhDE0sDEzMjYxMLQzNDJXHeY68t
        E4UE0hNLUrNTUwtSi2D6mDg4pRqY5mxSnDahnbmt/kfLVnvH7GD9jRtU72f2PFx7fa/LSbvH
        56UsL391vMQZ61bcV6J12mKJv8z9DW+lVS0mvr+T3HFKZ7Nu9BnPdgv/Cb/sDfc12tafTr8x
        TcojP+qt96X4PnHvytnTBW4enHai45/Vm+407/+J79vWv95Z6ff2iM1e3ddFL8Qvv9bWSLU9
        +aBrppvdxrePMpxi3C+39S8/88nufe1pkxUf6lLd1pY+usySLmnbtVZcrKNR6+36rGdcf1tf
        bNtr5JS0bOq1b0veiztpN4v1H2LeGZtWsONUSITY3EeSUo1smyYfeP7iy4+Uq3+T85NiLh5p
        uzUjOKJki6PwRHPWn1dPl9lMLVs4VYmlOCPRUIu5qDgRAK4mkNArBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG6fTFyiwdaFkhavbk1mtjh/fgO7
        xYzz+5gs1h65y26xftpPVov2py+ZLY6vDXdg99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkA
        1igum5TUnMyy1CJ9uwSujC3L17MWnDWu2HHtIFMD4ybNLkZODgkBE4meXyfZuxi5OIQEdjBK
        nDyxkhUiISXx+elUti5GDiBbWOLw4WKImreMEvd+TGcHqREWcJU4P+8+I0hCRKCTUaLz3DpW
        EIdZ4ByjxKaND5kgWg4ySbzsnssM0sImoCOx/dtxJhCbV8BOYtajXSwgNouAisSd3vtgq0UF
        IiWaTmxlg6gRlDg58wlYDaeAvcTSu3PAapgF1CX+zLvEDGGLS9x6Mp8JwpaXaN46m3kCo9As
        JO2zkLTMQtIyC0nLAkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwZGjpbWDcc+q
        D3qHGJk4GA8xSnAwK4nw5tvHJgrxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7
        NbUgtQgmy8TBKdXAtFji2G9lS9dVew+9KZlsq812wypp8vMwlkX+CnvKqtdOODA93V6qNDPV
        tlt718WCvfdPq37OWRDz5fXeaY//Tysszv2teb9SsPS1XMvhTY3nDWbLi0naHw0VPf7o/Zsj
        VyxvL9sRsSjs/6N/PNde9nqcvuI8tZM3i1nywWHfPcserlt4Uv9u+QJZnU/r7pprTUnWM6s6
        3Xxv9R+msFvaKx+t/d7yfr7muvmn/zNumKnaP0mM75NXwg2ptsI/DeqHUvqPnmT6OH+nomP3
        2h/f/m3r/9Pw6PKSHYsaDY4t2r9g/T+uNS3GtyydIn8+mXHw3b8JdvWbp2utMXGet9/WjqnN
        XG72r9DAzNuNs7Iy1uwOUGIpzkg01GIuKk4EAK9gKicLAwAA
X-CMS-MailID: 20211006220049epcas1p329dfe07456b97711c64a13628904f435
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 10/4/21 7:07 PM, Marek Szyprowski wrote:
> Hi Jaehoon,
> 
> On 01.10.2021 02:40, Jaehoon Chung wrote:
>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>> <christianshewitt@gmail.com> wrote:
>>>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>>>
>>>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>>>
>>>> Without:
>>>>
>>>> [    3.227837] mmc0: tuning execution failed: -5
>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>>> [    3.536450] mmc0: tuning execution failed: -5
>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>>> [    3.794056] mmc0: tuning execution failed: -5
>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>>> [    4.111097] mmc0: tuning execution failed: -5
>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>>> [    4.426164] mmc0: tuning execution failed: -5
>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>>> [    4.756226] mmc0: tuning execution failed: -5
>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>>
>>>> With:
>>>>
>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>>>> [    3.315963]  mmcblk0: p1 p2
>>>>
>>>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>>>
>>>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
>>> The patch might have sense but would require describing conditions -
>>> what MMC input and output clock settings work and which do not work.
>>> Also someone would need to test other Exynos5422 boards and other
>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>> this should not affect SD cards.
>>
>> Thanks for adding me.
>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>>
>> [    4.561934] mmc1: new HS400 MMC card at address 0001
>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>
>> Which kernel version did you use?
> 
> I came across this patch some time ago, but also didn't manage to 
> reproduce the issue - in my case eMMC was always detected properly. It 
> might be related to particular version or series of the eMMC modules.
> 
> I've just checked that patch on XU3, XU4, PeachPi and TM2e boards. All 
> are working properly with it.
> 
> I've also tried to benchmark the impact of that change and in some case 
> it causes some performance degradation.

Thanks for checking them. I had also suspected that this problem is producing according to eMMC modules.
(Chritian's eMMC is different with mine.)

> 
> The main difference is clock configuration. Before this patch (XU4):
> 
> # dmesg | grep mmc0
> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, 
> actual 396825HZ div = 63)
> mmc_host mmc0: Bus speed (slot 0) = 200000000Hz (slot req 200000000Hz, 
> actual 200000000HZ div = 0)
> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, 
> actual 50000000HZ div = 0)
> mmc_host mmc0: Bus speed (slot 0) = 400000000Hz (slot req 200000000Hz, 
> actual 200000000HZ div = 1)
> mmc0: new HS400 MMC card at address 0001
> mmcblk0: mmc0:0001 SDW16G 14.7 GiB
> mmcblk0boot0: mmc0:0001 SDW16G 4.00 MiB
> mmcblk0boot1: mmc0:0001 SDW16G 4.00 MiB
> mmcblk0rpmb: mmc0:0001 SDW16G 4.00 MiB, chardev (245:0)
> 
> After applying the patch (mmc device number is random depending on the 
> boot):
> 
> # dmesg | grep mmc1
> [    3.619177] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 
> 400000Hz, actual 396825HZ div = 63)
> [    4.057167] mmc_host mmc1: Bus speed (slot 0) = 200000000Hz (slot req 
> 200000000Hz, actual 200000000HZ div = 0)
> [    4.070040] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 
> 52000000Hz, actual 50000000HZ div = 0)
> [    4.089028] mmc_host mmc1: Bus speed (slot 0) = 266666666Hz (slot req 
> 200000000Hz, actual 133333333HZ div = 1)
> [    4.102296] mmc1: new HS400 MMC card at address 0001
> [    4.119072] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
> [    4.173507] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
> [    4.196210] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
> [    4.215163] mmcblk1rpmb: mmc1:0001 SDW16G 4.00 MiB, chardev (245:0)
> 
> The performance has been measured with:
> 
> # dd if=/dev/mmcblk1p6 of=/dev/null bs=128k
> 31944+0 records in
> 31944+0 records out
> 4186963968 bytes (4.2 GB) copied, 36.6981 s, 114 MB/s
> 
> Results (XU4 board):
> 
> exynos_defconfig: 145 MB/s (before) vs 114 MB/s (after)
> exynos_defconfig + all devfreqs set to performance: 146 MB/s vs 115 MB/s
> exynos_defconfig + cpufreq & all devfreqs set to performance: 154 MB/s 
> vs 139 MB/s
> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ disabled: 130 MB/s vs 
> 108 MB/s
> exynos_defconfig + CONFIG_CPUFREQ_DT disabled: 69 MB/s (no impact)
> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ & CONFIG_CPUFREQ_DT: 66 
> MB/s (no impact)
> 
> 
> Maybe some other clock configuration (I mean the rate of the top-level 
> clocks or even PLLS) will solve the issue without degrading the 
> performance, but it is hard to judge that without reproducing the issue.

I'm checking this problem in more detail since today. I don't have all eMMC modules to connect on XU3/4.
So as you mentioned, it's difficult to check without reproducing the issue.
I'm trying to find eMMC module to reproduce this issue in my office.

Best Regards,
Jaehoon Chung

> 
> 
> Best regards
> 

