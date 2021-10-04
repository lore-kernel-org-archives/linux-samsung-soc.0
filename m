Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4595C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 13:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3DFF61B03
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 13:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhJDNGD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 09:06:03 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:35556 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbhJDNEF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 09:04:05 -0400
Received: by mail-lf1-f50.google.com with SMTP id m3so70677820lfu.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2021 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7kUfQhonfxMF8gCM53v6Ca/5ohbsTimi4/IYDf4+acc=;
        b=kjPo3CuDaolMLrsn1r+qX2MXEXm/Vcb5l2ogHazKMPEAASXiFUcOn7naOcaT/f6478
         XhX2yKXmbSuiszuGdzE/lC8peM439JSmFQoHeABKjaIbepZMgMiSBtyTi2mwPFr8oPzN
         zr+2yOXD0B8YIpAAMwtSX4UG58yuDMjfiRg+DQnCz8npa1POCY1Lb2WR/SpGd5KFllgF
         dlOlWwVFr+N03nijtr2uuN8Z6rj0Gc8VYnFE5NMsd5eZ2NfEQ/3AZ//fzcHQGGF9lLds
         R+6KKNEPU6s0NzYJsZa0slyt2QpfMsT6GBUAIQVLazAmXPgLAnuwjZ5w9YpZNWIP/Xqt
         Gt/w==
X-Gm-Message-State: AOAM531MHQrPZtKom4OhBiPiU+m7SBUNK75FOU07lLrFxkqPKThpDZoJ
        bl5G6CDqC1irVPcucPu2IVuWNlwobx0=
X-Google-Smtp-Source: ABdhPJyQwDlnucAM20PLTbcGx2Lq1DmdcjlROLSfcG9hl8UHbr9DEQkGNeyU4hvO2LrhI276Vn4iRg==
X-Received: by 2002:a2e:a78d:: with SMTP id c13mr15426144ljf.75.1633352514017;
        Mon, 04 Oct 2021 06:01:54 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.googlemail.com with ESMTPSA id r9sm1483163lfi.231.2021.10.04.06.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 06:01:53 -0700 (PDT)
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
 <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
 <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
 <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
 <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
Message-ID: <04ab2789-0218-42be-888d-a54ab2826e15@kernel.org>
Date:   Mon, 4 Oct 2021 15:01:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/10/2021 12:07, Marek Szyprowski wrote:
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
> 

Thanks for testing and performance measurements. The read speed seems to
be a direct effect of lower mmc bus frequency (DIVRATIO changed from 2
to 3).

What next? Except what Marek suggested, maybe compare MMC card
capabilities and try to find a difference? For example Marek's eMMC (at
least one with logs) is from Sandisk SDW16G. Christian's and Marian's
(Memeka / mihailescu2m) is apparently Samsung's 8GME4R.

Because the patch reduces performance and not all users are affected, I
have some doubts. Maybe use by default lower clock (so as in this patch)
but if card is in list of known good cards go higher?

Another idea is to use always slower bus because it is simply safer and
we do not have resources to test 100x of different eMMC modules...

Any comments from you?

Best regards,
Krzysztof
