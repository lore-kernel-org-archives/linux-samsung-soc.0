From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 19:13:50 +0900
Message-ID: <001b01cb21aa$ef0e4d80$cd2ae880$%kim@samsung.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
	<AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Minchan Kim' <minchan.kim@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Minchan Kim wrote:
> =

> Hello.
> =

Hello :-)

> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Russell,
> >
> > Hi,
> >
> > Kukjin Kim wrote:
> >> Russell wrote:
> >> > So, memory starts at 0x20000000 and finishes at 0x25000000. =A0That's
> > fine.
> >> > That doesn't mean the section size is 16MB.
> >> >
> >> > As I've already said, the section size has _nothing_ what so ever to
do
> >> > with the size of memory, or the granularity of the size of memory.
=A0By
> >> > way of illustration, it is perfectly legal to have a section size of
> >> > 256MB but only have 1MB in a section and this is perfectly legal. =
=A0So
> >> > sections do not have to be completely filled.
> >> >
> >> Actually, as you know, the hole's area of mem_map is freed from bootmem
if
> > a
> >> section has a hole when initializing sparse memory.
> >>
> >> I identified that a section doesn't need to be a contiguous area of
> > physical
> >> memory when reading your comment with the fact that the mem_map of a
> > section
> >> can be smaller than the size of a section.
> >>
> >> I found, however, the kernel panics when modifying min_free_kbytes file
in
> >> the proc filesystem if a section has a hole.
> >>
> >> While processing the change of min_free_kbytes in the kernel, page
> >> descriptors in a hole of an online section is accessed.
> >
> > As I said, following error happens.
> > It would be helpful to me if any opinions or comments.
> >
> =

> Could you test below patch?
> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config.
> =

Yes, I did it, and no kernel panic happens :-)

Same test...
[root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
2736
[root@Samsung ~]# echo "2730" > /proc/sys/vm/min_free_kbytes
[root@Samsung ~]#
[root@Samsung ~]# cat /proc/sys/vm/min_free_kbytes
2730


> @@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(struct zone
> *zone)
>         for (pfn =3D start_pfn; pfn < end_pfn; pfn +=3D pageblock_nr_page=
s) {
>                 if (!pfn_valid(pfn))
>                         continue;
> +
>                 page =3D pfn_to_page(pfn);
> =

> +                /* Watch for unexpected holes punched in the memmap */
> +                if (!memmap_valid_within(pfn, page, zone))
> +                        continue;
> +
>                 /* Watch out for overlapping nodes */
>                 if (page_to_nid(page) !=3D zone_to_nid(zone))
>                         continue;
> =

> =

> =


...Could you please explain about this issue?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
