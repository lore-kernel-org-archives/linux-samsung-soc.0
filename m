From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 06/14] ARM: SAMSUNG: Add common DMA operations
Date: Wed, 27 Jul 2011 01:24:19 +0530
Message-ID: <CABb+yY1ONj2YTyFi7281vCnCq_9B7DtXbE7-YnWUUPy6O0T54A@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-7-git-send-email-boojin.kim@samsung.com>
	<CABb+yY0nWLpdVGqTJPO2YwkGWiDw5tRjC2xn7Le0bO0ZNFHC_g@mail.gmail.com>
	<20110726080233.GN9653@n2100.arm.linux.org.uk>
	<CABb+yY2rQXxHGJuvhtJGgrCsoFZgsACHWUEV0L-kpqaDaCFAQA@mail.gmail.com>
	<20110726181441.GE1655@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:50484 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab1GZTyV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 15:54:21 -0400
Received: by eye22 with SMTP id 22so1093713eye.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2011 12:54:20 -0700 (PDT)
In-Reply-To: <20110726181441.GE1655@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 26, 2011 at 11:44 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:

>
> 1. Arrange for individual DMA engine drivers to provide a filter
> =C2=A0 function - eg, pl08x_filter_id() for pl08x channels.
>
> 2. Have the filter function check chan->device->dev->driver =3D=3D it=
s
> =C2=A0 own struct driver as the very first thing, and reject on failu=
re.
>
> 3. Have its own matching algorithm using whatever data is appropriate
> =C2=A0 for the DMA engine driver.
IMHO it should be possible to have client drivers not use platform spec=
ific
details while choosing a channel. Otherwise, they are not really 'gener=
ic'
'platform-independent' client drivers.


>> I hope we agree, clients (esp 'generic' ones of the future)
>> should not ask for channels from a particular dmac.
>> They should simply tell DMA API, what capabilities they expect
>> from the allocated channel - of whatever index on whichever dmac.
>> And the platform should have specified capabilities of a channel
>> while introducing it to the DMA API. =C2=A0 Yes, imho, DMA API shoul=
d
>> only work with a pool of channels and not dmacs - it shouldn't
>> matter from which dmac a channel comes.
>
> You're quite clearly confused. =C2=A0"DMA API" has not very much to d=
o with
> the subject we're discussing. =C2=A0The "DMA API" is the API for mapp=
ing and
> unmapping buffers for DMA. =C2=A0It has not much to do with the DMA e=
ngine
> API. =C2=A0So I'm not going to bother trying to decode what you said =
above
> until you start using the right terminology. =C2=A0I'm a stickler for=
 that,
> get used to it.
>
> No point talking about how round bananas are when you're actually
> discussing orange fruit.
Sorry, my carelessness.
I should have written DMAENGINE API, instead of DMA API.

If you want I can repost with s/DMA API/DMAENGINE API/

>
>> So when a client asks for a channel, the dmaengine would return
>> the first free channel that has just as much the requested capabilit=
y.
>
> No. =C2=A0For slave DMA, peripheral drivers normally need a specific
> channel on the DMA controller.
Of course they do.
And It is the responsibility of platform to encode such information as =
a
'capability' of the channel.  Capability to reach a particular peripher=
al, say.

> =C2=A0Peripheral drivers normally do not
> know which channel they need, or even which DMA controller they
> require. =C2=A0That information is specific to the platform and SoC.
=46or that very reason I proposed, say, if MMC client driver is probed
for 2nd instance
of MMC controller, it should ask for the following capabilities
    (MMC << TYPE_SHFT) | (2 << INST_SHFT)    //I don't show other
fields for simplicity

It is the job of _platform_ to set TYPE and INSTANCE fields to
'MMC' and 2 resp _only_ for the channel(s) that can reach its MMC_2 con=
troller.

That way, when the client 'generically' asks for DMA_MMC_2, it will be =
given
only one of those channels that can talk to second instance of MMC cont=
roller.


>> That is, the generic filter function would look equivalent of :-
>>
>> =C2=A0 =C2=A0 =C2=A0 return is_free(chan) && (cap_requested =3D=3D c=
ap_of(chan) & cap_requested)
>>
>>
>> Now it all boils down to defining the set of _practically_ possible =
capabilities
>> and a method to exchange them between the API, Client and DMAC drive=
rs.
>
> What are these capabilities?
I had mentioned the list below under 'Assuming'.  We may add more.

>
>> The above is the overall approach.
>>
>> The following is my idea of implementing it as of now, I am open to =
suggestions.
>>
>> Assuming :-
>> ***********
>> There are no more than 256 types of DMA'able devices
>> =C2=A0(MMC, USB, SPI etc) -- =C2=A0[8bits]
>>
>> A type of device never has more than 16 instances in a platform
>> =C2=A0(MMC-0, MMC-1, MMC-2 etc) -- =C2=A0[4bits]
>>
>> Mem->Mem, Mem->Dev, Dev->Mem, Dev->Dev capability in [4bits]
>
> No. =C2=A0You're being far too specific to your own DMA controller. =C2=
=A0Many
> DMA controllers (eg, PL08x) have a number of physical channels, all o=
f
> which can be programmed for M2M, M2P, P2M and P2P. =C2=A0There is not=
hing
> in the design which restricts what a channel can do.
I am not being specific, at least not on this point. Btw, I have worked=
 on pl080
as well and I have tried to be not specific to not only pl330 but also =
pl080.

If you notice I have assigned 4bits to the field. Each of the 4 bits ca=
n be set
independently.
So, a capable pl08x channel can set all 4 bits to indicate that it can
do all 4 types
 - M2M, M2P, P2M and P2P.


>> Max_Burst_Len for any channel is less than 64KB, in power of two [4b=
its]
>> Support programmable Max_Burst_Len(tunable in geometric steps of 2) =
=C2=A0[1bit]
>>
>> Max_RW_width/fifo_width is less than 128, in power of two -- [3bits]
>> Support programmable Max_RW_Width(tunable in geometric steps of 2) =C2=
=A0[1bit]
>>
>> Finally, No platform has more than 128 channels with identicial
>> capabilities [7bits]
>
> There is absolutely no way that this will work in reality - are you o=
n
> a different planet? =C2=A0As has already been described to you, MMCI =
can
> use one DMA channel, and programs it according to the DMA direction,
> and has in the past adjusted the burst size according to what's going
> on with the driver.
>
> With your model, it would have to claim N channels from the DMA
> engine for all possible different configurations.
I don't think so.
What I proposed is only a list of capabilities and method to _select_ a=
 suitable
channel in a platform independent way.

=46or example, if MMCI driver wants to be able to change directions, it=
 should
specify Mem->Dev and Dev->Mem capability while requesting a channel.
And use slave_config call to switch directions. (and yes we have to mod=
ify
slave_config call and maybe some other parts too)

=46or being able to change burst size, it could set some 'ignore' bit +
default value
to the 'fifo_width' field so that DMAENGINE ignores checking the fifo_w=
idth
capability and upon slave_config either set requested burst_size if sup=
ported
or return error if the requested burst size is not supported.
That is implementation detail.

Sincerely, I would to know other capabilities that are more flexible th=
an I have
assumed here or missed altogether.

I have not yet written any code. I just wanted to share my belief that
it is possible
to have client drivers truly independent of the platform they run on.
And by not using platform_data of DMA channels.

Probably you don't, but if you do want, I can send rudimentary implemen=
tation
of what I propose, in a few days.

Thanks
