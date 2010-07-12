From: Minchan Kim <minchan.kim@gmail.com>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 18:52:28 +0900
Message-ID: <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:40929 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752153Ab0GLJw3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 05:52:29 -0400
Received: by iwn7 with SMTP id 7so4464504iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2010 02:52:28 -0700 (PDT)
In-Reply-To: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, ben-linux@fluff.org

Hello.

On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Russell,
>
> Hi,
>
> Kukjin Kim wrote:
>> Russell wrote:
>> > So, memory starts at 0x20000000 and finishes at 0x25000000. =A0Tha=
t's
> fine.
>> > That doesn't mean the section size is 16MB.
>> >
>> > As I've already said, the section size has _nothing_ what so ever =
to do
>> > with the size of memory, or the granularity of the size of memory.=
 =A0By
>> > way of illustration, it is perfectly legal to have a section size =
of
>> > 256MB but only have 1MB in a section and this is perfectly legal. =
=A0So
>> > sections do not have to be completely filled.
>> >
>> Actually, as you know, the hole's area of mem_map is freed from boot=
mem if
> a
>> section has a hole when initializing sparse memory.
>>
>> I identified that a section doesn't need to be a contiguous area of
> physical
>> memory when reading your comment with the fact that the mem_map of a
> section
>> can be smaller than the size of a section.
>>
>> I found, however, the kernel panics when modifying min_free_kbytes f=
ile in
>> the proc filesystem if a section has a hole.
>>
>> While processing the change of min_free_kbytes in the kernel, page
>> descriptors in a hole of an online section is accessed.
>
> As I said, following error happens.
> It would be helpful to me if any opinions or comments.
>

Could you test below patch?
Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config.

@@ -2824,8 +2825,13 @@ static void setup_zone_migrate_reserve(struct zo=
ne *zone)
        for (pfn =3D start_pfn; pfn < end_pfn; pfn +=3D pageblock_nr_pa=
ges) {
                if (!pfn_valid(pfn))
                        continue;
+
                page =3D pfn_to_page(pfn);

+                /* Watch for unexpected holes punched in the memmap */
+                if (!memmap_valid_within(pfn, page, zone))
+                        continue;
+
                /* Watch out for overlapping nodes */
                if (page_to_nid(page) !=3D zone_to_nid(zone))
                        continue;



--=20
Kind regards,
Minchan Kim
