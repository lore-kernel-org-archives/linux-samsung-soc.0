From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Tue, 29 Nov 2011 16:07:47 +0530
Message-ID: <CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com>
References: <4E8C5425.80303@arm.com>
	<1317892206-3600-1-git-send-email-javi.merino@arm.com>
	<CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
	<4EB7B79A.2020004@arm.com>
	<000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
	<4ED3B89E.7070903@arm.com>
	<000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com>
	<4ED4AB9A.3060807@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:44866 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754555Ab1K2Khs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Nov 2011 05:37:48 -0500
Received: by vcbfk14 with SMTP id fk14so4462840vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Nov 2011 02:37:47 -0800 (PST)
In-Reply-To: <4ED4AB9A.3060807@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 29 November 2011 15:23, Javi Merino <javi.merino@arm.com> wrote:
>>>>>> On Samsung's Exynos4 platform, while testing audio playback with
>>> i2s
>>>>>> interface, the above change causes the playback to freeze. The
>>>>>> _thrd_active(thrd) call always returns '1' and hence _start(thrd=
)
>>> is
>>>>>> not getting called.
>>>>>
>>>>> If _thrd_active(thrd) returns '1', that means there is an active
>>>>> transfer still running or, if it has finished, you haven't called
>>>>> pl330_update() to acknowledge that. =A0pl330_update() calls _star=
t()
>>> as
>>>>> soon as it can.
>>>>>
>>>>> drivers/dma/pl330.c registers the irq handler in pl330_probe(), s=
o
>>>>> when
>>>>> the transaction finishes, pl330_update() should clear it and call
>>>>> _start(). =A0If there is any outstanding transaction, it should s=
tart
>>>>> straight away. If there isn't, it would mark the channel as free,
>>> so
>>>>> _thrd_active() should return '0'. =A0If _thrd_active() is still '=
1',
>>> then
>>>>> something has gone wrong in the way.
>>>>>
>>>>> Does this shed some light?
>>>>>
>>>>
>>>> Your patch makes the memcpy operation on dmatest.c and net DMA be
>>> frozen too
>>>> as well as Samsung audio playback.
>>>
>>> Is the IRQ correctly registered in drivers/dma/pl330.c:pl330_probe(=
)?
>>> Do you get interrupts when the transfer finish?
>> Sure. IRQ works well.
>
> Ok, so can you check if pl330_update() is correctly marking the reque=
st
> as free? =A0Do you know if there is another request in the queue when=
 that
> happens?
>
> Thomas, you said in a previous email that _thrd_active() always retur=
ned
> '1'. =A0Was that after a request in req[0] finished?
> =A0- If so, can you check that MARK_FREE was actually called for that
> =A0 =A0request in pl330_update()?
> =A0- If it was after a request in req[1] finished and there was a
> =A0 =A0request already waiting in req[0], can you debug why _start()
> =A0 =A0didn't activate it.
>
Javi, could you please check if you too get the memcpy failure with dma=
test ?
Thanks.
