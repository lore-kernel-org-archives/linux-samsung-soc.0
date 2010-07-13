From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 09:25:22 +0900
Message-ID: <20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:54018 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753209Ab0GMAaN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 20:30:13 -0400
Received: from m5.gw.fujitsu.co.jp ([10.0.50.75])
	by fgwmail6.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id o6D0UBtW003020
	for <linux-samsung-soc@vger.kernel.org> (envelope-from kamezawa.hiroyu@jp.fujitsu.com);
	Tue, 13 Jul 2010 09:30:11 +0900
Received: from smail (m5 [127.0.0.1])
	by outgoing.m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 6C64145DE56
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 09:30:10 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (s5.gw.fujitsu.co.jp [10.0.50.95])
	by m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 40F6C45DE55
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 09:30:10 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id A0DE31DB805B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 09:30:09 +0900 (JST)
Received: from m107.s.css.fujitsu.com (m107.s.css.fujitsu.com [10.249.87.107])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id B680C1DB8061
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 09:30:08 +0900 (JST)
In-Reply-To: <AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Minchan Kim <minchan.kim@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

On Mon, 12 Jul 2010 19:35:17 +0900
Minchan Kim <minchan.kim@gmail.com> wrote:

> Hi, Mel and Kame.
>=20
> On Mon, Jul 12, 2010 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Minchan Kim wrote:
> >>
> >> Hello.
> >>
> > Hello :-)
> >
> >> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.com=
> wrote:
> >> > Russell,
> >> >
> >> > Hi,
> >> >
> >> > Kukjin Kim wrote:
> >> >> Russell wrote:
> >> >> > So, memory starts at 0x20000000 and finishes at 0x25000000. =C2=
=A0That's
> >> > fine.
> >> >> > That doesn't mean the section size is 16MB.
> >> >> >
> >> >> > As I've already said, the section size has _nothing_ what so =
ever to
> > do
> >> >> > with the size of memory, or the granularity of the size of me=
mory.
> > =C2=A0By
> >> >> > way of illustration, it is perfectly legal to have a section =
size of
> >> >> > 256MB but only have 1MB in a section and this is perfectly le=
gal. =C2=A0So
> >> >> > sections do not have to be completely filled.
> >> >> >
> >> >> Actually, as you know, the hole's area of mem_map is freed from=
 bootmem
> > if
> >> > a
> >> >> section has a hole when initializing sparse memory.
> >> >>
> >> >> I identified that a section doesn't need to be a contiguous are=
a of
> >> > physical
> >> >> memory when reading your comment with the fact that the mem_map=
 of a
> >> > section
> >> >> can be smaller than the size of a section.
> >> >>
> >> >> I found, however, the kernel panics when modifying min_free_kby=
tes file
> > in
> >> >> the proc filesystem if a section has a hole.
> >> >>
> >> >> While processing the change of min_free_kbytes in the kernel, p=
age
> >> >> descriptors in a hole of an online section is accessed.
> >> >
> >> > As I said, following error happens.
> >> > It would be helpful to me if any opinions or comments.
> >> >
> >>
> >> Could you test below patch?
> >> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config.
> >>
> > Yes, I did it, and no kernel panic happens :-)
> >
> > Same test...
> > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> > 2736
> > [root@Samsung ~]# echo "2730" > /proc/sys/vm/min_free_kbytes
> > [root@Samsung ~]#
> > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> > 2730
> >
> >
> >> @@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(stru=
ct zone
> >> *zone)
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (pfn =3D start_pfn; pfn < end_pfn;=
 pfn +=3D pageblock_nr_pages) {
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pfn_v=
alid(pfn))
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;
> >> +
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D p=
fn_to_page(pfn);
> >>
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Watch =
for unexpected holes punched in the memmap */
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!memm=
ap_valid_within(pfn, page, zone))
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;
> >> +
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Watch o=
ut for overlapping nodes */
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page_t=
o_nid(page) !=3D zone_to_nid(zone))
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;
> >>
> >>
> >>
> >
> > ...Could you please explain about this issue?
>=20
> The setup_zone_migrate_reserve doesn't check memmap hole. I think
> compaction would have the  same problem, too. I don't know there is a
> problem in elsewhere.
> Anyway, I think memmap_valid_within calling whenever walking whole pf=
n
> range isn't a good solution. We already have pfn_valid. Could we chec=
k
> this in there?
> For example, mem_section have a valid pfn range and then valid sectio=
n
> can test it in pfn_valid.
>=20
> What do you think about it?
>=20

please map another "fake" page when you free memmap.

=46or example, prepare a page filled with (1 << PG_reserved).
and replace it with unnecessary memmap rather than freeing a page for m=
emmap.

Then, you can find a PageReserved() page there. However it doesn't have=
 valid
nid,zid,secitonID, I don't think it can cause trouble.
But you may see some BUG_ON() hit. If so, I think ARM guys can add

#define PageHole(page) (PageReserved(page) && PageXXXXX(page))
for avoiding BUG_ON() hit. (and this will help to skip unnecessary
memmap_init_zone())

By this, you can finaly remove CONFIG_MEMMAP_HOLES_IN_ZONE, and makes A=
RM's
sparsemem much easier for maintainance.

section ID is not important as far as you call page_to_pfn().
You may able to add WARNING when page_to_pfn() is called against a HOLE=
 page.

You may feel above as a big work but I don't think it's very difficult =
at the
first thought.


Thanks,
-Kame
