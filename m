Return-Path: <SRS0=7hfY=2C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96790C00454
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 14:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D810214AF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 14:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qSclf1Xw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbfLLOJF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:09:05 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40007 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbfLLOJE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 09:09:04 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191212140901euoutp01efe96de112936828de85dd0d776eb7fd~fpO8n5rm_1971519715euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2019 14:09:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191212140901euoutp01efe96de112936828de85dd0d776eb7fd~fpO8n5rm_1971519715euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576159741;
        bh=PWhcovhRZtUS7mqljvutM7neMedXfO4zLwJfP7J8q3A=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qSclf1XwpZNsiD2/ld8ot32usEe8SgFsnFHsko9/vskyoe7KdIpmEI7t+7qWegjad
         sc/q8za9W7USBPc1BV84gRugfk1I5eltSEyfFVZB3zf7a9BkVlVMU8MfNO4l0GLD9l
         I7+U9a551mJ9Qcd4+65hS9m8BPh9nqxVpVchkdJ4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191212140901eucas1p1b039db417d18539ef9f84da99110cfb2~fpO8QSRB30649606496eucas1p1P;
        Thu, 12 Dec 2019 14:09:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4F.FF.60698.DF942FD5; Thu, 12
        Dec 2019 14:09:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191212140900eucas1p129b752b74b188bd25ed5dc50beed6c2b~fpO7_SfqR1916919169eucas1p1h;
        Thu, 12 Dec 2019 14:09:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191212140900eusmtrp187d1b6180a689b901272c701021b70be~fpO79mrlM3236932369eusmtrp13;
        Thu, 12 Dec 2019 14:09:00 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-d8-5df249fd2e99
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DB.14.07950.CF942FD5; Thu, 12
        Dec 2019 14:09:00 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191212140900eusmtip14ee874e808bd85a649be4b1f5d8e255e~fpO7ZpyX70100501005eusmtip1c;
        Thu, 12 Dec 2019 14:09:00 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org
Cc:     alsa-devel@alsa-project.org, dgreid@google.com,
        cychiang@google.com, Sylwester Nawrocki <s.nawrocki@samsung.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
Date:   Thu, 12 Dec 2019 15:09:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128151908.180871-1-tzungbi@google.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87p/PT/FGvw+wWdx5eIhJoupD5+w
        WZw43Mhs0T6zg9Hi/PkN7BYzzu9jsjj8pp3VYs/FV+wOHB4bPjexeSzYVOqxaVUnm0ffllWM
        Hp83yQWwRnHZpKTmZJalFunbJXBl9L2oLWjbyVTx4U1OA+OdNqYuRk4OCQETiUU921lAbCGB
        FYwSB2ZydDFyAdlfGCVOHjzCBuF8ZpR4tu4wG0zHiY1XoBLLGSX2PJjJCuG8ZZToffuPFaRK
        WCBP4uCS1WAdIgJWEq/777KAFDEL3GCUOPrnJyNIgk3AUKLrbRdYEa+AncSCE0fAbBYBVYkr
        M1uAbA4OUYFYiY7lGRAlghInZz4Bu5VTwFJi38+L7CA2s4C8RPPW2cwQtrjErSfzmUB2SQhs
        Y5d43vGdCWSOhICLRPvVSIgPhCVeHd/CDmHLSJye3MMCUd/MKPHw3Fp2CKeHUeJy0wxGiCpr
        icPHL7KCDGIW0JRYv0sfIuwoMfveZ2aI+XwSN94KQtzAJzFp23SoMK9ER5sQRLWaxKzj6+DW
        HrxwiXkCo9IsJJ/NQvLNLCTfzELYu4CRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZg
        Kjr97/jXHYz7/iQdYhTgYFTi4e2Q/BgrxJpYVlyZe4hRgoNZSYT3eNu7WCHelMTKqtSi/Pii
        0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4pRoYhVti5UxdxWq/6Wsbt96w8l99
        pa5Y7rFXj4Kd3ulfJf8ZnluWqFyRr9/lUS60rHPl99m/rrfc5sjYyJt6g6fAxvbZDFHho7MU
        V9R8tfXYUqd29UTnulerkzrbykQSpm22nrUnsWr9e0nnKfGffxu+KstewH75epYcxxnjAIbE
        DdxP7RXuzHBUYinOSDTUYi4qTgQA6hRaukEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7p/PD/FGhy9bGlx5eIhJoupD5+w
        WZw43Mhs0T6zg9Hi/PkN7BYzzu9jsjj8pp3VYs/FV+wOHB4bPjexeSzYVOqxaVUnm0ffllWM
        Hp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        Jehl9L2oLWjbyVTx4U1OA+OdNqYuRk4OCQETiRMbr7B1MXJxCAksZZQ49mYWG0RCRuLktAZW
        CFtY4s+1Lqii14wSK2deBEsIC+RJHFyyGqxBRMBK4nX/XRaQImaBW4wSfydvZIXo6GGUeLl+
        LztIFZuAoUTX2y6wDl4BO4kFJ46A2SwCqhJXZraA2aICsRLfV35ihKgRlDg58wkLiM0pYCmx
        7+dFsDnMAmYS8zY/ZIaw5SWat86GssUlbj2ZzzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi
        3PTcYiO94sTc4tK8dL3k/NxNjMAI3Hbs55YdjF3vgg8xCnAwKvHwPpD+GCvEmlhWXJl7iFGC
        g1lJhPd427tYId6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HJoe8knhDU0NzC0tDc2NzYzML
        JXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2Mwa1Llyl9X+LN/5xBfGpt+GX2lbunF7DfdD3W
        lMj83q7y7pcdTE9Ev7roqQS0ehgsLc8+cDFc6Un7jB0BLTHBE4q6qtP7yopq5izxU2bxta17
        drK5aG3v4qunjFTtbn6YKXp0+rt7/DUL1q3adM96BdfDRWurDvVMsfqpsKT1vN25KX9XLmRO
        UGIpzkg01GIuKk4EAKsIkG/WAgAA
X-CMS-MailID: 20191212140900eucas1p129b752b74b188bd25ed5dc50beed6c2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
        <20191128151908.180871-1-tzungbi@google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 28.11.2019 16:19, Tzung-Bi Shih wrote:
> According to the datasheet, there are some registers can only be changed
> when SHDN is 0.  Changing these settings during SHDN = 1 can compromise
> device stability and performance specifications.
>
> Saves SHDN before writing to these sensitive registers and restores SHDN
> afterward.
>
> Here is the register list codec driver of max98090 wants to change:
> M98090_REG_QUICK_SYSTEM_CLOCK		0x04
> M98090_REG_QUICK_SAMPLE_RATE		0x05
> M98090_REG_DAI_INTERFACE		0x06
> M98090_REG_DAC_PATH			0x07
> M98090_REG_MIC_DIRECT_TO_ADC		0x08
> M98090_REG_LINE_TO_ADC			0x09
> M98090_REG_ANALOG_MIC_LOOP		0x0A
> M98090_REG_ANALOG_LINE_LOOP		0x0B
> M98090_REG_SYSTEM_CLOCK			0x1B
> M98090_REG_CLOCK_MODE			0x1C
> M98090_REG_CLOCK_RATIO_NI_MSB		0x1D
> M98090_REG_CLOCK_RATIO_NI_LSB		0x1E
> M98090_REG_CLOCK_RATIO_MI_MSB		0x1F
> M98090_REG_CLOCK_RATIO_MI_LSB		0x20
> M98090_REG_MASTER_MODE			0x21
> M98090_REG_INTERFACE_FORMAT		0x22
> M98090_REG_TDM_CONTROL			0x23
> M98090_REG_TDM_FORMAT			0x24
> M98090_REG_IO_CONFIGURATION		0x25
> M98090_REG_FILTER_CONFIG		0x26
> M98090_REG_INPUT_ENABLE			0x3E
> M98090_REG_OUTPUT_ENABLE		0x3F
> M98090_REG_BIAS_CONTROL			0x42
> M98090_REG_DAC_CONTROL			0x43
> M98090_REG_ADC_CONTROL			0x44
> M98090_REG_DRC_TIMING			0x33
> M98090_REG_DRC_COMPRESSOR		0x34
> M98090_REG_DRC_EXPANDER			0x35
> M98090_REG_DSP_FILTER_ENABLE		0x41
> M98090_REG_EQUALIZER_BASE		0x46
> M98090_REG_RECORD_BIQUAD_BASE		0xAF
> M98090_REG_DIGITAL_MIC_ENABLE		0x13
> M98090_REG_DIGITAL_MIC_CONFIG		0x14
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Today I've noticed that this patch got merged to linux-next as commit 
62d5ae4cafb7ffeeec6ba2dd1814cafeeea7dd8f. Sadly it breaks codec 
operation on some Samsung Exynos SoC based boards: Odroid U3, XU, XU3 
and Chromebook Peach-Pit/Pi. I get the following errors during boot:

======================================================
WARNING: possible circular locking dependency detected
5.5.0-rc1-next-20191212 #86 Not tainted
------------------------------------------------------
alsactl/265 is trying to acquire lock:
eda820f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28

but task is already holding lock:
eda5249c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:
dwmmc_exynos 12200000.mmc: Unexpected interrupt latency

-> #1 (&card->controls_rwsem){++++}:
        snd_ctl_add_replace+0x3c/0x84
        dapm_create_or_share_kcontrol+0x24c/0x2e0
        snd_soc_dapm_new_widgets+0x308/0x594
        snd_soc_bind_card+0x80c/0xac8
        devm_snd_soc_register_card+0x34/0x6c
        asoc_simple_probe+0x244/0x4a0
        platform_drv_probe+0x6c/0xa4
        really_probe+0x200/0x490
        driver_probe_device+0x78/0x1f8
        bus_for_each_drv+0x74/0xb8
        __device_attach+0xd4/0x16c
        bus_probe_device+0x88/0x90
        deferred_probe_work_func+0x3c/0xd0
        process_one_work+0x22c/0x7c4
        worker_thread+0x44/0x524
        kthread+0x130/0x164
        ret_from_fork+0x14/0x20
        0x0

-> #0 (&card->dapm_mutex){+.+.}:
        lock_acquire+0xe8/0x270
        __mutex_lock+0x9c/0xb18
        mutex_lock_nested+0x1c/0x24
        max98090_shdn_save+0x1c/0x28
        max98090_put_enum_double+0x20/0x40
        snd_ctl_ioctl+0x190/0xbb8
        do_vfs_ioctl+0xb0/0xab0
        ksys_ioctl+0x34/0x5c
        ret_fast_syscall+0x0/0x28
        0xbe9094dc

other info that might help us debug this:

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&card->controls_rwsem);
                                lock(&card->dapm_mutex);
                                lock(&card->controls_rwsem);
   lock(&card->dapm_mutex);

  *** DEADLOCK ***

1 lock held by alsactl/265:
  #0: eda5249c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8

stack backtrace:
CPU: 0 PID: 265 Comm: alsactl Not tainted 5.5.0-rc1-next-20191212 #86
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[<c0112570>] (unwind_backtrace) from [<c010e05c>] (show_stack+0x10/0x14)
[<c010e05c>] (show_stack) from [<c0b1f15c>] (dump_stack+0xb4/0xe0)
[<c0b1f15c>] (dump_stack) from [<c0189eac>] (check_noncircular+0x1ec/0x208)
[<c0189eac>] (check_noncircular) from [<c018c2c8>] 
(__lock_acquire+0x1210/0x25ec)
[<c018c2c8>] (__lock_acquire) from [<c018dfc4>] (lock_acquire+0xe8/0x270)
[<c018dfc4>] (lock_acquire) from [<c0b3fc30>] (__mutex_lock+0x9c/0xb18)
[<c0b3fc30>] (__mutex_lock) from [<c0b406c8>] (mutex_lock_nested+0x1c/0x24)
[<c0b406c8>] (mutex_lock_nested) from [<c0833988>] 
(max98090_shdn_save+0x1c/0x28)
[<c0833988>] (max98090_shdn_save) from [<c0834404>] 
(max98090_put_enum_double+0x20/0x40)
[<c0834404>] (max98090_put_enum_double) from [<c0807970>] 
(snd_ctl_ioctl+0x190/0xbb8)
[<c0807970>] (snd_ctl_ioctl) from [<c02ca0bc>] (do_vfs_ioctl+0xb0/0xab0)
[<c02ca0bc>] (do_vfs_ioctl) from [<c02caaf0>] (ksys_ioctl+0x34/0x5c)
[<c02caaf0>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xec471fa8 to 0xec471ff0)
...

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 000000b0
pgd = (ptrval)
[000000b0] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 265 Comm: alsactl Not tainted 5.5.0-rc1-next-20191212 #86
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
PC is at __mutex_lock+0x54/0xb18
LR is at ___might_sleep+0x3c/0x2e0
pc : [<c0b3fbe8>]    lr : [<c01585a8>]    psr: 60000013
sp : ec471e00  ip : e85b2e05  fp : eda8b280
r10: eda52464  r9 : eda52000  r8 : be909618
r7 : c1916644  r6 : 00000000  r5 : 00000000  r4 : 00000080
r3 : 00000000  r2 : 00400000  r1 : 000003aa  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 6c62c06a  DAC: 00000051
Process alsactl (pid: 265, stack limit = 0x(ptrval))
Stack: (0xec471e00 to 0xec472000)
...
[<c0b3fbe8>] (__mutex_lock) from [<c0b406c8>] (mutex_lock_nested+0x1c/0x24)
[<c0b406c8>] (mutex_lock_nested) from [<c0833988>] 
(max98090_shdn_save+0x1c/0x28)
[<c0833988>] (max98090_shdn_save) from [<c0834344>] 
(max98090_dapm_put_enum_double+0x20/0x40)
[<c0834344>] (max98090_dapm_put_enum_double) from [<c0807970>] 
(snd_ctl_ioctl+0x190/0xbb8)
[<c0807970>] (snd_ctl_ioctl) from [<c02ca0bc>] (do_vfs_ioctl+0xb0/0xab0)
[<c02ca0bc>] (do_vfs_ioctl) from [<c02caaf0>] (ksys_ioctl+0x34/0x5c)
[<c02caaf0>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xec471fa8 to 0xec471ff0)
1fa0:                   00000001 00000000 00000003 c2c85513 be909618 
00472620
1fc0: 00000001 00000000 00000002 00000036 00000002 be909510 00000003 
be90996c
1fe0: b6f487c4 be9094dc b6e8d3a0 b6cda79c
Code: ebd8631b e5973000 e3530000 1a000002 (e5943030)
---[ end trace 376d2de2786690d7 ]---

The only strange thing is that Chromebook Snow, which also use this 
codec boots fine.

> ---
> This patch is a follow up fix for the question:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157364.html
>
> Changes from v1:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158855.html
> - fix a typo in commit message
> - rebase to the latest for-next (a few line numbers changed)
>
>   sound/soc/codecs/max98090.c | 433 ++++++++++++++++++++++++++----------
>   sound/soc/codecs/max98090.h |   3 +-
>   2 files changed, 312 insertions(+), 124 deletions(-)
>
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index e46b6ada13b1..da23810f958e 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -5,24 +5,149 @@
>    * Copyright 2011-2012 Maxim Integrated Products
>    */
>   
> +#include <linux/acpi.h>
> +#include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/of.h>
>   #include <linux/pm.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
> -#include <linux/acpi.h>
> -#include <linux/clk.h>
>   #include <sound/jack.h>
> +#include <sound/max98090.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include <sound/tlv.h>
> -#include <sound/max98090.h>
>   #include "max98090.h"
>   
> +static void max98090_shdn_save_locked(struct max98090_priv *max98090)
> +{
> +	int shdn = 0;
> +
> +	/* saved_shdn, saved_count, SHDN are protected by card->dapm_mutex */
> +	regmap_read(max98090->regmap, M98090_REG_DEVICE_SHUTDOWN, &shdn);
> +	max98090->saved_shdn |= shdn;
> +	++max98090->saved_count;
> +
> +	if (shdn)
> +		regmap_write(max98090->regmap, M98090_REG_DEVICE_SHUTDOWN, 0x0);
> +}
> +
> +static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
> +{
> +	/* saved_shdn, saved_count, SHDN are protected by card->dapm_mutex */
> +	if (--max98090->saved_count == 0) {
> +		if (max98090->saved_shdn) {
> +			regmap_write(max98090->regmap,
> +				     M98090_REG_DEVICE_SHUTDOWN,
> +				     M98090_SHDNN_MASK);
> +			max98090->saved_shdn = 0;
> +		}
> +	}
> +}
> +
> +static void max98090_shdn_save(struct max98090_priv *max98090)
> +{
> +	mutex_lock(&max98090->component->card->dapm_mutex);
> +	max98090_shdn_save_locked(max98090);
> +}
> +
> +static void max98090_shdn_restore(struct max98090_priv *max98090)
> +{
> +	max98090_shdn_restore_locked(max98090);
> +	mutex_unlock(&max98090->component->card->dapm_mutex);
> +}
> +
> +static int max98090_put_volsw(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct max98090_priv *max98090 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	max98090_shdn_save(max98090);
> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
> +	max98090_shdn_restore(max98090);
> +
> +	return ret;
> +}
> +
> +static int max98090_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct max98090_priv *max98090 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	max98090_shdn_save(max98090);
> +	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> +	max98090_shdn_restore(max98090);
> +
> +	return ret;
> +}
> +
> +static int max98090_put_enum_double(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct max98090_priv *max98090 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	max98090_shdn_save(max98090);
> +	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
> +	max98090_shdn_restore(max98090);
> +
> +	return ret;
> +}
> +
> +static int max98090_bytes_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct max98090_priv *max98090 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	max98090_shdn_save(max98090);
> +	ret = snd_soc_bytes_put(kcontrol, ucontrol);
> +	max98090_shdn_restore(max98090);
> +
> +	return ret;
> +}
> +
> +static int max98090_dapm_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct max98090_priv *max98090 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +	case SND_SOC_DAPM_PRE_PMD:
> +		max98090_shdn_save_locked(max98090);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +	case SND_SOC_DAPM_POST_PMD:
> +		max98090_shdn_restore_locked(max98090);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   /* Allows for sparsely populated register maps */
>   static const struct reg_default max98090_reg[] = {
>   	{ 0x00, 0x00 }, /* 00 Software Reset */
> @@ -506,10 +631,13 @@ static SOC_ENUM_SINGLE_DECL(max98090_adchp_enum,
>   			    max98090_pwr_perf_text);
>   
>   static const struct snd_kcontrol_new max98090_snd_controls[] = {
> -	SOC_ENUM("MIC Bias VCM Bandgap", max98090_vcmbandgap_enum),
> +	SOC_ENUM_EXT("MIC Bias VCM Bandgap", max98090_vcmbandgap_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
>   
> -	SOC_SINGLE("DMIC MIC Comp Filter Config", M98090_REG_DIGITAL_MIC_CONFIG,
> -		M98090_DMIC_COMP_SHIFT, M98090_DMIC_COMP_NUM - 1, 0),
> +	SOC_SINGLE_EXT("DMIC MIC Comp Filter Config",
> +		M98090_REG_DIGITAL_MIC_CONFIG,
> +		M98090_DMIC_COMP_SHIFT, M98090_DMIC_COMP_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   
>   	SOC_SINGLE_EXT_TLV("MIC1 Boost Volume",
>   		M98090_REG_MIC1_INPUT_LEVEL, M98090_MIC_PA1EN_SHIFT,
> @@ -564,24 +692,34 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
>   		M98090_AVR_SHIFT, M98090_AVR_NUM - 1, 1,
>   		max98090_av_tlv),
>   
> -	SOC_ENUM("ADC Oversampling Rate", max98090_osr128_enum),
> -	SOC_SINGLE("ADC Quantizer Dither", M98090_REG_ADC_CONTROL,
> -		M98090_ADCDITHER_SHIFT, M98090_ADCDITHER_NUM - 1, 0),
> -	SOC_ENUM("ADC High Performance Mode", max98090_adchp_enum),
> -
> -	SOC_SINGLE("DAC Mono Mode", M98090_REG_IO_CONFIGURATION,
> -		M98090_DMONO_SHIFT, M98090_DMONO_NUM - 1, 0),
> -	SOC_SINGLE("SDIN Mode", M98090_REG_IO_CONFIGURATION,
> -		M98090_SDIEN_SHIFT, M98090_SDIEN_NUM - 1, 0),
> -	SOC_SINGLE("SDOUT Mode", M98090_REG_IO_CONFIGURATION,
> -		M98090_SDOEN_SHIFT, M98090_SDOEN_NUM - 1, 0),
> -	SOC_SINGLE("SDOUT Hi-Z Mode", M98090_REG_IO_CONFIGURATION,
> -		M98090_HIZOFF_SHIFT, M98090_HIZOFF_NUM - 1, 1),
> -	SOC_ENUM("Filter Mode", max98090_mode_enum),
> -	SOC_SINGLE("Record Path DC Blocking", M98090_REG_FILTER_CONFIG,
> -		M98090_AHPF_SHIFT, M98090_AHPF_NUM - 1, 0),
> -	SOC_SINGLE("Playback Path DC Blocking", M98090_REG_FILTER_CONFIG,
> -		M98090_DHPF_SHIFT, M98090_DHPF_NUM - 1, 0),
> +	SOC_ENUM_EXT("ADC Oversampling Rate", max98090_osr128_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_SINGLE_EXT("ADC Quantizer Dither", M98090_REG_ADC_CONTROL,
> +		M98090_ADCDITHER_SHIFT, M98090_ADCDITHER_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_ENUM_EXT("ADC High Performance Mode", max98090_adchp_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +
> +	SOC_SINGLE_EXT("DAC Mono Mode", M98090_REG_IO_CONFIGURATION,
> +		M98090_DMONO_SHIFT, M98090_DMONO_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("SDIN Mode", M98090_REG_IO_CONFIGURATION,
> +		M98090_SDIEN_SHIFT, M98090_SDIEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("SDOUT Mode", M98090_REG_IO_CONFIGURATION,
> +		M98090_SDOEN_SHIFT, M98090_SDOEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("SDOUT Hi-Z Mode", M98090_REG_IO_CONFIGURATION,
> +		M98090_HIZOFF_SHIFT, M98090_HIZOFF_NUM - 1, 1,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_ENUM_EXT("Filter Mode", max98090_mode_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_SINGLE_EXT("Record Path DC Blocking", M98090_REG_FILTER_CONFIG,
> +		M98090_AHPF_SHIFT, M98090_AHPF_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("Playback Path DC Blocking", M98090_REG_FILTER_CONFIG,
> +		M98090_DHPF_SHIFT, M98090_DHPF_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   	SOC_SINGLE_TLV("Digital BQ Volume", M98090_REG_ADC_BIQUAD_LEVEL,
>   		M98090_AVBQ_SHIFT, M98090_AVBQ_NUM - 1, 1, max98090_dv_tlv),
>   	SOC_SINGLE_EXT_TLV("Digital Sidetone Volume",
> @@ -594,13 +732,17 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
>   	SOC_SINGLE_TLV("Digital Volume", M98090_REG_DAI_PLAYBACK_LEVEL,
>   		M98090_DV_SHIFT, M98090_DV_NUM - 1, 1,
>   		max98090_dv_tlv),
> -	SND_SOC_BYTES("EQ Coefficients", M98090_REG_EQUALIZER_BASE, 105),
> -	SOC_SINGLE("Digital EQ 3 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> -		M98090_EQ3BANDEN_SHIFT, M98090_EQ3BANDEN_NUM - 1, 0),
> -	SOC_SINGLE("Digital EQ 5 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> -		M98090_EQ5BANDEN_SHIFT, M98090_EQ5BANDEN_NUM - 1, 0),
> -	SOC_SINGLE("Digital EQ 7 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> -		M98090_EQ7BANDEN_SHIFT, M98090_EQ7BANDEN_NUM - 1, 0),
> +	SND_SOC_BYTES_E("EQ Coefficients", M98090_REG_EQUALIZER_BASE, 105,
> +		snd_soc_bytes_get, max98090_bytes_put),
> +	SOC_SINGLE_EXT("Digital EQ 3 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> +		M98090_EQ3BANDEN_SHIFT, M98090_EQ3BANDEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("Digital EQ 5 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> +		M98090_EQ5BANDEN_SHIFT, M98090_EQ5BANDEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_SINGLE_EXT("Digital EQ 7 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
> +		M98090_EQ7BANDEN_SHIFT, M98090_EQ7BANDEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   	SOC_SINGLE("Digital EQ Clipping Detection", M98090_REG_DAI_PLAYBACK_LEVEL_EQ,
>   		M98090_EQCLPN_SHIFT, M98090_EQCLPN_NUM - 1,
>   		1),
> @@ -608,25 +750,34 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
>   		M98090_DVEQ_SHIFT, M98090_DVEQ_NUM - 1, 1,
>   		max98090_dv_tlv),
>   
> -	SOC_SINGLE("ALC Enable", M98090_REG_DRC_TIMING,
> -		M98090_DRCEN_SHIFT, M98090_DRCEN_NUM - 1, 0),
> -	SOC_ENUM("ALC Attack Time", max98090_drcatk_enum),
> -	SOC_ENUM("ALC Release Time", max98090_drcrls_enum),
> +	SOC_SINGLE_EXT("ALC Enable", M98090_REG_DRC_TIMING,
> +		M98090_DRCEN_SHIFT, M98090_DRCEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
> +	SOC_ENUM_EXT("ALC Attack Time", max98090_drcatk_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_ENUM_EXT("ALC Release Time", max98090_drcrls_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
>   	SOC_SINGLE_TLV("ALC Make Up Volume", M98090_REG_DRC_GAIN,
>   		M98090_DRCG_SHIFT, M98090_DRCG_NUM - 1, 0,
>   		max98090_alcmakeup_tlv),
> -	SOC_ENUM("ALC Compression Ratio", max98090_alccmp_enum),
> -	SOC_ENUM("ALC Expansion Ratio", max98090_drcexp_enum),
> -	SOC_SINGLE_TLV("ALC Compression Threshold Volume",
> +	SOC_ENUM_EXT("ALC Compression Ratio", max98090_alccmp_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_ENUM_EXT("ALC Expansion Ratio", max98090_drcexp_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_SINGLE_EXT_TLV("ALC Compression Threshold Volume",
>   		M98090_REG_DRC_COMPRESSOR, M98090_DRCTHC_SHIFT,
> -		M98090_DRCTHC_NUM - 1, 1, max98090_alccomp_tlv),
> -	SOC_SINGLE_TLV("ALC Expansion Threshold Volume",
> +		M98090_DRCTHC_NUM - 1, 1,
> +		snd_soc_get_volsw, max98090_put_volsw, max98090_alccomp_tlv),
> +	SOC_SINGLE_EXT_TLV("ALC Expansion Threshold Volume",
>   		M98090_REG_DRC_EXPANDER, M98090_DRCTHE_SHIFT,
> -		M98090_DRCTHE_NUM - 1, 1, max98090_drcexp_tlv),
> +		M98090_DRCTHE_NUM - 1, 1,
> +		snd_soc_get_volsw, max98090_put_volsw, max98090_drcexp_tlv),
>   
> -	SOC_ENUM("DAC HP Playback Performance Mode",
> -		max98090_dac_perfmode_enum),
> -	SOC_ENUM("DAC High Performance Mode", max98090_dachp_enum),
> +	SOC_ENUM_EXT("DAC HP Playback Performance Mode",
> +		max98090_dac_perfmode_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_ENUM_EXT("DAC High Performance Mode", max98090_dachp_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
>   
>   	SOC_SINGLE_TLV("Headphone Left Mixer Volume",
>   		M98090_REG_HP_CONTROL, M98090_MIXHPLG_SHIFT,
> @@ -684,9 +835,12 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
>   	SOC_SINGLE("Volume Adjustment Smoothing", M98090_REG_LEVEL_CONTROL,
>   		M98090_VSENN_SHIFT, M98090_VSENN_NUM - 1, 1),
>   
> -	SND_SOC_BYTES("Biquad Coefficients", M98090_REG_RECORD_BIQUAD_BASE, 15),
> -	SOC_SINGLE("Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
> -		M98090_ADCBQEN_SHIFT, M98090_ADCBQEN_NUM - 1, 0),
> +	SND_SOC_BYTES_E("Biquad Coefficients",
> +		M98090_REG_RECORD_BIQUAD_BASE, 15,
> +		snd_soc_bytes_get, max98090_bytes_put),
> +	SOC_SINGLE_EXT("Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
> +		M98090_ADCBQEN_SHIFT, M98090_ADCBQEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   };
>   
>   static const struct snd_kcontrol_new max98091_snd_controls[] = {
> @@ -695,10 +849,12 @@ static const struct snd_kcontrol_new max98091_snd_controls[] = {
>   		M98090_DMIC34_ZEROPAD_SHIFT,
>   		M98090_DMIC34_ZEROPAD_NUM - 1, 0),
>   
> -	SOC_ENUM("Filter DMIC34 Mode", max98090_filter_dmic34mode_enum),
> -	SOC_SINGLE("DMIC34 DC Blocking", M98090_REG_FILTER_CONFIG,
> +	SOC_ENUM_EXT("Filter DMIC34 Mode", max98090_filter_dmic34mode_enum,
> +		snd_soc_get_enum_double, max98090_put_enum_double),
> +	SOC_SINGLE_EXT("DMIC34 DC Blocking", M98090_REG_FILTER_CONFIG,
>   		M98090_FLT_DMIC34HPF_SHIFT,
> -		M98090_FLT_DMIC34HPF_NUM - 1, 0),
> +		M98090_FLT_DMIC34HPF_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   
>   	SOC_SINGLE_TLV("DMIC3 Boost Volume", M98090_REG_DMIC3_VOLUME,
>   		M98090_DMIC_AV3G_SHIFT, M98090_DMIC_AV3G_NUM - 1, 0,
> @@ -716,8 +872,9 @@ static const struct snd_kcontrol_new max98091_snd_controls[] = {
>   
>   	SND_SOC_BYTES("DMIC34 Biquad Coefficients",
>   		M98090_REG_DMIC34_BIQUAD_BASE, 15),
> -	SOC_SINGLE("DMIC34 Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
> -		M98090_DMIC34BQEN_SHIFT, M98090_DMIC34BQEN_NUM - 1, 0),
> +	SOC_SINGLE_EXT("DMIC34 Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
> +		M98090_DMIC34BQEN_SHIFT, M98090_DMIC34BQEN_NUM - 1, 0,
> +		snd_soc_get_volsw, max98090_put_volsw),
>   
>   	SOC_SINGLE_TLV("DMIC34 BQ PreAttenuation Volume",
>   		M98090_REG_DMIC34_BQ_PREATTEN, M98090_AV34BQ_SHIFT,
> @@ -771,19 +928,6 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
>   	return 0;
>   }
>   
> -static int max98090_shdn_event(struct snd_soc_dapm_widget *w,
> -				 struct snd_kcontrol *kcontrol, int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
> -
> -	if (event & SND_SOC_DAPM_POST_PMU)
> -		max98090->shdn_pending = true;
> -
> -	return 0;
> -
> -}
> -
>   static const char *mic1_mux_text[] = { "IN12", "IN56" };
>   
>   static SOC_ENUM_SINGLE_DECL(mic1_mux_enum,
> @@ -884,10 +1028,14 @@ static SOC_ENUM_SINGLE_DECL(ltenr_mux_enum,
>   			    lten_mux_text);
>   
>   static const struct snd_kcontrol_new max98090_ltenl_mux =
> -	SOC_DAPM_ENUM("LTENL Mux", ltenl_mux_enum);
> +	SOC_DAPM_ENUM_EXT("LTENL Mux", ltenl_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  max98090_dapm_put_enum_double);
>   
>   static const struct snd_kcontrol_new max98090_ltenr_mux =
> -	SOC_DAPM_ENUM("LTENR Mux", ltenr_mux_enum);
> +	SOC_DAPM_ENUM_EXT("LTENR Mux", ltenr_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  max98090_dapm_put_enum_double);
>   
>   static const char *lben_mux_text[] = { "Normal", "Loopback" };
>   
> @@ -902,10 +1050,14 @@ static SOC_ENUM_SINGLE_DECL(lbenr_mux_enum,
>   			    lben_mux_text);
>   
>   static const struct snd_kcontrol_new max98090_lbenl_mux =
> -	SOC_DAPM_ENUM("LBENL Mux", lbenl_mux_enum);
> +	SOC_DAPM_ENUM_EXT("LBENL Mux", lbenl_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  max98090_dapm_put_enum_double);
>   
>   static const struct snd_kcontrol_new max98090_lbenr_mux =
> -	SOC_DAPM_ENUM("LBENR Mux", lbenr_mux_enum);
> +	SOC_DAPM_ENUM_EXT("LBENR Mux", lbenr_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  max98090_dapm_put_enum_double);
>   
>   static const char *stenl_mux_text[] = { "Normal", "Sidetone Left" };
>   
> @@ -1072,21 +1224,25 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_INPUT("IN56"),
>   
>   	SND_SOC_DAPM_SUPPLY("MICBIAS", M98090_REG_INPUT_ENABLE,
> -		M98090_MBEN_SHIFT, 0, NULL, 0),
> +		M98090_MBEN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("SHDN", M98090_REG_DEVICE_SHUTDOWN,
>   		M98090_SHDNN_SHIFT, 0, NULL, 0),
>   	SND_SOC_DAPM_SUPPLY("SDIEN", M98090_REG_IO_CONFIGURATION,
> -		M98090_SDIEN_SHIFT, 0, NULL, 0),
> +		M98090_SDIEN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("SDOEN", M98090_REG_IO_CONFIGURATION,
> -		M98090_SDOEN_SHIFT, 0, NULL, 0),
> +		M98090_SDOEN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("DMICL_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
> -		 M98090_DIGMICL_SHIFT, 0, max98090_shdn_event,
> -			SND_SOC_DAPM_POST_PMU),
> +		M98090_DIGMICL_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("DMICR_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
> -		 M98090_DIGMICR_SHIFT, 0, max98090_shdn_event,
> -			 SND_SOC_DAPM_POST_PMU),
> +		M98090_DIGMICR_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("AHPF", M98090_REG_FILTER_CONFIG,
> -		M98090_AHPF_SHIFT, 0, NULL, 0),
> +		M98090_AHPF_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   
>   /*
>    * Note: Sysclk and misc power supplies are taken care of by SHDN
> @@ -1116,10 +1272,12 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   		&max98090_lineb_mixer_controls[0],
>   		ARRAY_SIZE(max98090_lineb_mixer_controls)),
>   
> -	SND_SOC_DAPM_PGA("LINEA Input", M98090_REG_INPUT_ENABLE,
> -		M98090_LINEAEN_SHIFT, 0, NULL, 0),
> -	SND_SOC_DAPM_PGA("LINEB Input", M98090_REG_INPUT_ENABLE,
> -		M98090_LINEBEN_SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA_E("LINEA Input", M98090_REG_INPUT_ENABLE,
> +		M98090_LINEAEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("LINEB Input", M98090_REG_INPUT_ENABLE,
> +		M98090_LINEBEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   
>   	SND_SOC_DAPM_MIXER("Left ADC Mixer", SND_SOC_NOPM, 0, 0,
>   		&max98090_left_adc_mixer_controls[0],
> @@ -1130,11 +1288,11 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   		ARRAY_SIZE(max98090_right_adc_mixer_controls)),
>   
>   	SND_SOC_DAPM_ADC_E("ADCL", NULL, M98090_REG_INPUT_ENABLE,
> -		M98090_ADLEN_SHIFT, 0, max98090_shdn_event,
> -		SND_SOC_DAPM_POST_PMU),
> +		M98090_ADLEN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_ADC_E("ADCR", NULL, M98090_REG_INPUT_ENABLE,
> -		M98090_ADREN_SHIFT, 0, max98090_shdn_event,
> -		SND_SOC_DAPM_POST_PMU),
> +		M98090_ADREN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   
>   	SND_SOC_DAPM_AIF_OUT("AIFOUTL", "HiFi Capture", 0,
>   		SND_SOC_NOPM, 0, 0),
> @@ -1162,10 +1320,12 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_AIF_IN("AIFINL", "HiFi Playback", 0, SND_SOC_NOPM, 0, 0),
>   	SND_SOC_DAPM_AIF_IN("AIFINR", "HiFi Playback", 1, SND_SOC_NOPM, 0, 0),
>   
> -	SND_SOC_DAPM_DAC("DACL", NULL, M98090_REG_OUTPUT_ENABLE,
> -		M98090_DALEN_SHIFT, 0),
> -	SND_SOC_DAPM_DAC("DACR", NULL, M98090_REG_OUTPUT_ENABLE,
> -		M98090_DAREN_SHIFT, 0),
> +	SND_SOC_DAPM_DAC_E("DACL", NULL, M98090_REG_OUTPUT_ENABLE,
> +		M98090_DALEN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("DACR", NULL, M98090_REG_OUTPUT_ENABLE,
> +		M98090_DAREN_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   
>   	SND_SOC_DAPM_MIXER("Left Headphone Mixer", SND_SOC_NOPM, 0, 0,
>   		&max98090_left_hp_mixer_controls[0],
> @@ -1200,20 +1360,26 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", SND_SOC_NOPM, 0, 0,
>   		&max98090_mixhprsel_mux),
>   
> -	SND_SOC_DAPM_PGA("HP Left Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_HPLEN_SHIFT, 0, NULL, 0),
> -	SND_SOC_DAPM_PGA("HP Right Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_HPREN_SHIFT, 0, NULL, 0),
> -
> -	SND_SOC_DAPM_PGA("SPK Left Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_SPLEN_SHIFT, 0, NULL, 0),
> -	SND_SOC_DAPM_PGA("SPK Right Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_SPREN_SHIFT, 0, NULL, 0),
> -
> -	SND_SOC_DAPM_PGA("RCV Left Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_RCVLEN_SHIFT, 0, NULL, 0),
> -	SND_SOC_DAPM_PGA("RCV Right Out", M98090_REG_OUTPUT_ENABLE,
> -		M98090_RCVREN_SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA_E("HP Left Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_HPLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("HP Right Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_HPREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +
> +	SND_SOC_DAPM_PGA_E("SPK Left Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_SPLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("SPK Right Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_SPREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +
> +	SND_SOC_DAPM_PGA_E("RCV Left Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_RCVLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_PGA_E("RCV Right Out", M98090_REG_OUTPUT_ENABLE,
> +		M98090_RCVREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   
>   	SND_SOC_DAPM_OUTPUT("HPL"),
>   	SND_SOC_DAPM_OUTPUT("HPR"),
> @@ -1228,9 +1394,11 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
>   	SND_SOC_DAPM_INPUT("DMIC4"),
>   
>   	SND_SOC_DAPM_SUPPLY("DMIC3_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
> -		 M98090_DIGMIC3_SHIFT, 0, NULL, 0),
> +		M98090_DIGMIC3_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   	SND_SOC_DAPM_SUPPLY("DMIC4_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
> -		 M98090_DIGMIC4_SHIFT, 0, NULL, 0),
> +		M98090_DIGMIC4_SHIFT, 0, max98090_dapm_event,
> +		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
>   };
>   
>   static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
> @@ -1501,6 +1669,11 @@ static void max98090_configure_bclk(struct snd_soc_component *component)
>   		return;
>   	}
>   
> +	/*
> +	 * Master mode: no need to save and restore SHDN for the following
> +	 * sensitive registers.
> +	 */
> +
>   	/* Check for supported PCLK to LRCLK ratios */
>   	for (i = 0; i < ARRAY_SIZE(pclk_rates); i++) {
>   		if ((pclk_rates[i] == max98090->sysclk) &&
> @@ -1587,12 +1760,14 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
>   		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>   		case SND_SOC_DAIFMT_CBS_CFS:
>   			/* Set to slave mode PLL - MAS mode off */
> +			max98090_shdn_save(max98090);
>   			snd_soc_component_write(component,
>   				M98090_REG_CLOCK_RATIO_NI_MSB, 0x00);
>   			snd_soc_component_write(component,
>   				M98090_REG_CLOCK_RATIO_NI_LSB, 0x00);
>   			snd_soc_component_update_bits(component, M98090_REG_CLOCK_MODE,
>   				M98090_USE_M1_MASK, 0);
> +			max98090_shdn_restore(max98090);
>   			max98090->master = false;
>   			break;
>   		case SND_SOC_DAIFMT_CBM_CFM:
> @@ -1618,7 +1793,9 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
>   			dev_err(component->dev, "DAI clock mode unsupported");
>   			return -EINVAL;
>   		}
> +		max98090_shdn_save(max98090);
>   		snd_soc_component_write(component, M98090_REG_MASTER_MODE, regval);
> +		max98090_shdn_restore(max98090);
>   
>   		regval = 0;
>   		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> @@ -1663,8 +1840,10 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
>   		if (max98090->tdm_slots > 1)
>   			regval ^= M98090_BCI_MASK;
>   
> +		max98090_shdn_save(max98090);
>   		snd_soc_component_write(component,
>   			M98090_REG_INTERFACE_FORMAT, regval);
> +		max98090_shdn_restore(max98090);
>   	}
>   
>   	return 0;
> @@ -1676,6 +1855,7 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
>   	struct snd_soc_component *component = codec_dai->component;
>   	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
>   	struct max98090_cdata *cdata;
> +
>   	cdata = &max98090->dai[0];
>   
>   	if (slots < 0 || slots > 4)
> @@ -1685,6 +1865,7 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
>   	max98090->tdm_width = slot_width;
>   
>   	if (max98090->tdm_slots > 1) {
> +		max98090_shdn_save(max98090);
>   		/* SLOTL SLOTR SLOTDLY */
>   		snd_soc_component_write(component, M98090_REG_TDM_FORMAT,
>   			0 << M98090_TDM_SLOTL_SHIFT |
> @@ -1695,6 +1876,7 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
>   		snd_soc_component_update_bits(component, M98090_REG_TDM_CONTROL,
>   			M98090_TDM_MASK,
>   			M98090_TDM_MASK);
> +		max98090_shdn_restore(max98090);
>   	}
>   
>   	/*
> @@ -1894,6 +2076,7 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
>   	dmic_freq = dmic_table[pclk_index].settings[micclk_index].freq;
>   	dmic_comp = dmic_table[pclk_index].settings[micclk_index].comp[i];
>   
> +	max98090_shdn_save(max98090);
>   	regmap_update_bits(max98090->regmap, M98090_REG_DIGITAL_MIC_ENABLE,
>   			   M98090_MICCLK_MASK,
>   			   micclk_index << M98090_MICCLK_SHIFT);
> @@ -1902,6 +2085,7 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
>   			   M98090_DMIC_COMP_MASK | M98090_DMIC_FREQ_MASK,
>   			   dmic_comp << M98090_DMIC_COMP_SHIFT |
>   			   dmic_freq << M98090_DMIC_FREQ_SHIFT);
> +	max98090_shdn_restore(max98090);
>   
>   	return 0;
>   }
> @@ -1938,8 +2122,10 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
>   
>   	switch (params_width(params)) {
>   	case 16:
> +		max98090_shdn_save(max98090);
>   		snd_soc_component_update_bits(component, M98090_REG_INTERFACE_FORMAT,
>   			M98090_WS_MASK, 0);
> +		max98090_shdn_restore(max98090);
>   		break;
>   	default:
>   		return -EINVAL;
> @@ -1950,6 +2136,7 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
>   
>   	cdata->rate = max98090->lrclk;
>   
> +	max98090_shdn_save(max98090);
>   	/* Update filter mode */
>   	if (max98090->lrclk < 24000)
>   		snd_soc_component_update_bits(component, M98090_REG_FILTER_CONFIG,
> @@ -1965,6 +2152,7 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
>   	else
>   		snd_soc_component_update_bits(component, M98090_REG_FILTER_CONFIG,
>   			M98090_DHF_MASK, M98090_DHF_MASK);
> +	max98090_shdn_restore(max98090);
>   
>   	max98090_configure_dmic(max98090, max98090->dmic_freq, max98090->pclk,
>   				max98090->lrclk);
> @@ -1995,6 +2183,7 @@ static int max98090_dai_set_sysclk(struct snd_soc_dai *dai,
>   	 *		 0x02 (when master clk is 20MHz to 40MHz)..
>   	 *		 0x03 (when master clk is 40MHz to 60MHz)..
>   	 */
> +	max98090_shdn_save(max98090);
>   	if ((freq >= 10000000) && (freq <= 20000000)) {
>   		snd_soc_component_write(component, M98090_REG_SYSTEM_CLOCK,
>   			M98090_PSCLK_DIV1);
> @@ -2009,8 +2198,10 @@ static int max98090_dai_set_sysclk(struct snd_soc_dai *dai,
>   		max98090->pclk = freq >> 2;
>   	} else {
>   		dev_err(component->dev, "Invalid master clock frequency\n");
> +		max98090_shdn_restore(max98090);
>   		return -EINVAL;
>   	}
> +	max98090_shdn_restore(max98090);
>   
>   	max98090->sysclk = freq;
>   
> @@ -2122,10 +2313,12 @@ static void max98090_pll_work(struct max98090_priv *max98090)
>   	 */
>   
>   	/* Toggle shutdown OFF then ON */
> +	mutex_lock(&component->card->dapm_mutex);
>   	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
>   			    M98090_SHDNN_MASK, 0);
>   	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
>   			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
> +	mutex_unlock(&component->card->dapm_mutex);
>   
>   	for (i = 0; i < 10; ++i) {
>   		/* Give PLL time to lock */
> @@ -2448,7 +2641,12 @@ static int max98090_probe(struct snd_soc_component *component)
>   	 */
>   	snd_soc_component_read32(component, M98090_REG_DEVICE_STATUS);
>   
> -	/* High Performance is default */
> +	/*
> +	 * SHDN should be 0 at the point, no need to save/restore for the
> +	 * following registers.
> +	 *
> +	 * High Performance is default
> +	 */
>   	snd_soc_component_update_bits(component, M98090_REG_DAC_CONTROL,
>   		M98090_DACHP_MASK,
>   		1 << M98090_DACHP_SHIFT);
> @@ -2459,7 +2657,12 @@ static int max98090_probe(struct snd_soc_component *component)
>   		M98090_ADCHP_MASK,
>   		1 << M98090_ADCHP_SHIFT);
>   
> -	/* Turn on VCM bandgap reference */
> +	/*
> +	 * SHDN should be 0 at the point, no need to save/restore for the
> +	 * following registers.
> +	 *
> +	 * Turn on VCM bandgap reference
> +	 */
>   	snd_soc_component_write(component, M98090_REG_BIAS_CONTROL,
>   		M98090_VCM_MODE_MASK);
>   
> @@ -2491,25 +2694,9 @@ static void max98090_remove(struct snd_soc_component *component)
>   	max98090->component = NULL;
>   }
>   
> -static void max98090_seq_notifier(struct snd_soc_component *component,
> -	enum snd_soc_dapm_type event, int subseq)
> -{
> -	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
> -
> -	if (max98090->shdn_pending) {
> -		snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
> -				M98090_SHDNN_MASK, 0);
> -		msleep(40);
> -		snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
> -				M98090_SHDNN_MASK, M98090_SHDNN_MASK);
> -		max98090->shdn_pending = false;
> -	}
> -}
> -
>   static const struct snd_soc_component_driver soc_component_dev_max98090 = {
>   	.probe			= max98090_probe,
>   	.remove			= max98090_remove,
> -	.seq_notifier		= max98090_seq_notifier,
>   	.set_bias_level		= max98090_set_bias_level,
>   	.idle_bias_on		= 1,
>   	.use_pmdown_time	= 1,
> diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
> index a197114b0dad..0a31708b7df7 100644
> --- a/sound/soc/codecs/max98090.h
> +++ b/sound/soc/codecs/max98090.h
> @@ -1539,7 +1539,8 @@ struct max98090_priv {
>   	unsigned int pa2en;
>   	unsigned int sidetone;
>   	bool master;
> -	bool shdn_pending;
> +	int saved_count;
> +	int saved_shdn;
>   };
>   
>   int max98090_mic_detect(struct snd_soc_component *component,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

