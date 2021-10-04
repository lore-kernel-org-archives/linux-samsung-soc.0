Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBC2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 10:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B00B6120A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 10:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhJDKJu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 06:09:50 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45381 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbhJDKJt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 06:09:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211004100758euoutp0251a30075e7efbb58a52e8df0f656bcec~qy-eH04cj2756027560euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Oct 2021 10:07:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211004100758euoutp0251a30075e7efbb58a52e8df0f656bcec~qy-eH04cj2756027560euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633342078;
        bh=nJPFl4SnO+ZnZP+FlvylW9c4IFDXBl4TkaoKUmVEVZQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=aToCyfQL4NfFIPbN/3aaCmBG9j8laXrdaPopdjuAw7P0jlePLBKucsEE8DQpdIqgr
         EU6BWcICCytCgYIeVlf27VH+0gNOUB8kR8O3zcijyVVb/htSrjeOJsIH/RYYuUKonM
         q8cE4CAaZtEVX4Ha50eQUYpfUY1p2QXDk5uZ5QzA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211004100758eucas1p24c0c88bd7021f1dfc367acdb5eefd1b8~qy-dzaRz01316113161eucas1p2k;
        Mon,  4 Oct 2021 10:07:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C8.2A.45756.E72DA516; Mon,  4
        Oct 2021 11:07:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211004100758eucas1p203355d224c467d4c5f13a7f544da12dc~qy-dadBNG1084510845eucas1p2x;
        Mon,  4 Oct 2021 10:07:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211004100758eusmtrp20b6e183a7d40d923a4d76bb77627cf68~qy-dZgIhH1869718697eusmtrp2L;
        Mon,  4 Oct 2021 10:07:58 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-3d-615ad27e0b54
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.00.31287.E72DA516; Mon,  4
        Oct 2021 11:07:58 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211004100757eusmtip22479ab2278d4765a435658d856eee542~qy-c6GOgb3016930169eusmtip2a;
        Mon,  4 Oct 2021 10:07:57 +0000 (GMT)
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
Date:   Mon, 4 Oct 2021 12:07:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87p1l6ISDd7skLZ4dWsys8WNX22s
        FufPb2C3mHF+H5PF+mk/WS3an75ktji+NtyB3WPnrLvsHptWdbJ53Lm2h82jb8sqRo/Pm+QC
        WKO4bFJSczLLUov07RK4Mh48ustccFKv4vKfW6wNjJdVuxg5OSQETCQmXpnD3sXIxSEksIJR
        4sK3fUwgCSGBL4wSqz6UQtifGSWufvSDadjy5BszRMNyRomDd9uhnI+MEgc6z4F1Cwu4Spyf
        d58RJCEi0MQosXDqYTCHWeAMo8S+TVfZQKrYBAwlut52gdm8AnYSu2a1soPYLAIqEgvf3WUF
        sUUFkiWm/W1ihqgRlDg58wkLiM0pYC/R1LISLM4sIC/RvHU2lC0ucevJfCaIW29wSCxYpgVh
        u0jcP7eWEcIWlnh1fAs7hC0j8X8nSD0XkN3MKPHw3Fp2CKeHUeJy0wyoDmuJO+d+AV3KAbRB
        U2L9Ln2IsKPEpIaPLCBhCQE+iRtvBSFu4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEPIFR
        aRaSz2Yh+WYWkm9mIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzAFnf53/NMO
        xrmvPuodYmTiYDzEKMHBrCTCe9UrMlGINyWxsiq1KD++qDQntfgQozQHi5I476rZa+KFBNIT
        S1KzU1MLUotgskwcnFINTKLms2RnOqtHlVZZFjJf5r48qWD5W7mqX3IP4y8ymcf8/aT5Ka/Q
        fn3HrLQnfPGLxIUXPv6+Ovzte37ur78XHbJJuFFwl3Xr5NOhDOYGckVBq1eW50qd/e/DZhdq
        vVfKRGeHwnxL5kkHKl/VhJ9camz25Uz2wrpnFRK94duKS+S31N21ONka9on9ZUVf0YQ6odtM
        Bk//XZhYs3V2hXFUQNbxOgfLRslLXqJ1G3nbzvjbTJ7X2mwTYLj6XbXxj9qAXPdpk3d+19nj
        bnVE/Ejl/+61rtsjF+//nfs8SNXe1NnO+IaLfdW+jW9vpj/rzjOZu2zBqeq9d/k8U3UmZ5uu
        WMsuz8hxUuL4rpeNflNilFiKMxINtZiLihMBUQTTI7ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7p1l6ISDb72sFm8ujWZ2eLGrzZW
        i/PnN7BbzDi/j8li/bSfrBbtT18yWxxfG+7A7rFz1l12j02rOtk87lzbw+bRt2UVo8fnTXIB
        rFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GQ8e
        3WUuOKlXcfnPLdYGxsuqXYycHBICJhJbnnxj7mLk4hASWMoocet5KzNEQkbi5LQGVghbWOLP
        tS42iKL3jBJbd5xkA0kIC7hKnJ93nxEkISLQwijxZmoTE4jDLHCOUWLTxodMEC09TBKL/r8G
        a2ETMJToetsFZvMK2EnsmtXKDmKzCKhILHx3F2yfqECyxNvX35kgagQlTs58wgJicwrYSzS1
        rAS7j1nATGLe5odQtrxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJue
        W2yoV5yYW1yal66XnJ+7iREYeduO/dy8g3Heq496hxiZOBgPMUpwMCuJ8F71ikwU4k1JrKxK
        LcqPLyrNSS0+xGgK9M9EZinR5Hxg7OeVxBuaGZgamphZGphamhkrifNunbsmXkggPbEkNTs1
        tSC1CKaPiYNTqoFprVbr+QubxOvXHzQ4q15XeOjS2jAJs121fcVHP/g/W/0mKoJPT/R7SLuB
        M/eyP8IqjK+nfbHLboyMCvn1bpmYzYn7wR+iZb4I19o61OW/O9T/+kK4yK8Jod5vdl1kLFzN
        naZVypY4z97vi5Oy+pFe7iDXLJb1ZUn+p9PVedRqf3rXHG4P9vi68ar2M2/ty977JP9NOmyp
        8y3+beXd6smBwT8fv+Y9o/M+xyRYKizGp1r884xLt4ItGE49vZbuqHFN1OVRQECa97Z/gZ6v
        Zof21XHtmsOhdX/7NvOqKTVKa3cYxKgIbOaYy/F6kY5G1fkUfd//4bFRfsqbarUmVMkI70nn
        UDmXH7fxtY5arhJLcUaioRZzUXEiADjmvc1FAwAA
X-CMS-MailID: 20211004100758eucas1p203355d224c467d4c5f13a7f544da12dc
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On 01.10.2021 02:40, Jaehoon Chung wrote:
> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>> <christianshewitt@gmail.com> wrote:
>>> https://protect2.fireeye.com/v1/url?k=6f7d4070-30e6793d-6f7ccb3f-0cc47aa8f5ba-2c8976d4b015314f&q=1&e=776d64d2-22f3-400a-a241-42af8b5f60d0&u=https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9fafc92a50d5e81a4f258
>>>
>>> If I boot any recent kernel without the above patch, the emmc module on the XU4 is not detected, see:
>>>
>>> Without:
>>>
>>> [    3.227837] mmc0: tuning execution failed: -5
>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>> [    3.536450] mmc0: tuning execution failed: -5
>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>> [    3.794056] mmc0: tuning execution failed: -5
>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>> [    4.111097] mmc0: tuning execution failed: -5
>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>> [    4.426164] mmc0: tuning execution failed: -5
>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>> [    4.756226] mmc0: tuning execution failed: -5
>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>
>>> With:
>>>
>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
>>> [    3.315963]  mmcblk0: p1 p2
>>>
>>> The patch is sourced from a Linux 5.4 patchset used by several retro gaming distros for XU4 images shared in the HardKernel forums. I would be happy to submit it, but the original patch has no description in the commit message. Not being a coding developer myself I cannot explain whether it is correct or what it’s doing to add one. All I can do is confirm that it works, and is needed. SD card boot is not an issue.
>>>
>>> I’ve CC’d the original author (Marian) in case he remembers the patch and can comment. It would be good to get this upstream.
>> The patch might have sense but would require describing conditions -
>> what MMC input and output clock settings work and which do not work.
>> Also someone would need to test other Exynos5422 boards and other
>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>> this should not affect SD cards.
>
> Thanks for adding me.
> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>
> [    4.561934] mmc1: new HS400 MMC card at address 0001
> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>
> Which kernel version did you use?

I came across this patch some time ago, but also didn't manage to 
reproduce the issue - in my case eMMC was always detected properly. It 
might be related to particular version or series of the eMMC modules.

I've just checked that patch on XU3, XU4, PeachPi and TM2e boards. All 
are working properly with it.

I've also tried to benchmark the impact of that change and in some case 
it causes some performance degradation.

The main difference is clock configuration. Before this patch (XU4):

# dmesg | grep mmc0
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, 
actual 396825HZ div = 63)
mmc_host mmc0: Bus speed (slot 0) = 200000000Hz (slot req 200000000Hz, 
actual 200000000HZ div = 0)
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, 
actual 50000000HZ div = 0)
mmc_host mmc0: Bus speed (slot 0) = 400000000Hz (slot req 200000000Hz, 
actual 200000000HZ div = 1)
mmc0: new HS400 MMC card at address 0001
mmcblk0: mmc0:0001 SDW16G 14.7 GiB
mmcblk0boot0: mmc0:0001 SDW16G 4.00 MiB
mmcblk0boot1: mmc0:0001 SDW16G 4.00 MiB
mmcblk0rpmb: mmc0:0001 SDW16G 4.00 MiB, chardev (245:0)

After applying the patch (mmc device number is random depending on the 
boot):

# dmesg | grep mmc1
[    3.619177] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 
400000Hz, actual 396825HZ div = 63)
[    4.057167] mmc_host mmc1: Bus speed (slot 0) = 200000000Hz (slot req 
200000000Hz, actual 200000000HZ div = 0)
[    4.070040] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 
52000000Hz, actual 50000000HZ div = 0)
[    4.089028] mmc_host mmc1: Bus speed (slot 0) = 266666666Hz (slot req 
200000000Hz, actual 133333333HZ div = 1)
[    4.102296] mmc1: new HS400 MMC card at address 0001
[    4.119072] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
[    4.173507] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
[    4.196210] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
[    4.215163] mmcblk1rpmb: mmc1:0001 SDW16G 4.00 MiB, chardev (245:0)

The performance has been measured with:

# dd if=/dev/mmcblk1p6 of=/dev/null bs=128k
31944+0 records in
31944+0 records out
4186963968 bytes (4.2 GB) copied, 36.6981 s, 114 MB/s

Results (XU4 board):

exynos_defconfig: 145 MB/s (before) vs 114 MB/s (after)
exynos_defconfig + all devfreqs set to performance: 146 MB/s vs 115 MB/s
exynos_defconfig + cpufreq & all devfreqs set to performance: 154 MB/s 
vs 139 MB/s
exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ disabled: 130 MB/s vs 
108 MB/s
exynos_defconfig + CONFIG_CPUFREQ_DT disabled: 69 MB/s (no impact)
exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ & CONFIG_CPUFREQ_DT: 66 
MB/s (no impact)


Maybe some other clock configuration (I mean the rate of the top-level 
clocks or even PLLS) will solve the issue without degrading the 
performance, but it is hard to judge that without reproducing the issue.


Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

