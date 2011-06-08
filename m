From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Wed, 8 Jun 2011 08:21:08 +0530
Message-ID: <BANLkTimwAHdpJbLqqBwEXjqWwg75SciUVw@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
	<BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
	<20110607182923.GA28451@n2100.arm.linux.org.uk>
	<20110607184329.GA20849@sirena.org.uk>
	<BANLkTikXGpxpyF8kQORqswD5tqNEjtj3dA@mail.gmail.com>
	<20110607214151.GA7712@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44246 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752932Ab1FHCvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 22:51:10 -0400
Received: by bwz15 with SMTP id 15so60750bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 19:51:09 -0700 (PDT)
In-Reply-To: <20110607214151.GA7712@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kmpark@infradead.org>, Jassi Brar <jassi.brar@samsung.com>, kgene.kim@samsung.com, root <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jun 8, 2011 at 3:11 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Jun 08, 2011 at 12:31:42AM +0530, Jassi Brar wrote:
>> On Wed, Jun 8, 2011 at 12:13 AM, Mark Brown
>
>> > Circular buffers are nice from the point of view of allowing you to
>> > (providing the hardware supports it) totally disable the periodic audio
>> > interrupts and leave the system to run for very long times off the
>
>> This is what I called free-running circular buffer.
>> Besides power saving scenario, it is necessary for a fast peripheral
>> with shallow fifo.
>> The peripheral throws underrun errors, if the dma h/w doesn't support
>> LLI and cpu takes
>> a bit long loading-triggering the next transfer on DMA due to
>> irq-latency for some reason.
>
> That's fairly unusual, though - usually DMA controllers seem to support
> chaining requests before they support circular operation, at which point
> unless the hardware is badly misdone you can just chain another buffer,
> giving that buffer's worth of time for the CPU to respond.

While writing PL330 driver, I wasn't able to figure out a way to implement LLI.
Please have a look at the PL330 trm and suggest if we can implement it in a
generic way without considering them special requests.
I know pl080 supports LLI and it's fine.


>> > You can also do this with an circular chain of sequential buffers of
>> > course.
>
>> This is what is called Circular buffer in Samsung's DMA API.
>
> Which is a little bit unusual as it's basically a pure software
> construct rather than a hardware feature.
Yes it is. And I didn't say it suffice.
