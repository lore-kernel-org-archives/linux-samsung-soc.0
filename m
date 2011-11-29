From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: pl330: Fix a race condition
Date: Tue, 29 Nov 2011 12:41:55 +0900
Message-ID: <000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com>
References: <4E8C5425.80303@arm.com>
 <1317892206-3600-1-git-send-email-javi.merino@arm.com>
 <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
 <4EB7B79A.2020004@arm.com> <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
 <4ED3B89E.7070903@arm.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17047 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807Ab1K2Dl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Nov 2011 22:41:58 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVE00HL6KXVBI20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Nov 2011 12:41:56 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.120.72])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVE009N6KXVNB40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 29 Nov 2011 12:41:56 +0900 (KST)
In-reply-to: <4ED3B89E.7070903@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javi Merino' <javi.merino@arm.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, jassisinghbrar@gmail.com, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com

Javi Merino wrote:


> >
> >>> On Samsung's Exynos4 platform, while testing audio playback with
> i2s
> >>> interface, the above change causes the playback to freeze. The
> >>> _thrd_active(thrd) call always returns '1' and hence _start(thrd)
> is
> >>> not getting called.
> >>
> >> If _thrd_active(thrd) returns '1', that means there is an active
> >> transfer still running or, if it has finished, you haven't called
> >> pl330_update() to acknowledge that.  pl330_update() calls _start()
> as
> >> soon as it can.
> >>
> >> drivers/dma/pl330.c registers the irq handler in pl330_probe(), so
> >> when
> >> the transaction finishes, pl330_update() should clear it and call
> >> _start().  If there is any outstanding transaction, it should start
> >> straight away. If there isn't, it would mark the channel as free,
> so
> >> _thrd_active() should return '0'.  If _thrd_active() is still '1',
> then
> >> something has gone wrong in the way.
> >>
> >> Does this shed some light?
> >>
> >
> > Your patch makes the memcpy operation on dmatest.c and net DMA be
> frozen too
> > as well as Samsung audio playback.
>
> Is the IRQ correctly registered in drivers/dma/pl330.c:pl330_probe()?
> Do you get interrupts when the transfer finish?
Sure. IRQ works well.

>
> The only way I can think of that
> ee3f615819404a9438b2dd01b7a39f276d2737f2 can break break something is
> that you aren't calling pl330_update() at all.
>
> > With our patch, common DMA memcpy sequence may be changed.
>
> Which one is "our patch"?  I'm sorry, I'm not subscribed to any of the
> lists so I may have missed something.

Sorry to make you confused.
I mean.. "With your patch, common DMA memcpy sequence may be changed."
Your patch brings the side effect that freezes dma transmits.

>
> Cheers,
> Javi
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
