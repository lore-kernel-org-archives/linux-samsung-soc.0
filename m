Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06049C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 11:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB35761130
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 11:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240787AbhJGLGw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 07:06:52 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:45965 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240793AbhJGLGt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 07:06:49 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211007110453epoutp02dc30112ab67f89a21362fa78bcf48a10~rutBdPlE50031100311epoutp02H
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 11:04:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211007110453epoutp02dc30112ab67f89a21362fa78bcf48a10~rutBdPlE50031100311epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633604693;
        bh=HH/5aBi3V2TvyQZd9xKLhZfb2VBcD+Fh36xb9fhfJOk=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=MCZhVuQ/c0QxOoWOGczaiF+NE/Q4YWx8hPMvz3cnMTduZoaKqntTGVk/U5EL7mrBj
         LB4BDxWsSFvb8AU955CvFGe4OrfSwJCEgg/7Zq9ITvh+1Q9+Ze9/4S432pX+jDBE+2
         CJ+QuarEu8VqV8zLmap4mbzx02gbRDv0LW+72pFM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211007110453epcas1p27ca2842f6db68073d302787ed7ec6683~rutA0FZwo2514225142epcas1p2a;
        Thu,  7 Oct 2021 11:04:53 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.237]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HQ7kj6YSSz4x9Q3; Thu,  7 Oct
        2021 11:04:45 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        07.6B.62504.D44DE516; Thu,  7 Oct 2021 20:04:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20211007110444epcas1p4675f1ebd5f1b836effe413091e891667~rus4bBkFm1812218122epcas1p4B;
        Thu,  7 Oct 2021 11:04:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211007110444epsmtrp21636d63267941e4bdc77ba819621a2f9~rus4UKrig0519805198epsmtrp2y;
        Thu,  7 Oct 2021 11:04:44 +0000 (GMT)
X-AuditID: b6c32a38-785ff7000002f428-09-615ed44ddcbf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        45.35.09091.B44DE516; Thu,  7 Oct 2021 20:04:43 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211007110443epsmtip1e6a377df70a4042b37853ee142171a90~rus4E6JtH0037800378epsmtip1N;
        Thu,  7 Oct 2021 11:04:43 +0000 (GMT)
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
Message-ID: <862bfe2b-3cdf-dc8f-71ff-056ed7525cff@samsung.com>
Date:   Thu, 7 Oct 2021 20:05:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <922F76F9-2F1C-405D-A205-AE6C7B41DFF6@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmrq7vlbhEgwOHLS1e3ZrMbHH+/AZ2
        ixnn9zFZrD1yl91i/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwL9IoTc4tL89L18lJLrAwNDIxMgQoT
        sjMu9Z5kLdhjVPHu7DmWBsa3Wl2MnBwSAiYSWyadZQSxhQR2MEqc+qTWxcgFZH9ilNi9vIER
        wvnGKHG6pZcZpuPHn8/MEIm9jBIvPz5nhmh/zygx6ZgXiM0moCOx/dtxJhBbWMBV4vy8+2Ar
        RAQMJU6tncYC0swssIRJ4vebpWDNvAJ2Ertu/QBq4OBgEVCR2HPCEyQsKhAp8ffkLlaIEkGJ
        kzOfsIDYnAK2Evv+TWADsZkFxCVuPZnPBGHLSzRvnQ116EQOid+XZCBsF4nu/RdZIGxhiVfH
        t7BD2FISn9/tZYOwqyV2NZ8Be0xCoINR4ta2JiaIhLHE/qWTwW5jFtCUWL9LHyKsKLHz91xG
        iL18Eu++9rCClEgI8Ep0tAlBlKhIXHr9kglm1d0n/6FKPCT2LFafwKg4C8ljs5A8MwvJM7MQ
        9i5gZFnFKJZaUJybnlpsWGACj+rk/NxNjODkqWWxg3Hu2w96hxiZOBgPMUpwMCuJ8ObbxyYK
        8aYkVlalFuXHF5XmpBYfYjQFhvREZinR5Hxg+s4riTc0sTQwMTMyNrEwNDNUEuc99toyUUgg
        PbEkNTs1tSC1CKaPiYNTqoGpdtnjCdrya/6bBa+Y0ds/xawp61Mk2/b37ze1GB9mrNi+Pely
        Td+Rr6s/bzuq/M23sSH4BvOpxfXpa09ucenY78tjdnmKkoHIhE0HdOcv9Hu4WeueRo6D//IZ
        i84+D61R0qgokjSPb/wq/OPAl6D/shy8jznNWJbeEhK27WBedFpWbN6Gf4eEduZt3tl97/rs
        LkOBL95ZF6XdN/zasqm3iHv5Tf1UeQ+5765Ge/vZGhpufcjluxAeczCW50rgedZ9huFHeA/2
        LnOtbjlqZDVvWbvrrYlTVNZ2WZxwUUvsyjjAYJtYphjJnHI7ZpbVzvh7K1cqn2A80u7FkJ7o
        tsJFMlL95NWkXUo/xTS+ySQqsRRnJBpqMRcVJwIA0+fwGicEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnK73lbhEgz/zTS1e3ZrMbHH+/AZ2
        ixnn9zFZrD1yl91i/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFFcNimpOZllqUX6dglcGZd6T7IW7DGqeHf2HEsD41utLkZODgkBE4kffz4zdzFycQgJ7GaU
        +LxsETNEQkri89OpbF2MHEC2sMThw8UQNW8ZJa5NWcgGUsMmoCOx/dtxJhBbWMBV4vy8+4wg
        toiAocSptdNYQBqYBZYxSdzcfpMdons5s0THp3awKl4BO4ldt34wgWxgEVCR2HPCEyQsKhAp
        0XRiKxtEiaDEyZlPWEBsTgFbiX3/JoDFmQXUJf7Mu8QMYYtL3HoynwnClpdo3jqbeQKj0Cwk
        7bOQtMxC0jILScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBUaOluYNx+6oP
        eocYmTgYDzFKcDArifDm28cmCvGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1
        tSC1CCbLxMEp1cAkJLTff+Fh54b+D4nan7YpZorcvF6r/VnwhvCPpc7LLj3hYX2y1e/+G0UX
        4ysKfPp1WhwHF4sElBaa+NbLF8zVYud5nxWy2jWr8WHhvVyhnh9i5y9Mn3trd2St470WWYdo
        ux1SuR8Y5AT+LP93s0Gh/ts51+mR1mIO2/OUgu9WHOPWuLOib8IOfdlpPfy3p6zysPd8uHjX
        iUlz9yw6+5Qnx3/jhLqzFxuCFqnt/9udf4PD9sOqG2Uye1OvKjUKby2wjTTZbr9Yj2+y2JMq
        O0OdbTv9/O2vdx1etPvEz3X9spNZovRXZK8/ba707s7Bwurl65duF/JacJ+9RH3e9buP113U
        TYzn0Ez/UHT2T8dhJZbijERDLeai4kQAKABKzQkDAAA=
X-CMS-MailID: 20211007110444epcas1p4675f1ebd5f1b836effe413091e891667
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/7/21 1:36 PM, Christian Hewitt wrote:
>>
>> On 7 Oct 2021, at 2:16 am, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>>
>> Hi,
>>
>> On 10/1/21 10:41 PM, Christian Hewitt wrote:
>>>
>>>> On 1 Oct 2021, at 4:40 am, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>>>>
>>>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>>>> <christianshewitt@gmail.com> wrote:
>>>>>>
>>>>>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>>>>>
>>>>>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>>>>>
>>>>>> Without:
>>>>>>
>>>>>> [    3.227837] mmc0: tuning execution failed: -5
>>>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>>>>> [    3.536450] mmc0: tuning execution failed: -5
>>>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>>>>> [    3.794056] mmc0: tuning execution failed: -5
>>>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>>>>> [    4.111097] mmc0: tuning execution failed: -5
>>>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>>>>> [    4.426164] mmc0: tuning execution failed: -5
>>>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>>>>> [    4.756226] mmc0: tuning execution failed: -5
>>>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>>>>
>>>>>> With:
>>>>>>
>>>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>>>>>> [    3.315963]  mmcblk0: p1 p2
>>>>>>
>>>>>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>>>>>
>>>>>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
>>>>>
>>>>> The patch might have sense but would require describing conditions -
>>>>> what MMC input and output clock settings work and which do not work.
>>>>> Also someone would need to test other Exynos5422 boards and other
>>>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>>>> this should not affect SD cards.
>>>>
>>>>
>>>> Thanks for adding me.
>>>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>>>>
>>>> [    4.561934] mmc1: new HS400 MMC card at address 0001
>>>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>>>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
>>>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>>>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>>>
>>>> Which kernel version did you use?
>>>
>>> The original report is against 5.14.0, but I see the same with 5.15-rc3
>>>
>>> dmesg: https://protect2.fireeye.com/v1/url?k=703ee5f5-2fa5dcb3-703f6eba-0cc47a3003e8-ad25e9061be78bbb&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuL
>>> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=5d2277f1-02b94eb7-5d23fcbe-0cc47a3003e8-b778cb8e233bbe4b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3AuO
>>>
>>> And if I pick that patch to my kernel branch all is good:
>>>
>>> dmesg: https://protect2.fireeye.com/v1/url?k=8bcf7900-d4544046-8bcef24f-0cc47a3003e8-6124ad41dd642d56&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Avf
>>> dmesg | grep mmc: https://protect2.fireeye.com/v1/url?k=66ce5f96-395566d0-66cfd4d9-0cc47a3003e8-b9768331cc0e4416&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fix.io%2F3Ave
>>>
>>> Here’s an SD (or eMMC) bootable image for an XU4 that exhibits the problem. You need to run “systemctl stop kodi” once the UART console is available else it attempts to run Kodi and Panfrost (the image is created for some Panfrost poking) currently wedges the board. Once the Kodi service is stopped “systemctl mask kodi” will prevent it from running again.
>>>
>>> https://protect2.fireeye.com/v1/url?k=b114ca54-ee8ff369-b115411b-0cc47a31309a-d8858f2897ed5521&q=1&e=addfcceb-9c68-4d7e-828c-344dd51262c2&u=https%3A%2F%2Fchewitt.libreelec.tv%2Ftesting%2FLibreELEC-Exynos.arm-10.0.0-odroid-xu4.img.gz
>>>
>>> Kernel defconfig for the image: https://protect2.fireeye.com/v1/url?k=806156b6-dffa6ff0-8060ddf9-0cc47a3003e8-b2bec8fd0863dc1b&q=1&e=df3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=http%3A%2F%2Fsprunge.us%2FG6uxty - basically the exynos config but with a wide variety of not-needed drivers (other SoCs, network cards, etc.) disabled.
>>>
>>> The board is booting from u-boot 2020.04 in case that matters.
>>
>> Thanks for sharing information. Sorry for replying late. I will check this problem on this week. 
>> It needs to satisfy all exynos5 SoCs. I just wonder why not working fine according to eMMC modules.
> 
> No problem, I’ve been watching the thread :)
> 
> This is the module I’m using https://protect2.fireeye.com/v1/url?k=991de2ef-c686dbd2-991c69a0-0cc47a31309a-1b07f48d5f69f8e8&q=1&e=addfcceb-9c68-4d7e-828c-344dd51262c2&u=https%3A%2F%2Fwww.hardkernel.com%2Fshop%2F8gb-emmc-module-h2%2F .. I can probably organise one to be shipped to you if needed.

Thanks for sharing eMMC module information. I will order it. 

https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258

And When I have been checked the code, it seems that changing CLK_DIV value to 2 is not correct. (It's workaround to just work.)
Maybe, it seems that phase is not a proper value about its eMMC. (After getting eMMC module, I can check in more detail.)

Best Regards,
Jaehoon Chung

> 
> Christian
> 

