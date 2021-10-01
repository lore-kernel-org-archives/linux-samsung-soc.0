Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE357C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 00:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD99E615E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 00:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbhJAAmF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Sep 2021 20:42:05 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:62413 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349762AbhJAAmE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 20:42:04 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211001004020epoutp0200a61a0901911ded5d5db59aec6fe509~pwT-h806J0162601626epoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Oct 2021 00:40:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211001004020epoutp0200a61a0901911ded5d5db59aec6fe509~pwT-h806J0162601626epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633048820;
        bh=hfGDS14ageU/QUjNg0sSG4gozp8U+gxNiePmUyrA6rU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=k0OlHLC/lLZCfjqjvdC8khELxIbqa3TixmJLcZ6wf9hZSl+8JYOWVwOprgH92Jy3f
         Hg2IFQJ0vKhX/g2jysSSIQFMg/h9L/EX0ilxgvRWXDe3y3tPL0AFF48gGqxCJpQtdY
         AeE2CooY82ZjyVl15yk3F6zpFgy6eFEe48Wfp2vM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20211001004019epcas1p48cb70eed85581c12a2c8a536f6a9dceb~pwT_-ZGyr2136121361epcas1p4A;
        Fri,  1 Oct 2021 00:40:19 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HLB8v3mhKz4x9Q7; Fri,  1 Oct
        2021 00:40:15 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        A2.93.24398.6E856516; Fri,  1 Oct 2021 09:40:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211001004005epcas1p1a667fb0ef56cbcc5e8d53f308cbd65a8~pwTxxMyHn1240812408epcas1p1M;
        Fri,  1 Oct 2021 00:40:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211001004005epsmtrp1d7f4c0479414d27258d95d989490a91d~pwTxwUDpa0294902949epsmtrp1a;
        Fri,  1 Oct 2021 00:40:05 +0000 (GMT)
X-AuditID: b6c32a35-0d7ff70000005f4e-f8-615658e6f412
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6F.32.08750.5E856516; Fri,  1 Oct 2021 09:40:05 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211001004005epsmtip18611bfa5d97d76ac94a3acec7ad58dd0~pwTxjLx7I0850708507epsmtip1k;
        Fri,  1 Oct 2021 00:40:04 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
Date:   Fri, 1 Oct 2021 09:40:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmge6ziLBEg6OflCxe3ZrMbHH+/AZ2
        ixnn9zFZrD1yl91i/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwL9IoTc4tL89L18lJLrAwNDIxMgQoT
        sjO+P3vFWjBHvKL36QfWBsaDQl2MnBwSAiYSFy9sYeti5OIQEtjBKHF9zhMo5xOjxKu+fiYI
        5zOjxK279xlhWt5NvAOV2MUosXzjEmYI5z2jxMQ9vcwgVcICrhLn50F0iAhESTyc9pwVpIhZ
        4DejxM6fC1hAEmwCOhLbvx1nArF5BewkFjYcZAOxWQRUJG63tYHZogKREn9P7mKFqBGUODnz
        CVgvp0CgxIzmuewgNrOAuMStJ/OZIGx5ieats5khTp3IIXF8byiE7SLxZ8ohVghbWOLV8S3s
        ELaUxMv+Nii7WmJX8xmwbyQEOoB+3tbEBJEwlti/dDKQzQG0QFNi/S59iLCixM7fcxkh9vJJ
        vPvawwpSIiHAK9HRBg1gFYlLr18yway6++Q/VImHxJ7F6hMYFWcheWwWkmdmIXlmFsLeBYws
        qxjFUguKc9NTiw0LDOGxnZyfu4kRnEK1THcwTnz7Qe8QIxMH4yFGCQ5mJRHeH+LBiUK8KYmV
        ValF+fFFpTmpxYcYTYFBPZFZSjQ5H5jE80riDU0sDUzMjIxNLAzNDJXEeY+9tkwUEkhPLEnN
        Tk0tSC2C6WPi4JRqYOJtmy10uYnnw5rKzR42lidPNf1YcWXHCaZX5WE/jH55zz6iPtGgqmgz
        e2Xx+pSTpx4q7b9SufXBgVumjXJqQlf6wwTffeWZGWDE8lTTOLPr5qHlN5y3MR/Pdb5/5/+p
        zOgjrX6lrD23nor3Mq1/W8fyfq+St2zdZU3+ZuXWdM9MnUJOXc6ZYbvb8t1S/34WKqt5OPGg
        bZ5bqFLGY5WDBlzsUnO+bNFY8Wb27Xy+5amb9tmvClm9I1r7mN+zpf22ORvOn148Zd/UCYf3
        Vhs/crsbpHVtu0mI1anT+/9P+PmtXNbglcuCfUf0uo4fd12Tfc2gasOd+vCih2ELG3Yfkee/
        +2WWfqRW+bzVnP+1zroosRRnJBpqMRcVJwIAQ7J2uSoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnO7TiLBEgxuveS1e3ZrMbHH+/AZ2
        ixnn9zFZrD1yl91i/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFFcNimpOZllqUX6dglcGd+fvWItmCNe0fv0A2sD40GhLkZODgkBE4l3E+8wdTFycQgJ7GCU
        2DVxNRtEQkri89OpQDYHkC0scfhwMUhYSOAto8THKZwgtrCAq8T5efcZQWwRgSiJs8dug81h
        FvjLKHHw9l9miKHXGSW2bN7GDFLFJqAjsf3bcSYQm1fATmJhw0GwZSwCKhK329rAbFGBSImm
        E1vZIGoEJU7OfMICYnMKBErMaJ7LDmIzC6hL/Jl3iRnCFpe49WQ+E4QtL9G8dTbzBEahWUja
        ZyFpmYWkZRaSlgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKjRktrB+OeVR/0
        DjEycTAeYpTgYFYS4f0hHpwoxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTU
        gtQimCwTB6dUA5OP66Hwl197u3O11aqOr2B8LBYQefr0JMOtFwuDlcPald/1/TBPnu1c0v4h
        JPmIKqvIEqNP72c2l31SeXbV0+NkeFXJcqve/m3f+VJFpk1p7bu6NaZgls35m1nLZM9YS/Ke
        rP3C6X3wumaZXlVk2OPzYcUrYt/ULWTrZzFYPNvptlj+w3MeS7esO/3iQdBnb/nwM4r+P84d
        zJwamHlm7fOy35HVCT+eZAZum/br9ZyaS89Y7Of2X+KuMv8Qtny5MD/virYNrVx9n1ZGMzsf
        ZqjZXRXRfezo9bv/rq7yrNjhV27z+9bfG7YuvffybvkdiWWNb3D9ft5PaXqTKNfLj4vVdqUu
        8vJ8lvEtpHd75TYlluKMREMt5qLiRADndsm0CQMAAA==
X-CMS-MailID: 20211001004005epcas1p1a667fb0ef56cbcc5e8d53f308cbd65a8
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>
>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>
>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>
>> Without:
>>
>> [    3.227837] mmc0: tuning execution failed: -5
>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>> [    3.536450] mmc0: tuning execution failed: -5
>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>> [    3.794056] mmc0: tuning execution failed: -5
>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>> [    4.111097] mmc0: tuning execution failed: -5
>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>> [    4.426164] mmc0: tuning execution failed: -5
>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>> [    4.756226] mmc0: tuning execution failed: -5
>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>
>> With:
>>
>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>> [    3.315963]  mmcblk0: p1 p2
>>
>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>
>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
> 
> The patch might have sense but would require describing conditions -
> what MMC input and output clock settings work and which do not work.
> Also someone would need to test other Exynos5422 boards and other
> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
> this should not affect SD cards.


Thanks for adding me.
I didn't see XU4 booting fail with linux-5.15-rc1 kernel.

[    4.561934] mmc1: new HS400 MMC card at address 0001
[    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
[    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
[    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
[    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB

Which kernel version did you use?

Best Regards,
Jaehoon Chung

> 
> +Cc Marek, Sylwester, Jaehoon and Ulf.
> 
> Best regards,
> Krzysztof
> 

