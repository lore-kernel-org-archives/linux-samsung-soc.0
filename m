From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Wed, 8 Jun 2011 00:31:42 +0530
Message-ID: <BANLkTikXGpxpyF8kQORqswD5tqNEjtj3dA@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
	<BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
	<20110607182923.GA28451@n2100.arm.linux.org.uk>
	<20110607184329.GA20849@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40552 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755868Ab1FGTBo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 15:01:44 -0400
Received: by bwz15 with SMTP id 15so22306bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 12:01:43 -0700 (PDT)
In-Reply-To: <20110607184329.GA20849@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kmpark@infradead.org>, Jassi Brar <jassi.brar@samsung.com>, kgene.kim@samsung.com, root <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jun 8, 2011 at 12:13 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Jun 07, 2011 at 07:29:23PM +0100, Russell King - ARM Linux wr=
ote:
>
>> 2. Circular buffer support has been added - see device_prep_dma_cycl=
ic().
>
>> However, 2 is not really a requirement for audio - you can queue sev=
eral
>> single slave transfers (one per period) initially, and then you get
>> callbacks as each transfer completes. =C2=A0In the callback, you can=
 submit
>> an additional buffer, and continue doing so causing DMA to never end=
=2E
>
>> I believe that this is a saner approach than the circular buffer sup=
port,
>> and its what I tried to put together for the AMBA PL041 AACI DMA (bu=
t
>> unfortunately, ARMs platforms are totally broken when it comes to DM=
A.)
>
> Circular buffers are nice from the point of view of allowing you to
> (providing the hardware supports it) totally disable the periodic aud=
io
> interrupts and leave the system to run for very long times off the
> normal system timers. =C2=A0This gives a small but non-zero power ben=
efit
> providing the hardware gives you enough information about where the D=
MA
> is so you can find out if you need to mix in a notification, otherwis=
e
> you get obvious latency issues.

This is what I called free-running circular buffer.
Besides power saving scenario, it is necessary for a fast peripheral
with shallow fifo.
The peripheral throws underrun errors, if the dma h/w doesn't support
LLI and cpu takes
a bit long loading-triggering the next transfer on DMA due to
irq-latency for some reason.


> You can also do this with an circular chain of sequential buffers of
> course.
This is what is called Circular buffer in Samsung's DMA API.
