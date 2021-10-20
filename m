Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CC1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4E5860E76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhJTLQQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 07:16:16 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:56829 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhJTLQP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 07:16:15 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211020111359epoutp03a289ca8159ebba73bf8c32a96ab7d9d4~vuNrL_1Z-1995019950epoutp03-
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 11:13:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211020111359epoutp03a289ca8159ebba73bf8c32a96ab7d9d4~vuNrL_1Z-1995019950epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634728439;
        bh=Lh2hBLVOgHQopvyC4IdL0UAFqdBPvDOLpjyqlCrV/74=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=apz149mabYSng19P4WXqHHiOKG2SntZzspU+GMcysA8R7B9Y2VE6KwEZx24BnlavP
         +6RjlQ6HoNh4ROLpvqA/XEIdZ8kAryv9jAKY7JRBs8MLjyTdrvJhrgoCl4wFyrq8qL
         FErjJ/0xkJX3vqj0spTRpanz9DfYkuNU81GZfMog=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20211020111358epcas1p3081e44fae481e6b97706cf838bb0547d~vuNqalqqe1672416724epcas1p3W;
        Wed, 20 Oct 2021 11:13:58 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HZ7KG20TGz4x9Q1; Wed, 20 Oct
        2021 11:13:54 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        D2.20.09574.2F9FF616; Wed, 20 Oct 2021 20:13:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20211020111353epcas1p307866f15971e65a41aece461358f6f06~vuNlvFg_C1686116861epcas1p3M;
        Wed, 20 Oct 2021 11:13:53 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211020111353epsmtrp27d8c71f655d9a8592aa6507a3659c5bd~vuNlt93gn0416104161epsmtrp2O;
        Wed, 20 Oct 2021 11:13:53 +0000 (GMT)
X-AuditID: b6c32a35-195ff70000002566-93-616ff9f2767e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.A6.08738.1F9FF616; Wed, 20 Oct 2021 20:13:53 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211020111353epsmtip1cd72f7c802c94a8fdadd5914e1a9dcf6~vuNliImPP3040430404epsmtip11;
        Wed, 20 Oct 2021 11:13:53 +0000 (GMT)
From:   Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <59f34c3e-1ec0-a6c2-c42e-4cbf27b2540b@samsung.com>
Date:   Wed, 20 Oct 2021 20:14:36 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <862bfe2b-3cdf-dc8f-71ff-056ed7525cff@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmge6nn/mJBusahC1e3ZrMbHH+/AZ2
        ixnn9zFZrD1yl91i/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwL9IoTc4tL89L18lJLrAwNDIxMgQoT
        sjOOH2lgK2izrnh0wraB8a5hFyMnh4SAicSUj8sZuxi5OIQEdjBKPHx9gBnC+cQoMX3WZiYI
        5zOjRPf6L6wwLeeXv2KFSOxilGg/tx6q/z2jxMRl+9lBqtgEdCS2fzvOBGILC7hKnJ93nxHE
        FhEwlDi1dhoLSAOzwBImid9vljKDJHgF7CS2rXkF1sAioCrRMusNWIOoQKTE35O7WCFqBCVO
        znzCAmJzCthLfJ+1BMxmFhCXuPVkPhOELS/RvHU2M8SpvRwSSyapQNguEj1Xn0LFhSVeHd/C
        DmFLSXx+t5cNwq6W2NV8BhwAEgIdjBK3tjUxQSSMJfYvnQxkcwAt0JRYv0sfIqwosfP3XEaI
        vXwS7772sIKUSAjwSnS0CUGUqEhcev2SCWbV3Sf/oUo8JPYsVp/AqDgLyWOzkDwzC8kzsxD2
        LmBkWcUollpQnJueWmxYYAiP7OT83E2M4ASqZbqDceLbD3qHGJk4GA8xSnAwK4nw7q7ITxTi
        TUmsrEotyo8vKs1JLT7EaAoM6onMUqLJ+cAUnlcSb2hiaWBiZmRsYmFoZqgkzispmp0oJJCe
        WJKanZpakFoE08fEwSnVwJTz6PhK4ZWni59ZWPNPTsxe1M7Vq+V460Rv7+Vu2aNbc/RdLE9M
        OWWyaL1OFJtPToeg0j+pL0XaHStPfDMQYBVxMz/8ZfL9kLj6lzP+2P6b46PPZLvEMGfRo1S9
        lNNF92JMZl/9zqzIYXX5cHtfqk/kiXSgjoI828XCwe9M193SDZ+ZdfJS5qHpDyuu6jgWV+ge
        mmpqtFL9a+QeodtGjI/rfFMem508Wy/eLy5zOeDaonnPe+587z1bnmmc+T1i6d7Hd3aWn76Y
        v8H1KN9vJY+uWbvmB7Rt++V+xv8Ly4SZNUk3nx6a/ulbTtC3LpbtXvJRseLzZ4WJ6n753hZ0
        bu+MzpU8rodXrrN9zj5BQ4mlOCPRUIu5qDgRABM8jN0pBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnO7Hn/mJBov/aFq8ujWZ2eL8+Q3s
        FjPO72OyWHvkLrvF+mk/WS3an75ktji+NtyB3WPnrLvsHptWdbJ53Lm2h82jb8sqRo/Pm+QC
        WKO4bFJSczLLUov07RK4Mo4faWAraLOueHTCtoHxrmEXIyeHhICJxPnlr1i7GLk4hAR2MEpM
        eHuAHSIhJfH56VS2LkYOIFtY4vDhYoiat4wS747MYgOpYRPQkdj+7TgTiC0s4Cpxft59RhBb
        RMBQ4tTaaSwgDcwCy5gkbm6/yQ7RfYdZYvauw2DdvAJ2EtvWvALrZhFQlWiZ9QasW1QgUqLp
        xFaoGkGJkzOfsIDYnAL2Et9nLQGzmQXUJf7Mu8QMYYtL3HoynwnClpdo3jqbeQKj0Cwk7bOQ
        tMxC0jILScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBUaOltYNxz6oPeocY
        mTgYDzFKcDArifDurshPFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFq
        EUyWiYNTqoFpEUOwx7KHtwsfzNKf92kC89RV5mXMx5RYnv4z4JoeZTb/wSzLnI6Fd3f9M3S8
        GhTfs93BYEHfpX1P569i2DN9dYDOmZ26wpU321xsni/InfRJeJGY9LfcCb9fHLxz/lH2ynd1
        yalbPz38+tVt359d3gL3wtfuW/7G0zVRc1pO5ZLPs3v403VaOTISpYSLgy192q7/9cn9bR5T
        vDjnkIFSH7PMnykzorR+xUj7zGg5G5V3P4DlCeflVrG8Xe53b3ofzQ5s3X5AUFP+9r/c1zez
        f0+Xuu/sKHa+o3erSi+/9fL7Fy5nNLso+/HHLJee9vZiNXva5gP7ojSnMeVyzXp1bZPPjd97
        S9YtWn9VruJXuxJLcUaioRZzUXEiAGcNEqAJAwAA
X-CMS-MailID: 20211020111353epcas1p307866f15971e65a41aece461358f6f06
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
        <974A393B-EE0A-487F-8315-D4E0498DAA25@gmail.com>
        <103943b6-3567-a241-7308-890d218eeb0f@samsung.com>
        <922F76F9-2F1C-405D-A205-AE6C7B41DFF6@gmail.com>
        <862bfe2b-3cdf-dc8f-71ff-056ed7525cff@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chritian,

On 10/7/21 8:05 PM, Jaehoon Chung wrote:
> On 10/7/21 1:36 PM, Christian Hewitt wrote:
>>>
>>> On 7 Oct 2021, at 2:16 am, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>>>
>>> Hi,
>>>
>>> On 10/1/21 10:41 PM, Christian Hewitt wrote:
>>>>
>>>>> On 1 Oct 2021, at 4:40 am, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>>>>>
>>>>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>>>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>>>>> <christianshewitt@gmail.com> wrote:
>>>>>>>
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
>>>>>>
>>>>>> The patch might have sense but would require describing conditions -
>>>>>> what MMC input and output clock settings work and which do not work.
>>>>>> Also someone would need to test other Exynos5422 boards and other
>>>>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>>>>> this should not affect SD cards.
>>>>>
>>>>>
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
>>>>
>>>> The original report is against 5.14.0, but I see the same with 5.15-rc3
>>>>
>>>> dmesg: https://protect2.fireeye.com/v1/url?k=703ee5f5-2fa5dcb3-703f6eba-0cc47a3003e8-ad25e9061be78bbb&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuL
>>>> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=5d2277f1-02b94eb7-5d23fcbe-0cc47a3003e8-b778cb8e233bbe4b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuO
>>>>
>>>> And if I pick that patch to my kernel branch all is good:
>>>>
>>>> dmesg: https://protect2.fireeye.com/v1/url?k=8bcf7900-d4544046-8bcef24f-0cc47a3003e8-6124ad41dd642d56&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Avf
>>>> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=66ce5f96-395566d0-66cfd4d9-0cc47a3003e8-b9768331cc0e4416&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Ave
>>>>
>>>> Here’s an SD (or eMMC) bootable image for an XU4 that exhibits the problem. You need to run “systemctl stop kodi” once the UART console is available else it attempts to run Kodi and Panfrost (the image is created for some Panfrost poking) currently wedges the board. Once the Kodi service is stopped “systemctl mask kodi” will prevent it from running again.
>>>>
>>>> https://protect2.fireeye.com/v1/url?k=b114ca54-ee8ff369-b115411b-0cc47a31309a-d8858f2897ed5521&q=1&e=addfcceb-9c68-4d7e-828c-344dd51262c2&u=https%3A%2F%2Fchewitt.libreelec.tv%2Ftesting%2FLibreELEC-Exynos.arm-10.0.0-odroid-xu4.img.gz
>>>>
>>>> Kernel defconfig for the image: https://protect2.fireeye.com/v1/url?k=806156b6-dffa6ff0-8060ddf9-0cc47a3003e8-b2bec8fd0863dc1b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fsprunge.us%2FG6uxty - basically the exynos config but with a wide variety of not-needed drivers (other SoCs, network cards, etc.) disabled.
>>>>
>>>> The board is booting from u-boot 2020.04 in case that matters.
>>>
>>> Thanks for sharing information. Sorry for replying late. I will check this problem on this week. 
>>> It needs to satisfy all exynos5 SoCs. I just wonder why not working fine according to eMMC modules.
>>
>> No problem, I’ve been watching the thread :)
>>
>> This is the module I’m using https://protect2.fireeye.com/v1/url?k=991de2ef-c686dbd2-991c69a0-0cc47a31309a-1b07f48d5f69f8e8&q=1&e=addfcceb-9c68-4d7e-828c-344dd51262c2&u=https%3A%2F%2Fwww.hardkernel.com%2Fshop%2F8gb-emmc-module-h2%2F .. I can probably organise one to be shipped to you if needed.

I had been ordered above module, but it's different with yours.

This is mine. 

[    3.615140] mmcblk0: mmc0:0001 8GTF4R 7.28 GiB

Anyway, I found other eMMC module that can be reproduced this issue.
This issue is that host can't determine correct clock sampling value about some eMMC module.
exynos_get_bset_clksmp() function had been considered HS200 and HS104 at first time. 

commit c537a1c5ff63d3553617a9ff80ef5ed1493028e2
Author: Seungwon Jeon <tgih.jun@samsung.com>
Date:   Sat Aug 31 00:12:50 2013 +0900

    mmc: dw_mmc: exynos: add variable delay tuning sequence

    Implements variable delay tuning. In this change, exynos host can
    determine the correct sampling point for the HS200 and SDR104 speed mode.

So it seems that host needs to consider about HS400 mode.

I will post the fixing patch as soon as possible. At that time, I will cc'd you.

Best Regards,
Jaehoon Chung

> 
> Thanks for sharing eMMC module information. I will order it. 
> 
> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
> 
> And When I have been checked the code, it seems that changing CLK_DIV value to 2 is not correct. (It's workaround to just work.)
> Maybe, it seems that phase is not a proper value about its eMMC. (After getting eMMC module, I can check in more detail.)
> 
> Best Regards,
> Jaehoon Chung
> 
>>
>> Christian
>>
> 
> 

