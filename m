From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
Subject: Re: [PATCH] mtd: nand: s3c2410: fix bug in
 s3c2410_nand_correct_data()
Date: Fri, 8 Apr 2016 09:51:04 +0800
Message-ID: <57070E88.5020008@gmail.com>
References: <1460047697-72830-1-git-send-email-zengzhaoxiu@163.com>
 <20160408021817.274d4e59@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34393 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbcDHBvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2016 21:51:11 -0400
In-Reply-To: <20160408021817.274d4e59@bbrezillon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, zengzhaoxiu@163.com
Cc: kgene@kernel.org, k.kozlowski@samsung.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org



=E5=9C=A8 2016=E5=B9=B404=E6=9C=8808=E6=97=A5 08:18, Boris Brezillon =E5=
=86=99=E9=81=93:
> Hi Zeng,
>
> On Fri,  8 Apr 2016 00:48:17 +0800
> zengzhaoxiu@163.com wrote:
>
>> From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
>>
>> If there is only one bit difference in the ECC, the function should =
return 1.
>> The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so the f=
unction
>> actually returns -1.
>>
>> Here, we can use the simple expression "(diff0 & (diff0 - 1)) =3D=3D=
 0" to determine
>> whether the diff0 has only one 1-bit.
> Missing Signed-off-by here.
>
>> ---
>>   drivers/mtd/nand/s3c2410.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
>> index 9c9397b..c9698cf 100644
>> --- a/drivers/mtd/nand/s3c2410.c
>> +++ b/drivers/mtd/nand/s3c2410.c
>> @@ -542,7 +542,7 @@ static int s3c2410_nand_correct_data(struct mtd_=
info *mtd, u_char *dat,
>>   	diff0 |=3D (diff1 << 8);
>>   	diff0 |=3D (diff2 << 16);
>>  =20
>> -	if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
>> +	if ((diff0 & (diff0 - 1)) =3D=3D 0)
> Or just
>
> 	if (hweight_long((unsigned long)diff0) =3D=3D 1)
>
> which is doing exactly what the comment says.
>
> BTW, I don't understand why the current code is wrong? To me, it seem=
s
> it's correctly detecting the case where only a single bit is differen=
t.
> What are you trying to fix exactly?
>
> Best Regards,
>
> Boris
>

=46or example, assuming diff0 is 1, then fls(diff0) is equal to 1, then=
 "~(1 << fls(diff0))" is equal to 0xfffffffd,
then the result of "(diff0 & ~(1 << fls(diff0)))" is 1 , not we expecte=
d 0.

__fls(diff0) and "(fls(diff0) - 1)" are all right, but fls(diff0) is wr=
ong.
