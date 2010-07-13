From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Tue, 13 Jul 2010 10:53:24 +0900
Message-ID: <20100713105324.07f2f97b.kamezawa.hiroyu@jp.fujitsu.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
	<001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
	<AANLkTinkujX3VbL0sXjjghovr8eX9Os0huw3OTBut2UP@mail.gmail.com>
	<20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:44599 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab0GMB6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 21:58:08 -0400
Received: from m3.gw.fujitsu.co.jp ([10.0.50.73])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id o6D1w5iv019897
	for <linux-samsung-soc@vger.kernel.org> (envelope-from kamezawa.hiroyu@jp.fujitsu.com);
	Tue, 13 Jul 2010 10:58:05 +0900
Received: from smail (m3 [127.0.0.1])
	by outgoing.m3.gw.fujitsu.co.jp (Postfix) with ESMTP id 52A1645DE4F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 10:58:05 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (s3.gw.fujitsu.co.jp [10.0.50.93])
	by m3.gw.fujitsu.co.jp (Postfix) with ESMTP id 32A2345DE4D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 10:58:05 +0900 (JST)
Received: from s3.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id 1B7CB1DB803E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 10:58:05 +0900 (JST)
Received: from m105.s.css.fujitsu.com (m105.s.css.fujitsu.com [10.249.87.105])
	by s3.gw.fujitsu.co.jp (Postfix) with ESMTP id 7DB9A1DB8038
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jul 2010 10:58:01 +0900 (JST)
In-Reply-To: <20100713092522.6d9939ac.kamezawa.hiroyu@jp.fujitsu.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: Minchan Kim <minchan.kim@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mel Gorman <mel@csn.ul.ie>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

On Tue, 13 Jul 2010 09:25:22 +0900
KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com> wrote:

> On Mon, 12 Jul 2010 19:35:17 +0900
> Minchan Kim <minchan.kim@gmail.com> wrote:
>=20
> > Hi, Mel and Kame.
> >=20
> > On Mon, Jul 12, 2010 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com>=
 wrote:
> > > Minchan Kim wrote:
> > >>
> > >> Hello.
> > >>
> > > Hello :-)
> > >
> > >> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.c=
om> wrote:
> > >> > Russell,
> > >> >
> > >> > Hi,
> > >> >
> > >> > Kukjin Kim wrote:
> > >> >> Russell wrote:
> > >> >> > So, memory starts at 0x20000000 and finishes at 0x25000000.=
 =C2=A0That's
> > >> > fine.
> > >> >> > That doesn't mean the section size is 16MB.
> > >> >> >
> > >> >> > As I've already said, the section size has _nothing_ what s=
o ever to
> > > do
> > >> >> > with the size of memory, or the granularity of the size of =
memory.
> > > =C2=A0By
> > >> >> > way of illustration, it is perfectly legal to have a sectio=
n size of
> > >> >> > 256MB but only have 1MB in a section and this is perfectly =
legal. =C2=A0So
> > >> >> > sections do not have to be completely filled.
> > >> >> >
> > >> >> Actually, as you know, the hole's area of mem_map is freed fr=
om bootmem
> > > if
> > >> > a
> > >> >> section has a hole when initializing sparse memory.
> > >> >>
> > >> >> I identified that a section doesn't need to be a contiguous a=
rea of
> > >> > physical
> > >> >> memory when reading your comment with the fact that the mem_m=
ap of a
> > >> > section
> > >> >> can be smaller than the size of a section.
> > >> >>
> > >> >> I found, however, the kernel panics when modifying min_free_k=
bytes file
> > > in
> > >> >> the proc filesystem if a section has a hole.
> > >> >>
> > >> >> While processing the change of min_free_kbytes in the kernel,=
 page
> > >> >> descriptors in a hole of an online section is accessed.
> > >> >
> > >> > As I said, following error happens.
> > >> > It would be helpful to me if any opinions or comments.
> > >> >
> > >>
> > >> Could you test below patch?
> > >> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your confi=
g.
> > >>
> > > Yes, I did it, and no kernel panic happens :-)
> > >
> > > Same test...
> > > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> > > 2736
> > > [root@Samsung ~]# echo "2730" > /proc/sys/vm/min_free_kbytes
> > > [root@Samsung ~]#
> > > [root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
> > > 2730
> > >
> > >
> > >> @@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(st=
ruct zone
> > >> *zone)
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (pfn =3D start_pfn; pfn < end_pf=
n; pfn +=3D pageblock_nr_pages) {
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pfn=
_valid(pfn))
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;
> > >> +
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D=
 pfn_to_page(pfn);
> > >>
> > >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Watc=
h for unexpected holes punched in the memmap */
> > >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!me=
mmap_valid_within(pfn, page, zone))
> > >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0continue;
> > >> +
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Watch=
 out for overlapping nodes */
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page=
_to_nid(page) !=3D zone_to_nid(zone))
> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;
> > >>
> > >>
> > >>
> > >
> > > ...Could you please explain about this issue?
> >=20
> > The setup_zone_migrate_reserve doesn't check memmap hole. I think
> > compaction would have the  same problem, too. I don't know there is=
 a
> > problem in elsewhere.
> > Anyway, I think memmap_valid_within calling whenever walking whole =
pfn
> > range isn't a good solution. We already have pfn_valid. Could we ch=
eck
> > this in there?
> > For example, mem_section have a valid pfn range and then valid sect=
ion
> > can test it in pfn_valid.
> >=20
> > What do you think about it?
> >=20
>=20
> please map another "fake" page when you free memmap.
>=20
> For example, prepare a page filled with (1 << PG_reserved).
> and replace it with unnecessary memmap rather than freeing a page for=
 memmap.
>=20
> Then, you can find a PageReserved() page there. However it doesn't ha=
ve valid
> nid,zid,secitonID, I don't think it can cause trouble.
> But you may see some BUG_ON() hit. If so, I think ARM guys can add
>=20

yet another _very easy_ solution is, define pfn_valid() as following.

=3D=3D
static inline arm_pfn_valid(unsigned long pfn)
{
	struct page *page =3D pfn_to_page(pfn);
	char *end_of_page =3D (char *)(page + 1) - 1;
	char byte;

	if ((((unsigned long)page) && PAGE_MASK) =3D=3D
		(((unsigned long)end_of_page) & PAGE_MASK))
		return (__get_user(byte, page) =3D=3D 0);
	return (__get_user(byte, page) =3D=3D 0) && (__get_user(byte, __end_of=
_page)=3D=3D 0);=20
}
=3D=3D
And replace this with default pfn_valid() for SPARSEMEM.
(please see ia64_pfn_valid().)

I hope this is enough quick.....no ?
(we use get_user but the "page" will be accessed soon, anyway.)


Thanks,
-Kame
