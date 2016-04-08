From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
Subject: Re: [PATCH] mtd: nand: s3c2410: fix bug in
 s3c2410_nand_correct_data()
Date: Fri, 8 Apr 2016 13:37:22 +0800
Message-ID: <57074392.2030601@gmail.com>
References: <1460047697-72830-1-git-send-email-zengzhaoxiu@163.com>
 <20160408021817.274d4e59@bbrezillon> <57070E88.5020008@gmail.com>
 <20160408041802.5c47a4be@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:33404 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbcDHFh3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 01:37:29 -0400
In-Reply-To: <20160408041802.5c47a4be@bbrezillon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: zengzhaoxiu@163.com, kgene@kernel.org, k.kozlowski@samsung.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

=E5=9C=A8 2016=E5=B9=B404=E6=9C=8808=E6=97=A5 10:18, Boris Brezillon =E5=
=86=99=E9=81=93:
> On Fri, 8 Apr 2016 09:51:04 +0800
> Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com> wrote:
>
>>
>> =E5=9C=A8 2016=E5=B9=B404=E6=9C=8808=E6=97=A5 08:18, Boris Brezillon=
 =E5=86=99=E9=81=93:
>>> Hi Zeng,
>>>
>>> On Fri,  8 Apr 2016 00:48:17 +0800
>>> zengzhaoxiu@163.com wrote:
>>>
>>>> From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
>>>>
>>>> If there is only one bit difference in the ECC, the function shoul=
d return 1.
>>>> The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so the=
 function
>>>> actually returns -1.
>>>>
>>>> Here, we can use the simple expression "(diff0 & (diff0 - 1)) =3D=3D=
 0" to determine
>>>> whether the diff0 has only one 1-bit.
>>> Missing Signed-off-by here.
>>>
>>>> ---
>>>>    drivers/mtd/nand/s3c2410.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410=
=2Ec
>>>> index 9c9397b..c9698cf 100644
>>>> --- a/drivers/mtd/nand/s3c2410.c
>>>> +++ b/drivers/mtd/nand/s3c2410.c
>>>> @@ -542,7 +542,7 @@ static int s3c2410_nand_correct_data(struct mt=
d_info *mtd, u_char *dat,
>>>>    	diff0 |=3D (diff1 << 8);
>>>>    	diff0 |=3D (diff2 << 16);
>>>>   =20
>>>> -	if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
>>>> +	if ((diff0 & (diff0 - 1)) =3D=3D 0)
>>> Or just
>>>
>>> 	if (hweight_long((unsigned long)diff0) =3D=3D 1)
>>>
>>> which is doing exactly what the comment says.
>>>
>>> BTW, I don't understand why the current code is wrong? To me, it se=
ems
>>> it's correctly detecting the case where only a single bit is differ=
ent.
>>> What are you trying to fix exactly?
>>>
>>> Best Regards,
>>>
>>> Boris
>>>
>> For example, assuming diff0 is 1, then fls(diff0) is equal to 1, the=
n "~(1 << fls(diff0))" is equal to 0xfffffffd,
>> then the result of "(diff0 & ~(1 << fls(diff0)))" is 1 , not we expe=
cted 0.
>>
>> __fls(diff0) and "(fls(diff0) - 1)" are all right, but fls(diff0) is=
 wrong.
>>
> Indeed, I forgot that fls() was returning (position + 1). Anyway, I
> still think using hweight clarifies what you really want to test.
>

"(n & (n - 1))" is used in is_power_of_2() in incluse/linux/log2.h,
it's result is equal to "n & ~(1 << __ffs(n))".

"(diff & (diff - 1))" is simple and fast, although here is not performa=
nce critical.
To improve readability of this code, we should add a new function and u=
se it.

/*
  *  Determine whether some value has more than one 1-bits
  */

static inline __attribute__((const))
bool more_than_1_bit_set(unsigned long n)
{
     return (n & (n - 1)) !=3D 0;
}

OTOH, I found many determinations like "hweightN(n) > 1" distributed in=
 kernel,
these determinations are slower than "(n & (n - 1)) !=3D 0" on most CPU=
s.
We can use this new function instead.
