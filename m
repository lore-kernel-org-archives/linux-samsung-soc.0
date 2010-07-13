From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Wed, 14 Jul 2010 08:59:06 +0900
Message-ID: <AANLkTim55BDz4_vWhTnDVj1EP42MxAMZzP2PR80j5fLN@mail.gmail.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092658.GB29885@csn.ul.ie>
	<20100713093815.GD20590@n2100.arm.linux.org.uk>
	<20100713095035.GE29885@csn.ul.ie>
	<20100713173744.GB30142@n2100.arm.linux.org.uk>
	<20100713203250.GA21600@csn.ul.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38428 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390Ab0GMX7H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jul 2010 19:59:07 -0400
Received: by iwn7 with SMTP id 7so6370836iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 16:59:06 -0700 (PDT)
In-Reply-To: <20100713203250.GA21600@csn.ul.ie>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mel Gorman <mel@csn.ul.ie>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi, Mel.

On Wed, Jul 14, 2010 at 5:32 AM, Mel Gorman <mel@csn.ul.ie> wrote:
> On Tue, Jul 13, 2010 at 06:37:44PM +0100, Russell King - ARM Linux wr=
ote:
>> On Tue, Jul 13, 2010 at 10:50:35AM +0100, Mel Gorman wrote:
>> > On Tue, Jul 13, 2010 at 10:38:15AM +0100, Russell King - ARM Linux=
 wrote:
>> > > On Tue, Jul 13, 2010 at 10:26:58AM +0100, Mel Gorman wrote:
>> > > > There is also an assumption that a section is fully populated =
or empty.
>> > >
>> > > That is absolutely absurd.
>> >
>> > Arguably, violating the memory model by punching unexpected holes =
in it
>> > is a also absurd.
>>
>> Well, it's something we've done since 1.2.xx, and actually it's a ne=
w
>> requirement that's evolved into the code that these page structs nee=
d
>> to be populated.
>
> It's not that new. It evolved over a long period of time probably sta=
rting
> from where the buddy bitmap was moved into the page->flags to save sp=
ace.
> Over time, this assumptions became more strict. Anyway, this is neith=
er here
> nor there so lets not fall down that hole.
>
>> So it's arguably a regression in the MM code which
>> hasn't been detected.
>>
>> > > So, I have a platform which has 256MB at
>> > > 64MB intervals in 4 chunks. I can fit 512kB to any slot.
>> >
>> > I'm afraid I'm not quite getting your example.
>> >
>> > If the granularity of the banks is 64MB and the alignment is 256MB=
, I
>> > don't see what hole you'd be punching anyway.
>>
>> I didn't say the alignment is 256MB. =A0I was referring to the *size=
* of
>> memory.
>>
>> > Not necessarily, just don't punch holes within section boundaries =
when using
>> > sparsemem.
>>
>> Err, you've just changed your story.
>>
>
> How so? I'd rather you didn't punch holes in the memmap allocated by =
sparsemem
> at all.
>
>> Let's take an example setup which is perfectly valid. =A0512kB at 0x=
10000000.
>> 512kB at 0x14000000. 32MB at 0x1c000000.
>>
>
> Ok, that is a clear example, thanks.
>
>> You're saying that MAX_PHYSMEM_BITS=3D29 SECTION_SIZE_BITS=3D26 is w=
rong.
>>
>
> Not wrong. It's fine as long as you're ok with some unnecessary memma=
p
> being allocated. There is wastage of memory but functionally it'll be
> fine with existing sparsemem and the assumptions it makes.
>
> Obviously you're not ok with this wastage or this discussion would no=
t even
> be happening and with SECTION_SIZE_BITS=3D26, there is quite a bit of=
 wastage.
>
>> So, what do you suggest would be the correct sparsemem settings for =
this?
>> MAX_PHYSMEM_BITS=3D29 SECTION_SIZE_BITS=3D19 maybe?
>>
>
> I haven't worked it out but I would think that wastes more memory tha=
n having
> the larger section with some memmap wasted so I'm not going to advoca=
te it
> even though it'd "work".
>
> I haven't researched this so apologies if it turns out to be stupid b=
ut
> I think the bit SECTION_MAP_LAST_BIT is actually unused and should be
> safe to use. Has the option being considered of using this bit to mea=
n
> "section has holes punched in it". If set, the architecture must prov=
ide
> an additional arch_holey_section_pfn_valid() that does additional che=
cking
> based on information sparsemem doesn't have? =A0This would avoid the =
worst of
> the performance issues of making pfn_valid() slower without increasin=
g the
> size of mem_section.

I think it's a very good idea.

We can know if any section has the hole with memory_present so can set
the bit in there.
Then, if pfn_valid find the section which has hole, it can call
arch_holey_section_pfn_valid.

But I think Kukjin case's best solution is to make section size 16M, no=
t 256M.
Regardless of this, Your idea is the direction we should proceed, I thi=
nk.

Thanks, Mel.

>
> --
> Mel Gorman
> Part-time Phd Student =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0Linux Technology Center
> University of Limerick =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 IBM Dublin Software Lab
>



--=20
Kind regards,
Minchan Kim
