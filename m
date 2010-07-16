From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Fri, 16 Jul 2010 09:07:59 +0900
Message-ID: <AANLkTilpGchoSYd6h_fnACkQCX_c5I3AH679fHbL5_im@mail.gmail.com>
References: <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092658.GB29885@csn.ul.ie>
	<20100713093815.GD20590@n2100.arm.linux.org.uk>
	<20100713095035.GE29885@csn.ul.ie>
	<20100713173744.GB30142@n2100.arm.linux.org.uk>
	<20100713203250.GA21600@csn.ul.ie>
	<AANLkTim55BDz4_vWhTnDVj1EP42MxAMZzP2PR80j5fLN@mail.gmail.com>
	<20100714084943.GA9115@n2100.arm.linux.org.uk>
	<AANLkTilrLJb97NkK4Q-Oan_ufXRdafIw7n6060mItaXj@mail.gmail.com>
	<20100714204952.GD18138@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:65374 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934037Ab0GPAIA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jul 2010 20:08:00 -0400
Received: by iwn7 with SMTP id 7so1514879iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Jul 2010 17:07:59 -0700 (PDT)
In-Reply-To: <20100714204952.GD18138@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mel Gorman <mel@csn.ul.ie>, Kukjin Kim <kgene.kim@samsung.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jul 15, 2010 at 5:49 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Wed, Jul 14, 2010 at 08:04:07PM +0900, Minchan Kim wrote:
>> On Wed, Jul 14, 2010 at 5:49 PM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > On Wed, Jul 14, 2010 at 08:59:06AM +0900, Minchan Kim wrote:
>> >> But I think Kukjin case's best solution is to make section size 1=
6M, not 256M.
>> >> Regardless of this, Your idea is the direction we should proceed,=
 I think.
>> >
>> > So what if someone decides to fit 8MB DRAMs to the board?
>> >
>>
>> Hmm. It might be a problem.
>> Should we consider all configuration?
>>
>> Then, in below cases ram size never can change?
>> How does it acked and merged?
>> I don't know below board can't configurable ram size. Just out of cu=
riosity.
>
> All of these, SECTION_SIZE_BITS refers to the _spacing_ of memory, no=
t
> the minimum size of DRAM which can ever be fitted.
>
> Reducing SECTION_SIZE_BITS is really not an option for some of these
> platforms - just look at where memory starts in physical space:
>
> arch/arm/mach-clps711x/include/mach/memory.h:#define PHYS_OFFSET UL(0=
xc0000000)
> arch/arm/mach-clps711x/include/mach/memory.h:#define SECTION_SIZE_BIT=
S =A024
> arch/arm/mach-lh7a40x/include/mach/memory.h:#define PHYS_OFFSET UL(0x=
c0000000)
> arch/arm/mach-lh7a40x/include/mach/memory.h:#define SECTION_SIZE_BITS=
 =A0 24
> arch/arm/mach-realview/include/mach/memory.h:#define PHYS_OFFSET UL(0=
x70000000)
> arch/arm/mach-realview/include/mach/memory.h:#define SECTION_SIZE_BIT=
S =A028
> arch/arm/mach-realview/include/mach/memory.h:#define PHYS_OFFSET UL(0=
x00000000)
> arch/arm/mach-rpc/include/mach/memory.h:#define PHYS_OFFSET UL(0x1000=
0000)
> arch/arm/mach-rpc/include/mach/memory.h:#define SECTION_SIZE_BITS =A0=
 =A0 =A0 26
> arch/arm/mach-s5pv210/include/mach/memory.h:#define PHYS_OFFSET UL(0x=
20000000)
> arch/arm/mach-s5pv210/include/mach/memory.h:#define SECTION_SIZE_BITS=
 =A0 28
> arch/arm/mach-sa1100/include/mach/memory.h:#define PHYS_OFFSET UL(0xc=
0000000)
> arch/arm/mach-sa1100/include/mach/memory.h:#define SECTION_SIZE_BITS =
=A0 =A027
>
> If physical memory starts at 3GB, with SECTION_SIZE_BITS set at 24,
> there's 256 sections already. =A0Reducing SECTION_SIZE_BITS to the mu=
ltiple
> of RAM size will increase the number of sections to many thousands.
> Clearly, sparsemem doesn't handle sparse memory very well, and is
> defficient.
>
> I don't know what the answer is to this; I'm totally fed up with bein=
g
> pushed into using things, and then later down the line being told tha=
t
> its all wrong and shouldn't be used like we are. =A0Maybe we should j=
ust
> delete these sub-architectures which use sparsemem and say to people
> that the kernel just doesn't support their memory layouts.
>
> <depressed>.
>

Sorry for late response.

Okay. I think Kame's recent solution is a good.
http://www.spinics.net/lists/linux-mm/msg06594.html
It doesn't need overriding pfn_valid, doesn't need more space.
And we can optimize it with overriding SECTION_MAP_LAST_BIT with
SECTION_MAP_HAS_HOLE  to avoid non-hole section overhead.
If we all agree, I will make the patch.

All agree?

--=20
Kind regards,
Minchan Kim
