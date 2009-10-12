From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH] S3C: ide: Add Samsung S3C IDE controller driver
Date: Mon, 12 Oct 2009 17:41:45 +0900
Message-ID: <84c135f50910120141t1b83c228q7e73f69abca90afc@mail.gmail.com>
References: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
	 <1b68c6790910081759l4af67a26j20a88381258c3c87@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.216.179]:49385 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754780AbZJLImV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2009 04:42:21 -0400
Received: by pxi9 with SMTP id 9so8433702pxi.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Oct 2009 01:41:45 -0700 (PDT)
In-Reply-To: <1b68c6790910081759l4af67a26j20a88381258c3c87@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

On Fri, Oct 9, 2009 at 9:59 AM, jassi brar <jassisinghbrar@gmail.com> w=
rote:

>> +static void wait_for_host_ready(struct s3c_ide_device *ide_dev)
>> +{
>> + =A0 =A0 =A0 u32 count =3D 1000000;
>> + =A0 =A0 =A0 while (ide_readl(S3C_ATA_FIFO_STATUS) >> 28) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(count--)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&ide_dev->pdev=
->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "ide controller not re=
ady for next taskfile operation");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> +}
>
> =A0I think instead of using a magic number for loop counter, it will =
be
> better to use some timed wait using a counter as in
> http://www.spinics.net/lists/arm-kernel/msg73904.html

I will change this to timed wait as in your patch.

>> +static u8 s3c_ide_INB(ide_hwif_t *hwif, ulong reg)
>> +{
>> + =A0 =A0 =A0 struct s3c_ide_device *ide_dev =3D
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (struct s3c_ide_device=
 *)hwif->hwif_data;
>> + =A0 =A0 =A0 u8 temp;
>> +
>> + =A0 =A0 =A0 wait_for_host_ready(ide_dev);
>> + =A0 =A0 =A0 temp =3D __raw_readb(reg);
>> + =A0 =A0 =A0 wait_for_host_ready(ide_dev);
>> + =A0 =A0 =A0 temp =3D __raw_readb(ide_dev->regbase + S3C_ATA_PIO_RD=
ATA);
>> + =A0 =A0 =A0 return temp;
>> +}
>
> any namespace reason for the caps =A0_OUTB and _INB ?
>

I missed that. There was no namespace issue. I will change this to lowe=
rcase.

>> + =A0 =A0 =A0 if (ide_dev->irq < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "could not obtain =
irq number\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 check for valid irq shud be done immidiately =
after trying to get it
> and before acquiring any other resource

Ok. I will fix this.

>> +out:
>> + =A0 =A0 =A0 return ret;
>> +}
> Since you call 'goto out' upon some call failure, the label 'out' shu=
d
> =A0undo all the successful operations before hitting the failure.
> It shud rather be out1, out2 etc jumped at from various locations dur=
ing
> initialization.

I missed this. I will add the undo code here.

Thanks for reviewing the patch. Your comments were very helpful.

Thanks,
Thomas.
--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
