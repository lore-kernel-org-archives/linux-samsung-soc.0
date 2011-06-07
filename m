From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Wed, 8 Jun 2011 01:16:40 +0530
Message-ID: <BANLkTikLFCyzU3UApjjwfX0Vjujo9WAFZA@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
	<BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
	<20110607182923.GA28451@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33339 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046Ab1FGTql convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 15:46:41 -0400
Received: by bwz15 with SMTP id 15so53868bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 12:46:40 -0700 (PDT)
In-Reply-To: <20110607182923.GA28451@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, root <alim.akhtar@samsung.com>

On Tue, Jun 7, 2011 at 11:59 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
>> The discussion did take off a few months ago, but we didn't reach an=
ywhere.
>> Being able to queue request from the 'done' callback, the need of
>> circular buffer
>> API (possibly a free-running one too) and callbacks in irq-context, =
as
>> they happen,
>> were a few requirements for having fast peripherals with shallow fif=
o
>> work without underruns.
>
> I can see why you have these concerns; the problem is the slave DMA
> engine API was never properly documented.
>
> 1. The slave API does permit the done callback to submit new requests
> =C2=A0 already (and any DMA engine driver which doesn't allow that is=
 broken.)
>
> Note that slave APIs _should_ permit several requests to be queued up
> and as each finish, the next one should be started. =C2=A0In other wo=
rds,
> once DMA has started it should continue until there is no more work f=
or
> the DMA engine to perform.
>
> 2. Circular buffer support has been added - see device_prep_dma_cycli=
c().
>
> However, 2 is not really a requirement for audio - you can queue seve=
ral
> single slave transfers (one per period) initially, and then you get
> callbacks as each transfer completes. =C2=A0In the callback, you can =
submit
> an additional buffer, and continue doing so causing DMA to never end.
>
> I believe that this is a saner approach than the circular buffer supp=
ort,
> and its what I tried to put together for the AMBA PL041 AACI DMA (but
> unfortunately, ARMs platforms are totally broken when it comes to DMA=
=2E)
>
> This also removes the need for the callback to be in IRQ context.
>
> So I don't see that anything you've mentioned is a problem with the A=
PI
> as it stands today - there may be issues with the way the DMA engine
> driver has been implemented which cause it not to conform to what I'v=
e
> said above, but those are driver bugs and not a fault of the API.

Yes, after reading Vinod's mail, I did see that CYCLIC option has been =
added.
Though I am still not sure how effective would that be for fast
peripherals(please
have a look at my reply to Mark's post), when doing callbacks from
tasklets scheduled
from irq-handlers is the norm with dma drivers of generic api.
Playing regular audio is no problem, but playing pro quality over
SPDIF with active multimedia h/w, sometimes is for some devices.

Besides, people might have different work priorities atm. I don't
think anybody believes we can do without common APIs.

Btw, Samsung DMA API doesn't support the 'free-running' circular
buffer either. But that was my planned TODO while I was there and I
think someone is working on it(?)

IMHO Samsung SoC team (not his majesty Mr Kyungmin Park) are justified =
if they
are not so eager right now. Since I no more would have to spend
sleepless nights over
SPDIF underruns, I can side with what Kukjin Kim(Samsung maintainer)
decides, who has to live with the results.

Thanks,
Jassi
