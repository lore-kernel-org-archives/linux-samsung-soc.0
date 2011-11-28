From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Mon, 28 Nov 2011 16:36:46 +0000
Message-ID: <4ED3B89E.7070903@arm.com>
References: <4E8C5425.80303@arm.com> <1317892206-3600-1-git-send-email-javi.merino@arm.com> <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com> <4EB7B79A.2020004@arm.com> <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:57240 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531Ab1K1Qgw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Nov 2011 11:36:52 -0500
In-Reply-To: <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

On 28/11/11 08:23, Boojin Kim wrote:
> Javi Merino wrote:
> 
>>> On Samsung's Exynos4 platform, while testing audio playback with i2s
>>> interface, the above change causes the playback to freeze. The
>>> _thrd_active(thrd) call always returns '1' and hence _start(thrd) is
>>> not getting called.
>>
>> If _thrd_active(thrd) returns '1', that means there is an active
>> transfer still running or, if it has finished, you haven't called
>> pl330_update() to acknowledge that.  pl330_update() calls _start() as
>> soon as it can.
>>
>> drivers/dma/pl330.c registers the irq handler in pl330_probe(), so
>> when
>> the transaction finishes, pl330_update() should clear it and call
>> _start().  If there is any outstanding transaction, it should start
>> straight away. If there isn't, it would mark the channel as free, so
>> _thrd_active() should return '0'.  If _thrd_active() is still '1', then
>> something has gone wrong in the way.
>>
>> Does this shed some light?
>>
> 
> Your patch makes the memcpy operation on dmatest.c and net DMA be frozen too
> as well as Samsung audio playback.

Is the IRQ correctly registered in drivers/dma/pl330.c:pl330_probe()?
Do you get interrupts when the transfer finish?

The only way I can think of that
ee3f615819404a9438b2dd01b7a39f276d2737f2 can break break something is
that you aren't calling pl330_update() at all.

> With our patch, common DMA memcpy sequence may be changed.

Which one is "our patch"?  I'm sorry, I'm not subscribed to any of the
lists so I may have missed something.

Cheers,
Javi
