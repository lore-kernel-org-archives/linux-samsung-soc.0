From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Mon, 07 Nov 2011 10:48:58 +0000
Message-ID: <4EB7B79A.2020004@arm.com>
References: <4E8C5425.80303@arm.com>	<1317892206-3600-1-git-send-email-javi.merino@arm.com> <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:46555 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753232Ab1KGKtF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Nov 2011 05:49:05 -0500
In-Reply-To: <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, Jassi Brar <jassi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 05/11/11 19:05, Thomas Abraham wrote:
> Hi Javi,
> 
> On 6 October 2011 05:10, Javi Merino <javi.merino@arm.com> wrote:
>> If two requests have been submitted and one of them is running, if you
>> call pl330_chan_ctrl(ch_id, PL330_OP_START), there's a window of time
>> between the spin_lock_irqsave() and the _state() check in which the
>> running transaction may finish.  In that case, we don't receive the
>> interrupt (because they are disabled), but _start() sees that the DMA
>> is stopped, so it starts it.  The problem is that it sends the
>> transaction that has just finished again, because pl330_update()
>> hasn't mark it as done yet.
>>
>> This patch fixes this race condition by not calling _start() if the
>> DMA is already executing transactions.  When interrupts are reenabled,
>> pl330_update() will call _start().
>>
>> Signed-off-by: Javi Merino <javi.merino@arm.com>
>> Acked-by: Jassi Brar <jassi.brar@samsung.com>
>> ---
>>  arch/arm/common/pl330.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
>> index 97912fa..7129cfb 100644
>> --- a/arch/arm/common/pl330.c
>> +++ b/arch/arm/common/pl330.c
>> @@ -1546,7 +1546,7 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_chan_op op)
>>
>>                /* Start the next */
>>        case PL330_OP_START:
>> -               if (!_start(thrd))
>> +               if (!_thrd_active(thrd) && !_start(thrd))
>>                        ret = -EIO;
>>                break;
> 
> On Samsung's Exynos4 platform, while testing audio playback with i2s
> interface, the above change causes the playback to freeze. The
> _thrd_active(thrd) call always returns '1' and hence _start(thrd) is
> not getting called.

If _thrd_active(thrd) returns '1', that means there is an active
transfer still running or, if it has finished, you haven't called
pl330_update() to acknowledge that.  pl330_update() calls _start() as
soon as it can.

drivers/dma/pl330.c registers the irq handler in pl330_probe(), so when
the transaction finishes, pl330_update() should clear it and call
_start().  If there is any outstanding transaction, it should start
straight away. If there isn't, it would mark the channel as free, so
_thrd_active() should return '0'.  If _thrd_active() is still '1', then
something has gone wrong in the way.

Does this shed some light?

Cheers,
Javi
