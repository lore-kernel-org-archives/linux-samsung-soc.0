From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: s3c2410: fix bug in
 s3c2410_nand_correct_data()
Date: Mon, 11 Apr 2016 09:49:01 +0200
Message-ID: <20160411094901.74e68f91@bbrezillon>
References: <1460047697-72830-1-git-send-email-zengzhaoxiu@163.com>
	<20160408021817.274d4e59@bbrezillon>
	<57070E88.5020008@gmail.com>
	<20160408041802.5c47a4be@bbrezillon>
	<57074392.2030601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53878 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750820AbcDKHtJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2016 03:49:09 -0400
In-Reply-To: <57074392.2030601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
Cc: zengzhaoxiu@163.com, kgene@kernel.org, k.kozlowski@samsung.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Zeng,

On Fri, 8 Apr 2016 13:37:22 +0800
Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com> wrote:

> =E5=9C=A8 2016=E5=B9=B404=E6=9C=8808=E6=97=A5 10:18, Boris Brezillon =
=E5=86=99=E9=81=93:
> > On Fri, 8 Apr 2016 09:51:04 +0800
> > Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com> wrote:
> >
> >>
> >> =E5=9C=A8 2016=E5=B9=B404=E6=9C=8808=E6=97=A5 08:18, Boris Brezill=
on =E5=86=99=E9=81=93:
> >>> Hi Zeng,
> >>>
> >>> On Fri,  8 Apr 2016 00:48:17 +0800
> >>> zengzhaoxiu@163.com wrote:
> >>>
> >>>> From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
> >>>>
> >>>> If there is only one bit difference in the ECC, the function sho=
uld return 1.
> >>>> The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so t=
he function
> >>>> actually returns -1.
> >>>>
> >>>> Here, we can use the simple expression "(diff0 & (diff0 - 1)) =3D=
=3D 0" to determine
> >>>> whether the diff0 has only one 1-bit.
> >>> Missing Signed-off-by here.
> >>>
> >>>> ---
> >>>>    drivers/mtd/nand/s3c2410.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c24=
10.c
> >>>> index 9c9397b..c9698cf 100644
> >>>> --- a/drivers/mtd/nand/s3c2410.c
> >>>> +++ b/drivers/mtd/nand/s3c2410.c
> >>>> @@ -542,7 +542,7 @@ static int s3c2410_nand_correct_data(struct =
mtd_info *mtd, u_char *dat,
> >>>>    	diff0 |=3D (diff1 << 8);
> >>>>    	diff0 |=3D (diff2 << 16);
> >>>>   =20
> >>>> -	if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
> >>>> +	if ((diff0 & (diff0 - 1)) =3D=3D 0)
> >>> Or just
> >>>
> >>> 	if (hweight_long((unsigned long)diff0) =3D=3D 1)
> >>>
> >>> which is doing exactly what the comment says.
> >>>
> >>> BTW, I don't understand why the current code is wrong? To me, it =
seems
> >>> it's correctly detecting the case where only a single bit is diff=
erent.
> >>> What are you trying to fix exactly?
> >>>
> >>> Best Regards,
> >>>
> >>> Boris
> >>>
> >> For example, assuming diff0 is 1, then fls(diff0) is equal to 1, t=
hen "~(1 << fls(diff0))" is equal to 0xfffffffd,
> >> then the result of "(diff0 & ~(1 << fls(diff0)))" is 1 , not we ex=
pected 0.
> >>
> >> __fls(diff0) and "(fls(diff0) - 1)" are all right, but fls(diff0) =
is wrong.
> >>
> > Indeed, I forgot that fls() was returning (position + 1). Anyway, I
> > still think using hweight clarifies what you really want to test.
> >
>=20
> "(n & (n - 1))" is used in is_power_of_2() in incluse/linux/log2.h,
> it's result is equal to "n & ~(1 << __ffs(n))".
>=20
> "(diff & (diff - 1))" is simple and fast, although here is not perfor=
mance critical.
> To improve readability of this code, we should add a new function and=
 use it.
>=20
> /*
>   *  Determine whether some value has more than one 1-bits
>   */
>=20
> static inline __attribute__((const))
> bool more_than_1_bit_set(unsigned long n)
> {
>      return (n & (n - 1)) !=3D 0;
> }
>=20
> OTOH, I found many determinations like "hweightN(n) > 1" distributed =
in kernel,
> these determinations are slower than "(n & (n - 1)) !=3D 0" on most C=
PUs.

Yes, probably, but it may be faster on a few CPUs :). Anyway, not sure
you should bother optimizing this now, especially since this test is in
the ECC correction path, and I doubt it makes any difference (detecting
and correcting errors is what takes most of the time here).

> We can use this new function instead.
>=20

In the end, I don't care that much which solution you'll choose, since
it's driver specific code. Pick whatever implementation you prefer and
resend the patch with your SoB.

Thanks,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
