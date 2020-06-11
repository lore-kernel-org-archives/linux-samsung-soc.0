Return-Path: <SRS0=3c0k=7Y=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D89C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 05:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BCE2074B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 05:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji97ynMS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgFKFoJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Jun 2020 01:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgFKFoJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 01:44:09 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087B1C08C5C1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2020 22:44:08 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id l6so4317564ilo.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2020 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=nSiAU05tdsBcdotQGowaH1I7zBOyLBN7vECCGjJR/dU=;
        b=ji97ynMSZnWF7i/GeIZYWGZa018t9todXl8lVe6jQZgyk0+NbQ9/UpbImE0F4+b8cl
         0fqSaxHfbJRvdn9MjSPPFcW7jPHKdhtKUmKW5J1EnCfVECCuL2KKXnBkTGaGHKRWhpzx
         A3jfU7pu2f0zg91ZjPjeEO8Kvh60E59y7oDo6/9mXi1FDzT8ZxeAqj8omPjExTVbh1cv
         zsGkGd0KZ9nV9svVhLOjIchSv8Dtqsf11lrgM6eBsiHxv7qrT28jJR3kuV32TAILZaKm
         AdB5Nj+c1IXs2yz6uPFU3I1je+v3C5p3oZ9Q9T5o6GX62o/o+5gyIYKJaJkE5dmXBnee
         MCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nSiAU05tdsBcdotQGowaH1I7zBOyLBN7vECCGjJR/dU=;
        b=oAJuxnpd/Pp97/JCwhPQNIjTX0VSQdeuUTcBpyjJLBte23Cyanpv6Pfqxw57z4yQbU
         04qBZxv1M1k5eCNroyPJdYQ88olW6Fxsul4nPu7ApbGAd9IfvOucyvyuSS2p55IfH56T
         aN32ZE5ctmFyYPiTTe4VLkjyHwNv1a/Tn4ep0/bV6DzpbIEIzWXBkbyCjkM3CqMi1m/X
         0YKEeqLw8U+Cdx6wxyfMyhfvDMlWAoo2cLJKch9edO9zwolHsH2JkfMJgV+aqkTtwoI2
         UatIaBO/rAnPYVhlHb+cvi/1y2uNOyeP/drv7L2XnT733gg390hZjNLPr8xXo8gj8G6c
         N0ig==
X-Gm-Message-State: AOAM532n/K+zofCmnHo02ROuNXkE/CZiUxXbW06w5aL4tYsV+DXxxLje
        PnkW9H5mUq71Gu0bcG/blfBoE69Ggb4OJW4OwRKVHhtZ
X-Google-Smtp-Source: ABdhPJygTlWUJiydLnZRkZAYdm51hzZMfvvmTVaW1Z93Ddpo5Hi7rfZfRZu+EBYc8vvTh1RFxzBffnlktKzJgzdDFqg=
X-Received: by 2002:a92:de10:: with SMTP id x16mr6780306ilm.6.1591854248170;
 Wed, 10 Jun 2020 22:44:08 -0700 (PDT)
MIME-Version: 1.0
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 11 Jun 2020 11:13:57 +0530
Message-ID: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
Subject: ARM: warning: relocation out of range on Exynos XU4 and U3+
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

I would like to report some warnings I observed on pre-compiled kernel
image (5.7.1-1-ARCH) from Archlinux.
Sometimes ethernet would not come up and get connected, so in order to
investigate.
I found below warnings, So I am sharing the logs at my end.

Are these warnings related to in-consistency in locking, How can we
Investigate more to fix this issue.

On XU4 - HCI

[alarm@archl-hc1d ~]$ uname -a
Linux archl-hc1d 5.7.1-1-ARCH #1 SMP PREEMPT Tue Jun 9 01:24:41 UTC
2020 armv7l GNU/Linux
[alarm@archl-hc1d ~]$ dmesg | grep relocation
[    6.188003] x_tables: section 4 reloc 2 sym 'mutex_lock':
relocation 28 out of range (0xbf0000bc -> 0xc101c154)
[    7.452559] sch_fq_codel: section 4 reloc 34 sym
'_raw_spin_lock_bh': relocation 28 out of range (0xbf000a44 ->
0xc101e9dc)
[    8.452434] uio: section 4 reloc 33 sym 'mutex_lock': relocation 28
out of range (0xbf009210 -> 0xc101c154)
[    8.576134] exynos5422_dmc: section 4 reloc 14 sym 'mutex_lock':
relocation 28 out of range (0xbf000188 -> 0xc101c154)
[    8.578422] exynos_rng: section 4 reloc 35 sym 'mutex_lock':
relocation 28 out of range (0xbf00a330 -> 0xc101c154)
[    8.585860] rng_core: section 4 reloc 15 sym
'mutex_lock_interruptible': relocation 28 out of range (0xbf0120b8 ->
0xc101c108)
[    8.818463] videobuf2_v4l2: section 4 reloc 62 sym 'mutex_lock':
relocation 29 out of range (0xbf0009b8 -> 0xc101c154)
[    8.938475] exynos_gsc: section 4 reloc 0 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf000014 ->
0xc101e370)
[    8.996208] exynos_gsc: section 4 reloc 0 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf00f014 ->
0xc101e370)
[    9.375951] r8152: section 4 reloc 4 sym 'mutex_lock': relocation
28 out of range (0xbf007130 -> 0xc101c154)

Share the console logs on Odroid XU4 HC1
[0] https://pastebin.com/5ZnEfyEM

On U3+

Linux archl-u3et 5.7.1-1-ARCH #1 SMP PREEMPT Tue Jun 9 01:24:41 UTC
2020 armv7l GNU/Linux
[alarm@archl-u3et ~]$ dmesg | grep relocation
[    5.324703] x_tables: section 4 reloc 2 sym 'mutex_lock':
relocation 28 out of range (0xbf0000bc -> 0xc101c154)
[    6.580612] sch_fq_codel: section 4 reloc 34 sym
'_raw_spin_lock_bh': relocation 28 out of range (0xbf000a44 ->
0xc101e9dc)
[    8.054852] uio: section 4 reloc 33 sym 'mutex_lock': relocation 28
out of range (0xbf009210 -> 0xc101c154)
[    8.168492] evdev: section 4 reloc 0 sym 'mutex_lock': relocation
28 out of range (0xbf018088 -> 0xc101c154)
[    8.435888] videobuf2_common: section 4 reloc 0 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf005130 ->
0xc101e370)
[    8.656151] videobuf2_common: section 4 reloc 0 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf005130 ->
0xc101e370)
[    8.671966] gpu_sched: section 4 reloc 0 sym '_raw_spin_lock':
relocation 28 out of range (0xbf016044 -> 0xc101e98c)
[    8.794059] exynos_bus: section 4 reloc 11 sym 'mutex_lock':
relocation 28 out of range (0xbf00514c -> 0xc101c154)
[    8.824699] exynos_bus: section 4 reloc 11 sym 'mutex_lock':
relocation 28 out of range (0xbf00d14c -> 0xc101c154)
[    8.824791] snd_timer: section 4 reloc 2 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf0150d0 ->
0xc101e370)
[    9.002896] exynos_bus: section 4 reloc 11 sym 'mutex_lock':
relocation 28 out of range (0xbf01914c -> 0xc101c154)
[    9.139199] s5p_csis: section 4 reloc 2 sym
'_raw_spin_lock_irqsave': relocation 28 out of range (0xbf019050 ->
0xc101e370)
[    9.417648] snd_soc_hdmi_codec: section 4 reloc 24 sym
'mutex_lock': relocation 28 out of range (0xbf0053e0 -> 0xc101c154)

Share the console log for Odroid U3+
[1] https://pastebin.com/sm8qCHdV

Best Regards
-Anand
