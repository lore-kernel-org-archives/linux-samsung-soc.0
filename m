From: Paul Osmialowski <p.osmialowsk@samsung.com>
Subject: Re: [RFC 2/3] regmap: Use the enhancement of i2c API to address
 circular dependency problem
Date: Mon, 19 Jan 2015 10:31:22 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1501191031080.13777@AMDC1262.digital.local>
References: <1421419194-1849-1-git-send-email-p.osmialowsk@samsung.com>
 <1421419194-1849-2-git-send-email-p.osmialowsk@samsung.com>
 <20150116162314.GB3856@sirena.org.uk>
 <alpine.DEB.2.10.1501161811280.21618@AMDC1262.digital.local>
 <20150116183635.GH3856@sirena.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38713 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbbASJbh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 04:31:37 -0500
In-reply-to: <20150116183635.GH3856@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, p.osmialowsk@samsung.com



On Fri, 16 Jan 2015, Mark Brown wrote:

> On Fri, Jan 16, 2015 at 06:36:14PM +0100, Paul Osmialowski wrote:
>> On Fri, 16 Jan 2015, Mark Brown wrote:
>
>>> I don't know what this means, sorry.  I'm also very worried about the
>>> fact that this is being discussed purely in terms of I2C - why would
>>> this not affect other buses?
>
>> I tried to open some gate for further extension to any bus that is used for
>> regmap communications. Currently it goes down to regmap-i2c.c since I
>> enhanced i2c API for this. Anyone who feels it is useful or saves oneself
>> from locking troubles can voluntarily adapt other regmap-i2c.* places (as
>> needed?).
>
>> My whole point is that I proposed a way to solve nasty deadlock which is
>> better to fix than just leave as it is. I got a feeling that situation I
>> adressed here may occur others too, so I proposed this extension that allows
>> future adaptations. I don't expect it to be accepted easily (i.e. I'm new
>> here and have mixed feelins about proposing changes that go so far),
>> therefore I prepared other solution for this particular deadlock that occurs
>> on this particular device.
>
> What I'm saying is that I want to understand this change from a point of
> view that isn't tied to I2C - at the regmap level what is this doing,

>From the regmap point of view, it allows its functions to have a chance to 
prepare transfer medium for (synchronous) transfer (no matter what bus 
handles it) before it actually start to happen (then unprepare it when 
it's done) and crucially before any lock is obtained in functions like 
regmap_write(), regmap_read() or regmap_update_bits.

Maybe adding a pair of callbacks (map->reg_write_sync_prepared(), 
map->reg_read_sync_prepared()) would make situation clearer.

> I2C is a bus that has some properties which you're saying needs some
> changes, what are those properties and those changes?

I'm not saying I2C as a bus requires changes. What I'm saying is that I2C 
API can be extended to allow more detailed control on what happens with 
the transfer.

>
>>>> +	void (*reg_unprepare_sync_io)(void *context);
>
>>> The first question here is why this only affects synchronous I/O or
>>> alternatively why these operations have _sync in the name if they aren't
>>> for synchronous I/O.
>
>> IMHO this whole idea is against asynchronous I/O.
>
> Can you be more specific please?  If something needs preparing it seems
> like it'd need preparing over an async transaction just as much as over
> a synchronous one.
>

Even with those preparation and unpreparation stages, this transfer is 
still synchronous. For example, it starts when regmap_read() starts and 
ends when regmap_read() ends. Nothing is queued or deferred. Namely, when 
max_gen_clk_unprepare() function calls regmap_update_bits() it expects 
that when regmap_update_bits() returned, no outstanding transfer are 
happening nor waiting to proceed. Everything must be completed before 
returning to max_gen_clk_unprepare().

>>>> +	if (bus) {
>>>> +		map->reg_prepare_sync_io = regmap_bus_prepare_sync_io;
>>>> +		map->reg_unprepare_sync_io = regmap_bus_unprepare_sync_io;
>>>> +	}
>
>>> Why are we using these indirections instead of assigning the operation
>>> directly?  They...
>
>> I followed the pattern used throughout this file.
>
> Not in this pattern where the caller needs to check too.
>

I don't persist on that. Apparently, you're the author of this file, 
though regmap_init() function was later expanded by other guys. They never 
assigned bus callback function pointers directly to map operation 
callbacks. It is possible to replace 'map->reg_prepare_sync_io = 
regmap_bus_prepare_sync_io' with 'map->reg_prepare_sync_io = 
map->bus->prepare_sync_io' - this will compile and this will work 
properly. But IMHO it wouldn't match with what the others did.
