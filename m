From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 18:58:41 +0900
Message-ID: <001601cb21a8$d1cdd120$75697360$%kim@samsung.com>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com>
 <AANLkTin1M4CnLb1sj9mZiePjF4SvgRXySyJmT4eWpJlj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34449 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab0GLJ6q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 05:58:46 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5F008V8VPPQP90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Jul 2010 18:58:37 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5F00FDZVPPTM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Jul 2010 18:58:37 +0900 (KST)
In-reply-to: <AANLkTin1M4CnLb1sj9mZiePjF4SvgRXySyJmT4eWpJlj@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, ben-linux@fluff.org

Kyungmin Park wrote:

>=20
> Interesting.
>=20
> I got tested with
> #define MAX_PHYSMEM_BITS        31
> #define SECTION_SIZE_BITS       27
>=20
> # cat /proc/sys/vm/min_free_kbytes
> 1832
> # echo 1828 > /proc/sys/vm/min_free_kbytes
> # cat /proc/sys/vm/min_free_kbytes
> 1828
> # echo 1820 > /proc/sys/vm/min_free_kbytes
> # cat /proc/sys/vm/min_free_kbytes
> 1820
> # echo 1700 > /proc/sys/vm/min_free_kbytes
> # cat /proc/sys/vm/min_free_kbytes
> 1700
>=20
> No kernel panic.
>=20

Thanks for your test on the board.

But I need your environment for comparing.

Please let me know.
=46ollowing is my board environment.

=46rom boot-loader(u-boot).

SMDKC110 # bdinfo
arch_number =3D 0x00000891
env_t       =3D 0x00000000
boot_params =3D 0x20000100
DRAM bank   =3D 0x00000000
-> start    =3D 0x20000000
-> size     =3D 0x05000000
DRAM bank   =3D 0x00000001
-> start    =3D 0x40000000
-> size     =3D 0x10000000
DRAM bank   =3D 0x00000002
-> start    =3D 0x50000000
-> size     =3D 0x08000000

=46rom kernel boot message.

SMDKC110 # bootm c0008000
Boot with zImage

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.35-rc4-00008-g98c749c (kgene@starstone) (gcc version =
4.4.1
(Sourcery G++ Lite 2009q3-67) ) #1 PREEMPT Mon Jul 12 18:47:04 KST 2010
CPU: ARMv7 Processor [412fc082] revision 2 (ARMv7), cr=3D10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: SMDKC110
=2E..
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 80MB 256MB 128MB =3D 464MB total
Memory: 459616k/459616k available, 15520k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xff000000 - 0xffe00000   (  14 MB)
    vmalloc : 0xb8800000 - 0xe0000000   ( 632 MB)
    lowmem  : 0x80000000 - 0xb8000000   ( 896 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .init : 0x80008000 - 0x8001e000   (  88 kB)
      .text : 0x8001e000 - 0x801be000   (1664 kB)
      .data : 0x801ce000 - 0x801e6600   (  98 kB)
SLUB: Genslabs=3D9, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1=
, Nodes=3D1
Hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
=2E..

And SECTION_SIZE_BITS is 28, not 27.

> Thank you,
> Kyungmin Park
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
r to
do
> >> > with the size of memory, or the granularity of the size of memor=
y.
=A0By
> >> > way of illustration, it is perfectly legal to have a section siz=
e of
> >> > 256MB but only have 1MB in a section and this is perfectly legal=
=2E =A0So
> >> > sections do not have to be completely filled.
> >> >
> >> Actually, as you know, the hole's area of mem_map is freed from bo=
otmem
if
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
 file
in
> >> the proc filesystem if a section has a hole.
> >>
> >> While processing the change of min_free_kbytes in the kernel, page
> >> descriptors in a hole of an online section is accessed.
> >
> > As I said, following error happens.
> > It would be helpful to me if any opinions or comments.
> >
> > ---


(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
