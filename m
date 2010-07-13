From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 11:05:26 +0900
Message-ID: <AANLkTimHNBUo30sp1azUcWQiDpADGyEW_N-dwU0nJy9u@mail.gmail.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:63514 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301Ab0GMCF2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 22:05:28 -0400
Received: by iwn7 with SMTP id 7so5303734iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2010 19:05:26 -0700 (PDT)
In-Reply-To: <20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

On Tue, Jul 13, 2010 at 9:25 AM, KAMEZAWA Hiroyuki
<kamezawa.hiroyu@jp.fujitsu.com> wrote:
> On Mon, 12 Jul 2010 19:35:17 +0900
> Minchan Kim <minchan.kim@gmail.com> wrote:
>
>> Hi, Mel and Kame.
>>
>> On Mon, Jul 12, 2010 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > Minchan Kim wrote:
>> >>
>> >> Hello.
>> >>
>> > Hello :-)
>> >
>> >> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.co=
m> wrote:
>> >> > Russell,
>> >> >
>> >> > Hi,
>> >> >
>> >> > Kukjin Kim wrote:
>> >> >> Russell wrote:
>> >> >> > So, memory starts at 0x20000000 and finishes at 0x25000000. =
=A0That's
>> >> > fine.
>> >> >> > That doesn't mean the section size is 16MB.
>> >> >> >
>> >> >> > As I've already said, the section size has _nothing_ what so=
 ever to
>> > do
>> >> >> > with the size of memory, or the granularity of the size of m=
emory.
>> > =A0By
>> >> >> > way of illustration, it is perfectly legal to have a section=
 size of
>> >> >> > 256MB but only have 1MB in a section and this is perfectly l=
egal. =A0So
>> >> >> > sections do not have to be completely filled.
>> >> >> >
>> >> >> Actually, as you know, the hole's area of mem_map is freed fro=
m bootmem
>> > if
>> >> > a
>> >> >> section has a hole when initializing sparse memory.
>> >> >>
>> >> >> I identified that a section doesn't need to be a contiguous ar=
ea of
>> >> > physical
>> >> >> memory when reading your comment with the fact that the mem_ma=
p of a
>> >> > section
>> >> >> can be smaller than the size of a section.
>> >> >>
>> >> >> I found, however, the kernel panics when modifying min_free_kb=
ytes file
>> > in
>> >> >> the proc filesystem if a section has a hole.
>> >> >>
>> >> >> While processing the change of min_free_kbytes in the kernel, =
page
>> >> >> descriptors in a hole of an online section is accessed.
>> >> >
>> >> > As I said, following error happens.
>> >> > It would be helpful to me if any opinions or comments.
>> >> >
>> >>
>> >> Could you test below patch?
>> >> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config=
=2E
>> >>
>> > Yes, I did it, and no kernel panic happens :-)
>> >
>> > Same test...
>> > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
>> > 2736
>> > [root@Samsung ~]# echo "2730" > /proc/sys/vm/min_free_kbytes
>> > [root@Samsung ~]#
>> > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
>> > 2730
>> >
>> >
>> >> @@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(str=
uct zone
>> >> *zone)
>> >> =A0 =A0 =A0 =A0 for (pfn =3D start_pfn; pfn < end_pfn; pfn +=3D p=
ageblock_nr_pages) {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pfn_valid(pfn))
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> >> +
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D pfn_to_page(pfn);
>> >>
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Watch for unexpected holes pu=
nched in the memmap */
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!memmap_valid_within(pfn, pa=
ge, zone))
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
>> >> +
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Watch out for overlapping node=
s */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (page_to_nid(page) !=3D zone_t=
o_nid(zone))
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> >>
>> >>
>> >>
>> >
>> > ...Could you please explain about this issue?
>>
>> The setup_zone_migrate_reserve doesn't check memmap hole. I think
>> compaction would have the =A0same problem, too. I don't know there i=
s a
>> problem in elsewhere.
>> Anyway, I think memmap_valid_within calling whenever walking whole p=
fn
>> range isn't a good solution. We already have pfn_valid. Could we che=
ck
>> this in there?
>> For example, mem_section have a valid pfn range and then valid secti=
on
>> can test it in pfn_valid.
>>
>> What do you think about it?
>>
>
> please map another "fake" page when you free memmap.
>
> For example, prepare a page filled with (1 << PG_reserved).
> and replace it with unnecessary memmap rather than freeing a page for=
 memmap.

Hmm. I don't got your point.
The problem is that we access struct page by pfn number not address.

You mean let's remain memmap on hole with changing PageReseved instead =
of free?

>
> Then, you can find a PageReserved() page there. However it doesn't ha=
ve valid
> nid,zid,secitonID, I don't think it can cause trouble.
> But you may see some BUG_ON() hit. If so, I think ARM guys can add
>
> #define PageHole(page) (PageReserved(page) && PageXXXXX(page))
> for avoiding BUG_ON() hit. (and this will help to skip unnecessary
> memmap_init_zone())

I think it's not a good idea to add new flag. If
Kame. Could you review my RFC patch which makes pfn_valid check more
tightly on sparsemem?

>
> By this, you can finaly remove CONFIG_MEMMAP_HOLES_IN_ZONE, and makes=
 ARM's
> sparsemem much easier for maintainance.

I think above problem isn't only ARM one. It can happen on any
sparsemem which do loose pfn_valid check.

>
> section ID is not important as far as you call page_to_pfn().
> You may able to add WARNING when page_to_pfn() is called against a HO=
LE page.

Yes. It's a good idea. We can add it optionally. But for it, we need
PageHole or mem_section bank range check. I like second like my
previous posting.


--=20
Kind regards,
Minchan Kim
