From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: pl330: Fix a race condition
Date: Mon, 28 Nov 2011 17:23:12 +0900
Message-ID: <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
References: <4E8C5425.80303@arm.com>
 <1317892206-3600-1-git-send-email-javi.merino@arm.com>
 <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
 <4EB7B79A.2020004@arm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17810 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070Ab1K1IXO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Nov 2011 03:23:14 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVD007RX39VFTT0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Nov 2011 17:23:13 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVD00BUT3AOBA60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 28 Nov 2011 17:23:12 +0900 (KST)
In-reply-to: <4EB7B79A.2020004@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javi Merino' <javi.merino@arm.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, 'Jassi Brar' <jassi.brar@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Javi Merino wrote:

> > On Samsung's Exynos4 platform, while testing audio playback with i2s
> > interface, the above change causes the playback to freeze. The
> > _thrd_active(thrd) call always returns '1' and hence _start(thrd) is
> > not getting called.
>
> If _thrd_active(thrd) returns '1', that means there is an active
> transfer still running or, if it has finished, you haven't called
> pl330_update() to acknowledge that.  pl330_update() calls _start() as
> soon as it can.
>
> drivers/dma/pl330.c registers the irq handler in pl330_probe(), so
> when
> the transaction finishes, pl330_update() should clear it and call
> _start().  If there is any outstanding transaction, it should start
> straight away. If there isn't, it would mark the channel as free, so
> _thrd_active() should return '0'.  If _thrd_active() is still '1', then
> something has gone wrong in the way.
>
> Does this shed some light?
>

Your patch makes the memcpy operation on dmatest.c and net DMA be frozen too
as well as Samsung audio playback.
With our patch, common DMA memcpy sequence may be changed.
I think..
it's needed to find the other way not to bring these side effects.

> Cheers,
> Javi
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-
> samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
