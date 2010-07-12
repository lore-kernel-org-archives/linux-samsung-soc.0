From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 11:45:41 +0100
Message-ID: <20100712104541.GA6577@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45676 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889Ab0GLKqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 06:46:01 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinTrt7VKuKvleiJj4lv2tWqCcDYHVXAQIHLA7bh@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Minchan Kim <minchan.kim@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jul 12, 2010 at 06:52:28PM +0900, Minchan Kim wrote:
> Hello.
>=20
> On Mon, Jul 12, 2010 at 5:32 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Russell,
> >
> > Hi,
> >
> > Kukjin Kim wrote:
> >> Russell wrote:
> >> > So, memory starts at 0x20000000 and finishes at 0x25000000. =A0T=
hat's
> > fine.
> >> > That doesn't mean the section size is 16MB.
> >> >
> >> > As I've already said, the section size has _nothing_ what so eve=
r to do
> >> > with the size of memory, or the granularity of the size of memor=
y. =A0By
> >> > way of illustration, it is perfectly legal to have a section siz=
e of
> >> > 256MB but only have 1MB in a section and this is perfectly legal=
=2E =A0So
> >> > sections do not have to be completely filled.
> >> >
> >> Actually, as you know, the hole's area of mem_map is freed from bo=
otmem if
> > a
> >> section has a hole when initializing sparse memory.
> >>
> >> I identified that a section doesn't need to be a contiguous area o=
f
> > physical
> >> memory when reading your comment with the fact that the mem_map of=
 a
> > section
> >> can be smaller than the size of a section.
> >>
> >> I found, however, the kernel panics when modifying min_free_kbytes=
 file in
> >> the proc filesystem if a section has a hole.
> >>
> >> While processing the change of min_free_kbytes in the kernel, page
> >> descriptors in a hole of an online section is accessed.
> >
> > As I said, following error happens.
> > It would be helpful to me if any opinions or comments.
> >
>=20
> Could you test below patch?
> Also, you should select ARCH_HAS_HOLES_MEMORYMODEL in your config.

But hang on.  Where are the hole(s)?

The DRAM setup is:
0x20000000-0x25000000, 0x40000000-0x50000000, 0x50000000-0x58000000

which with SECTION_SIZE_BITS set to 28 gives three sections of memory,
and each sparsemem section does not have a hole.

No zone should cross a sparsemem section boundary.

Moreover, our pfn_valid() now returns false for any and all invalid PFN=
s.
