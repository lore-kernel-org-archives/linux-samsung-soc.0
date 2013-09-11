From: =?UTF-8?B?xYF1a2FzeiBDemVyd2nFhHNraQ==?= <l.czerwinski@samsung.com>
Subject: Re: [RFC PATCH 3/6] spi: spi-s3c64xx: Add coherent buffers for DMA
 transfers
Date: Wed, 11 Sep 2013 09:48:36 +0200
Message-ID: <52302054.8050600@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
 <20130909144509.GB29403@sirena.org.uk> <522F0141.1000905@samsung.com>
 <20130910120228.GF29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43423 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751514Ab3IKHsj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 03:48:39 -0400
In-reply-to: <20130910120228.GF29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org



On 09/10/2013 02:02 PM, Mark Brown wrote:
> On Tue, Sep 10, 2013 at 01:23:45PM +0200, =C5=81ukasz Czerwi=C5=84ski=
 wrote:
>> On 09/09/2013 04:45 PM, Mark Brown wrote:
>
>>> This seems like a very low limit to have, consider things like firm=
ware
>>> downloads for example.  It seems reasonable to have a preallocated =
small
>>> buffer but there should be some fallback for larger transfer sizes.
>
>> I have tested my modification with different buffer sizes with
>> S5C73M3 driver (355560 B upload). I obtained following upload times:
>
>> 16kB buffer:
>> 	- 83.972 ms
>> 	- 79.196 ms
>> 	- 79.432 ms
>> 128kB buffer:
>> 	- 74.449 ms
>> 	- 80.719 ms
>> 	- 75.599 ms
>
>> For 256kB I obtained similar results as in 128kB case. Normally
>> non-interrupted SPI transfer should take 56ms (50MHz). Performance
>> loss is approximately about 6% between 16kB and 128KB buffer. I my
>> opinion there are no need to use bigger buffers.
>
> You're missing the point here.  This requires the client driver to kn=
ow
> the maximum transfer size that the controller supports and split the
> transfer up for it.  This isn't something that the SPI API supports n=
ow
> and while it would be useful to add for controllers that are genuinel=
y
> limited in transfer size it doesn't seem sane to just randomly impose=
 a
> limit to make life easier for software.  Not all applications will be
> able to split their transfers up in the first place and it seems like
> the wrong place to put that knowledge.
>
> What I would expect to see the driver doing here is either allocating
> a larger buffer on demand or (probably more reliably given the need f=
or
> contiguous physical memory) transparently splitting larger transfers.
> A super smart implementation would overlap the copy of blocks with th=
e
> transfers of preceeding blocks, and there should be something we can =
do
> to avoid having to copy data that's already in suitable memory.
>
Thanks for your comments.
I will try implement transparently splitting larger transfer.

> Ideally this would all be factored out into the core based on limit
> information but that's probably not required immediately.  Though now=
 I
> write that I'm wondering how many other devices should be doing this =
but
> aren't.  The DMA mapping of transfer buffers doesn't seem terribly
> device specific...
>
>> I propose add extra module parameter which allows to change buffer s=
ize.
>
> No, module parameters are not sensible for modern code.  If you wante=
d
> runtime configuration a sysfs tunable would be better though I do thi=
nk
> that should be tuning optimisation, not a hard limit on the transfer
> size.
>
ok

Thanks
Lukasz
