From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 19:35:17 +0900
Message-ID: <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35785 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753979Ab0GLKfS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 06:35:18 -0400
Received: by iwn7 with SMTP id 7so4494819iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2010 03:35:18 -0700 (PDT)
In-Reply-To: <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

Hi, Mel and Kame.

On Mon, Jul 12, 2010 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Minchan Kim wrote:
>>
>> Hello.
>>
> Hello :-)
>
>> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > Russell,
>> >
>> > Hi,
>> >
>> > Kukjin Kim wrote:
>> >> Russell wrote:
>> >> > So, memory starts at 0x20000000 and finishes at 0x25000000. =A0=
That's
>> > fine.
>> >> > That doesn't mean the section size is 16MB.
>> >> >
>> >> > As I've already said, the section size has _nothing_ what so ev=
er to
> do
>> >> > with the size of memory, or the granularity of the size of memo=
ry.
> =A0By
>> >> > way of illustration, it is perfectly legal to have a section si=
ze of
>> >> > 256MB but only have 1MB in a section and this is perfectly lega=
l. =A0So
>> >> > sections do not have to be completely filled.
>> >> >
>> >> Actually, as you know, the hole's area of mem_map is freed from b=
ootmem
> if
>> > a
>> >> section has a hole when initializing sparse memory.
>> >>
>> >> I identified that a section doesn't need to be a contiguous area =
of
>> > physical
>> >> memory when reading your comment with the fact that the mem_map o=
f a
>> > section
>> >> can be smaller than the size of a section.
>> >>
>> >> I found, however, the kernel panics when modifying min_free_kbyte=
s file
> in
>> >> the proc filesystem if a section has a hole.
>> >>
>> >> While processing the change of min_free_kbytes in the kernel, pag=
e
>> >> descriptors in a hole of an online section is accessed.
>> >
>> > As I said, following error happens.
>> > It would be helpful to me if any opinions or comments.
>> >
>>
>> Could you test below patch?
>> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config.
>>
> Yes, I did it, and no kernel panic happens :-)
>
> Same test...
> [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> 2736
> [root@Samsung ~]# echo "2730" > /proc/sys/vm/min_free_kbytes
> [root@Samsung ~]#
> [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> 2730
>
>
>> @@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(struct=
 zone
>> *zone)
>> =A0 =A0 =A0 =A0 for (pfn =3D start_pfn; pfn < end_pfn; pfn +=3D page=
block_nr_pages) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pfn_valid(pfn))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D pfn_to_page(pfn);
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Watch for unexpected holes punch=
ed in the memmap */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!memmap_valid_within(pfn, page,=
 zone))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Watch out for overlapping nodes *=
/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (page_to_nid(page) !=3D zone_to_n=
id(zone))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>>
>>
>>
>
> ...Could you please explain about this issue?

The setup_zone_migrate_reserve doesn't check memmap hole. I think
compaction would have the  same problem, too. I don't know there is a
problem in elsewhere.
Anyway, I think memmap_valid_within calling whenever walking whole pfn
range isn't a good solution. We already have pfn_valid. Could we check
this in there?
=46or example, mem_section have a valid pfn range and then valid sectio=
n
can test it in pfn_valid.

What do you think about it?

P.S)
I know Mel is very busy to test to avoid writeback in direct reclaim.
I can wait on you. :)
Kukjin. Is this a urgent issue? If it isn't, please wait on our mm guys=
=2E :)

--=20
Kind regards,
Minchan Kim
