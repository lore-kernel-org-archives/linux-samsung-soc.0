From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Wed, 07 Dec 2011 20:54:16 +0000
Message-ID: <4EDFD278.9090101@arm.com>
References: <4E8C5425.80303@arm.com> <1317892206-3600-1-git-send-email-javi.merino@arm.com> <CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com> <4EB7B79A.2020004@arm.com> <000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com> <4ED3B89E.7070903@arm.com> <000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com> <4ED4AB9A.3060807@arm.com> <CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com> <03f001ccb4b5$3441f5c0$9cc5e140$%kim@samsung.com> <4EDF3989.3060108@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:34352 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757098Ab1LGUy3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 15:54:29 -0500
In-Reply-To: <4EDF3989.3060108@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jassi Brar' <jaswinder.singh@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 07/12/11 10:01, Javi Merino wrote:
> On 07/12/11 07:52, Kukjin Kim wrote:
>> Jassi Brar wrote:
>>>
>>> On 29 November 2011 15:23, Javi Merino <javi.merino@arm.com> wrote:
>>>>>>>>> On Samsung's Exynos4 platform, while testing audio playback with
>>>>>> i2s
>>>>>>>>> interface, the above change causes the playback to freeze. The
>>>>>>>>> _thrd_active(thrd) call always returns '1' and hence _start(thrd)
>>>>>> is
>>>>>>>>> not getting called.
>>>>>>>>
>>>>>>>> If _thrd_active(thrd) returns '1', that means there is an active
>>>>>>>> transfer still running or, if it has finished, you haven't called
>>>>>>>> pl330_update() to acknowledge that.  pl330_update() calls _start()
>>>>>> as
>>>>>>>> soon as it can.
>>>>>>>>
>>>>>>>> drivers/dma/pl330.c registers the irq handler in pl330_probe(), so
>>>>>>>> when
>>>>>>>> the transaction finishes, pl330_update() should clear it and call
>>>>>>>> _start().  If there is any outstanding transaction, it should start
>>>>>>>> straight away. If there isn't, it would mark the channel as free,
>>>>>> so
>>>>>>>> _thrd_active() should return '0'.  If _thrd_active() is still '1',
>>>>>> then
>>>>>>>> something has gone wrong in the way.
>>>>>>>>
>>>>>>>> Does this shed some light?
>>>>>>>>
>>>>>>>
>>>>>>> Your patch makes the memcpy operation on dmatest.c and net DMA be
>>>>>> frozen too
>>>>>>> as well as Samsung audio playback.
>>>>>>
>>>>>> Is the IRQ correctly registered in drivers/dma/pl330.c:pl330_probe()?
>>>>>> Do you get interrupts when the transfer finish?
>>>>> Sure. IRQ works well.
>>>>
>>>> Ok, so can you check if pl330_update() is correctly marking the request
>>>> as free?  Do you know if there is another request in the queue when that
>>>> happens?
>>>>
>>>> Thomas, you said in a previous email that _thrd_active() always returned
>>>> '1'.  Was that after a request in req[0] finished?
>>>>  - If so, can you check that MARK_FREE was actually called for that
>>>>    request in pl330_update()?
>>>>  - If it was after a request in req[1] finished and there was a
>>>>    request already waiting in req[0], can you debug why _start()
>>>>    didn't activate it.
>>>>
>>> Javi, could you please check if you too get the memcpy failure with
>>> dmatest ?
>>
>> (Please adding me in this thread)
>>
>> Hi Javi,
>> How was going on the test? If any update, please let us know.
> 
> I'm currently very busy at work, I'll run it as soon as I can.

Ok, I think I've just reproduced it in my end with the kernel's dmatest
module.  After the first transaction it looks like the dma test wasn't
able to issue any more transactions.  I'll have a look at it tomorrow
and try to answer my own questions ;)

Cheers,
Javi
