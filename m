From: Paul Osmialowski <p.osmialowsk@samsung.com>
Subject: Re: [RFC 2/3] regmap: Use the enhancement of i2c API to address
 circular dependency problem
Date: Fri, 16 Jan 2015 18:36:14 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1501161811280.21618@AMDC1262.digital.local>
References: <1421419194-1849-1-git-send-email-p.osmialowsk@samsung.com>
 <1421419194-1849-2-git-send-email-p.osmialowsk@samsung.com>
 <20150116162314.GB3856@sirena.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20150116162314.GB3856@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Paul Osmialowski <p.osmialowsk@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org



On Fri, 16 Jan 2015, Mark Brown wrote:

> On Fri, Jan 16, 2015 at 03:39:53PM +0100, Paul Osmialowski wrote:
>
>> This uses the enhancement of i2c API in order to address following problem
>> caused by circular lock dependency:
>
> Please don't just dump enormous backtraces into commit messages as
> explanations, explain in words what the problem you are trying to
> address is.  If the backtrace is longer than the commit message things
> probably aren't working well, and similarly if the first thing the
> reader sees is several screenfuls of backtrace that's not really aiding
> understanding.
>
> This is all particularly important with something like locking where a
> clear understanding of the rules and assumptions being made is very
> important to ensuring correctness, it's easy to just paper over a
> specific problem and miss a bigger problem or introduce new ones.

Got it. I couldn't estimate how much is too much, sorry for that.

>
>> Apparently regulator and clock try to acquire lock which is protecting the
>> same regmap. Communication over i2c requires clock to be started. Both things
>> require access to the same regmap in order to complete.
>> To solve this, i2c clock should be started before attempting operation on
>> regulator (which requires locked regmap).
>
> It sounds awfully like something is not doing the right thing with
> preparing clocks somewhere along the line but since there's no
> analysis it's hard to tell (I don't propose to spend time trawling
> backtraces for something I don't know).

I have alternative solution for this particular problem waiting for local 
review which splits regmaps so it is not shared between two things 
anymore and I guess it will gain acceptance easier. Thing is, this 
alternative solution solves problem for this particular chip (mfd 
max77686) while approach discussed here is a (merely) step into more 
general solution (when more complicated sharing of regmaps causes 
problem with multi-function devices).

>
> Please also use blank lines between paragraphs like all the other commit
> messages, it makes things easier to read.
>

Got it.

>> Exposing preparation and unpreparation stage of i2c transfer serves this
>> purpose.
>
> I don't know what this means, sorry.  I'm also very worried about the
> fact that this is being discussed purely in terms of I2C - why would
> this not affect other buses?
>

I tried to open some gate for further extension to any bus that is used 
for regmap communications. Currently it goes down to regmap-i2c.c since I 
enhanced i2c API for this. Anyone who feels it is useful or saves oneself 
from locking troubles can voluntarily adapt other regmap-i2c.* places (as 
needed?).
My whole point is that I proposed a way to solve nasty deadlock which is 
better to fix than just leave as it is. I got a feeling that situation I 
adressed here may occur others too, so I proposed this extension that 
allows future adaptations. I don't expect it to be accepted easily (i.e. 
I'm new here and have mixed feelins about proposing changes that go so 
far), therefore I prepared other solution for this particular deadlock 
that occurs on this particular device.

>> Note that this change does not require modifications in other places.
>>
>> Signed-off-by: Paul Osmialowski <p.osmialowsk@samsung.com>
>> ---
>>  drivers/base/regmap/internal.h   |   2 +
>>  drivers/base/regmap/regmap-i2c.c |  18 +++++++
>>  drivers/base/regmap/regmap.c     | 107 ++++++++++++++++++++++++++++++++++++++-
>>  include/linux/regmap.h           |   7 +++
>>  4 files changed, 133 insertions(+), 1 deletion(-)
>
> Modification may not be required in other places but this is an
> *enormous* change in the code which I can't really review.
>
>> +	int (*reg_prepare_sync_io)(void *context);
>> +	void (*reg_unprepare_sync_io)(void *context);
>
> The first question here is why this only affects synchronous I/O or
> alternatively why these operations have _sync in the name if they aren't
> for synchronous I/O.
>

IMHO this whole idea is against asynchronous I/O.

>> +	if (bus) {
>> +		map->reg_prepare_sync_io = regmap_bus_prepare_sync_io;
>> +		map->reg_unprepare_sync_io = regmap_bus_unprepare_sync_io;
>> +	}
>
> Why are we using these indirections instead of assigning the operation
> directly?  They...
>

I followed the pattern used throughout this file.

>> +static int regmap_bus_prepare_sync_io(void *context)
>> +{
>> +	struct regmap *map = context;
>> +
>> +	if (map->bus->prepare_sync_io)
>> +		return map->bus->prepare_sync_io(map->bus_context);
>> +
>> +	return 0;
>> +}
>
> ...seem to simply check for the operation which appears redundant
> especially given that the caller...
>

Indeed, this checking is mostly for ensuring that old behaviour is kept 
intact.

>> +static void regmap_unprepare_sync_io(struct regmap *map)
>> +{
>> +	void *context = _regmap_map_get_context(map);
>> +
>> +	if (map->reg_unprepare_sync_io)
>> +		map->reg_unprepare_sync_io(context);
>> +}
>
> ...does essentially the same check again on every call anyway.
>

I hope it doesn't hurt too much. Keeping existing pattern of the file and 
ensuring old behaviour is kept intact has its price :( It may seem 
reduntant, but I'd better hear what original authors of this file think 
about it.

>> @@ -1491,12 +1536,18 @@ int regmap_write(struct regmap *map, unsigned int reg, unsigned int val)
>>  	if (reg % map->reg_stride)
>>  		return -EINVAL;
>>
>> +	ret = regmap_prepare_sync_io(map);
>> +	if (ret)
>> +		return ret;
>> +
>>  	map->lock(map->lock_arg);
>
> So what are the rules for calling this operation and how are they
> different to those for locking the map?  It looks like they might be the
> same in which case it seems better to combine them rather than having
> to update every single caller and remember why they're always being
> worked with in tandem.
>

At first I thought about putting this preparation call into lock() 
callback. Then I realised that the same callback is used for async 
communication too where async is set true AFTER the lock is obtained.

Thanks for your comments. Hope for more.

