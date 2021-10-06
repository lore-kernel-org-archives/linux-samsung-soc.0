Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542FEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E19861131
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 22:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239552AbhJFWR4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:17:56 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:63245 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhJFWRz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 18:17:55 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211006221600epoutp0166463ae6a64653f548914946c3519e34~rkNsyIFh_0393203932epoutp01r
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 22:16:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211006221600epoutp0166463ae6a64653f548914946c3519e34~rkNsyIFh_0393203932epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633558561;
        bh=EmEmt5mv7ESf/qT8vpLqwcPO4xU07RsbvFqK95OuTVw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=sNe59aWleXBkaEL8+IGVn9ik9VbNi4SA8KwxLY1ca0e1FnDpNearY4yYWao2ilODW
         MXrUeJT1gXRG5jbFY9SNTTZ003lO+p4xuygXjs8e8A0tYPwbnm3ueRsgBAuZDK313K
         khqFNJOMvf3ojAU3Fahab9i4PR+t4HPHxWlK6xpk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20211006221600epcas1p3e8d79203bc7ec91f6408b9986caab4da~rkNsAN_ol0758407584epcas1p3W;
        Wed,  6 Oct 2021 22:16:00 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.235]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HPpgb26vjz4x9Q3; Wed,  6 Oct
        2021 22:15:55 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        39.AF.24398.8102E516; Thu,  7 Oct 2021 07:15:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211006221554epcas1p208d68ddf9ae1a8519d6b11c9e38404c7~rkNm_ju-20448704487epcas1p2m;
        Wed,  6 Oct 2021 22:15:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211006221554epsmtrp14955c8f1ed742e43eafa4d85ca2e7a45~rkNm9ghJp0533805338epsmtrp1C;
        Wed,  6 Oct 2021 22:15:54 +0000 (GMT)
X-AuditID: b6c32a35-0edff70000005f4e-44-615e2018ade4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        06.04.09091.7102E516; Thu,  7 Oct 2021 07:15:51 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211006221554epsmtip1d78ae17b2fe6ccd77c665d22cdb37824~rkNmlVAWG2935829358epsmtip1W;
        Wed,  6 Oct 2021 22:15:54 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <103943b6-3567-a241-7308-890d218eeb0f@samsung.com>
Date:   Thu, 7 Oct 2021 07:16:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <974A393B-EE0A-487F-8315-D4E0498DAA25@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmvq6EQlyiQe9bZotXtyYzW5w/v4Hd
        Ysb5fUwWa4/cZbdYP+0nq0X705fMFsfXhjuwe+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        a1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QFUoK
        ZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAtMCveLE3OLSvHS9vNQSK0MDAyNToMKE
        7Iz1s5+zFvxSr3hzcTZzA+NSxS5GTg4JAROJqwenMHYxcnEICexglFj87jIbhPOJUeL429ss
        EM43RolnW18yw7QsnXEYqmovo8St+7OYQBJCAu8ZJR480QWxhQVcJc7Pu88IYosIGEqcWjsN
        bBKzwBImid9vloJNYhPQkdj+7ThYM6+AncT6ycuBGjg4WARUJN5OtAEJiwpESvw9uYsVokRQ
        4uTMJywgNqeArUTf9Glg85kFxCVuPZnPBGHLSzRvnc0MsktCoJdDYuuBa2wQV7tI/LqxmRHC
        FpZ4dXwLO4QtJfGyvw3KrpbY1XwGqrkD6LNtTUwQCWOJ/UsnM4EcxyygKbF+lz5EWFFi5++5
        UEfwSbz72sMKUiIhwCvR0SYEUaIicen1SyaYVXef/Icq8ZDYs1h9AqPiLCSfzULyzSwk38xC
        2LuAkWUVo1hqQXFuemqxYYEhPLKT83M3MYITqJbpDsaJbz/oHWJk4mA8xCjBwawkwptvH5so
        xJuSWFmVWpQfX1Sak1p8iNEUGNQTmaVEk/OBKTyvJN7QxNLAxMzI2MTC0MxQSZz32GvLRCGB
        9MSS1OzU1ILUIpg+Jg5OqQYm68V3VnXX17wp+bXlrbrdqUdpu3g9Q/r3VluW1laWxR8X1gk+
        ffOhbbzb7fTrfyLYU48nCL9a0Rq4sVm1ebfyjsbXjVOULxybcXjryp5WmSvC//+2FCurtn3N
        +PT/fkeM66ckpl8WCwqzcw3agtRnFWtm8+mv5/qcfJ+DwfdJlP72396u+8v3+T2V7DSsSjiS
        pRxafO9d83SpZbd+bQtXMbH3+pb5PlddfeZFd5UN2x2PxJt+3R6iZbzpyJx157bt6Qvb1a6T
        4bOE/bRnmo/4202ajluULj3y65CIqp2fJtVfIpdeJvNqu/VhO84zBq93naz2DL3JrL/d13Zu
        Z6srz3zLVrdjXd93WL83ZVNiKc5INNRiLipOBADux45XKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSnK64QlyiwYVZ/Bavbk1mtjh/fgO7
        xYzz+5gs1h65y26xftpPVov2py+ZLY6vDXdg99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkA
        1igum5TUnMyy1CJ9uwSujPWzn7MW/FKveHNxNnMD41LFLkZODgkBE4mlMw6zdTFycQgJ7GaU
        WLFmGhNEQkri89OpQAkOIFtY4vDhYoiat4wSP/fvYgGpERZwlTg/7z4jiC0iYChxau00FpAi
        ZoFlTBI3t99kB0kICexnkmi5ygZiswnoSGz/dhxsAa+AncT6ycsZQRawCKhIvJ1oAxIWFYiU
        aDqxlQ2iRFDi5MwnYLs4BWwl+qZPA9vFLKAu8WfeJWYIW1zi1pP5TBC2vETz1tnMExiFZiFp
        n4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiOGS3NHYzbV33Q
        O8TIxMF4iFGCg1lJhDffPjZRiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2amp
        BalFMFkmDk6pBibm9YcNZDqZTCU7c0T0AvYvUcmYn82U8671bgunrYHryX+uJv/nSolZTNUU
        9Hgpl7XlXLfeS4mlm+JOLv7o9niTsXWmf/LWa/N4OwqZlyuedEi9qVsnNGv/FH5zozfHnHTq
        lxu4St4L0DnYzPys9Q6v+my5vvcprOtYE/oM/pYzH/12fJ7bAbNvu70nSmdo/Nv57NBZ/4wM
        j92FOTU39kZ7HH2ZZGe//yrHvMX3HhhzRvoUHJB5PCvTrFfvbVX+6xbxTx2xJxsedZVccXK2
        O5Nm07tzZtWejNzjJx5XbfAO/KbAu0NsfeFvER6THL6+jqe8S73k0rv+tie5vbh5lZeNYUXn
        rxVR9ec3RLq7KLEUZyQaajEXFScCAFC07jkIAwAA
X-CMS-MailID: 20211006221554epcas1p208d68ddf9ae1a8519d6b11c9e38404c7
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 10/1/21 10:41 PM, Christian Hewitt wrote:
> 
>> On 1 Oct 2021, at 4:40 am, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>>
>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>> <christianshewitt@gmail.com> wrote:
>>>>
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
>>>
>>> The patch might have sense but would require describing conditions -
>>> what MMC input and output clock settings work and which do not work.
>>> Also someone would need to test other Exynos5422 boards and other
>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>> this should not affect SD cards.
>>
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
> The original report is against 5.14.0, but I see the same with 5.15-rc3
> 
> dmesg: https://protect2.fireeye.com/v1/url?k=703ee5f5-2fa5dcb3-703f6eba-0cc47a3003e8-ad25e9061be78bbb&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuL
> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=5d2277f1-02b94eb7-5d23fcbe-0cc47a3003e8-b778cb8e233bbe4b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuO
> 
> And if I pick that patch to my kernel branch all is good:
> 
> dmesg: https://protect2.fireeye.com/v1/url?k=8bcf7900-d4544046-8bcef24f-0cc47a3003e8-6124ad41dd642d56&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Avf
> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=66ce5f96-395566d0-66cfd4d9-0cc47a3003e8-b9768331cc0e4416&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Ave
> 
> Here’s an SD (or eMMC) bootable image for an XU4 that exhibits the problem. You need to run “systemctl stop kodi” once the UART console is available else it attempts to run Kodi and Panfrost (the image is created for some Panfrost poking) currently wedges the board. Once the Kodi service is stopped “systemctl mask kodi” will prevent it from running again.
> 
> https://chewitt.libreelec.tv/testing/LibreELEC-Exynos.arm-10.0.0-odroid-xu4.img.gz
> 
> Kernel defconfig for the image: https://protect2.fireeye.com/v1/url?k=806156b6-dffa6ff0-8060ddf9-0cc47a3003e8-b2bec8fd0863dc1b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fsprunge.us%2FG6uxty - basically the exynos config but with a wide variety of not-needed drivers (other SoCs, network cards, etc.) disabled.
> 
> The board is booting from u-boot 2020.04 in case that matters.

Thanks for sharing information. Sorry for replying late. I will check this problem on this week. 
It needs to satisfy all exynos5 SoCs. I just wonder why not working fine according to eMMC modules.

Best Regards,
Jaehoon Chung


> 
> Christian
> 
> 

