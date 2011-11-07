From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Mon, 7 Nov 2011 16:33:33 +0530
Message-ID: <CAJuYYwRBjKaLxN0nKE+XZCrEXe5fwmUFKVV-9AkKExpzg_ogtQ@mail.gmail.com>
References: <4E8C5425.80303@arm.com>
	<1317892206-3600-1-git-send-email-javi.merino@arm.com>
	<CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
	<4EB7B79A.2020004@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:40224 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753588Ab1KGLDd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Nov 2011 06:03:33 -0500
Received: by ywf7 with SMTP id 7so5142028ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2011 03:03:33 -0800 (PST)
In-Reply-To: <4EB7B79A.2020004@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, Jassi Brar <jassi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 7 November 2011 16:18, Javi Merino <javi.merino@arm.com> wrote:
> On 05/11/11 19:05, Thomas Abraham wrote:
>> Hi Javi,
>>
>> On 6 October 2011 05:10, Javi Merino <javi.merino@arm.com> wrote:
>>> If two requests have been submitted and one of them is running, if =
you
>>> call pl330_chan_ctrl(ch_id, PL330_OP_START), there's a window of ti=
me
>>> between the spin_lock_irqsave() and the _state() check in which the
>>> running transaction may finish. =A0In that case, we don't receive t=
he
>>> interrupt (because they are disabled), but _start() sees that the D=
MA
>>> is stopped, so it starts it. =A0The problem is that it sends the
>>> transaction that has just finished again, because pl330_update()
>>> hasn't mark it as done yet.
>>>
>>> This patch fixes this race condition by not calling _start() if the
>>> DMA is already executing transactions. =A0When interrupts are reena=
bled,
>>> pl330_update() will call _start().
>>>
>>> Signed-off-by: Javi Merino <javi.merino@arm.com>
>>> Acked-by: Jassi Brar <jassi.brar@samsung.com>
>>> ---
>>> =A0arch/arm/common/pl330.c | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
>>> index 97912fa..7129cfb 100644
>>> --- a/arch/arm/common/pl330.c
>>> +++ b/arch/arm/common/pl330.c
>>> @@ -1546,7 +1546,7 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_c=
han_op op)
>>>
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Start the next */
>>> =A0 =A0 =A0 =A0case PL330_OP_START:
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!_start(thrd))
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!_thrd_active(thrd) && !_start(th=
rd))
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -EIO;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>>
>> On Samsung's Exynos4 platform, while testing audio playback with i2s
>> interface, the above change causes the playback to freeze. The
>> _thrd_active(thrd) call always returns '1' and hence _start(thrd) is
>> not getting called.
>
> If _thrd_active(thrd) returns '1', that means there is an active
> transfer still running or, if it has finished, you haven't called
> pl330_update() to acknowledge that. =A0pl330_update() calls _start() =
as
> soon as it can.
>
> drivers/dma/pl330.c registers the irq handler in pl330_probe(), so wh=
en
> the transaction finishes, pl330_update() should clear it and call
> _start(). =A0If there is any outstanding transaction, it should start
> straight away. If there isn't, it would mark the channel as free, so
> _thrd_active() should return '0'. =A0If _thrd_active() is still '1', =
then
> something has gone wrong in the way.
>
> Does this shed some light?

Thanks for the detailed explanation. I will check again on the lines
you have mentioned above. Also, the i2s audio playback on exynos had
been working prior to this change. So that might imply that
pl330_update was working as you have mentioned. Anyway, I will check
again.

Thanks,
Thomas.

>
> Cheers,
> Javi
>
>
