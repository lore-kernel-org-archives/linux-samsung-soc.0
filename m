From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Add Torbreck board support
Date: Tue, 28 Sep 2010 14:55:15 +0900
Message-ID: <004c01cb5ed1$bb44b890$31ce29b0$%kim@samsung.com>
References: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
 <AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
 <AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65385 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753040Ab0I1FzA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 01:55:00 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9G00FB80FNDK80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 14:54:59 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9G0051B0FMX9@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 14:54:59 +0900 (KST)
In-reply-to: <AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?J+y1nOq3nO2YuCc=?= <chlrbgh0@gmail.com>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Hyunchul Ko' <ghcstop@gmail.com>

=EC=B5=9C=EA=B7=9C=ED=98=B8 wrote:
Hi,=20

Welcome to Linux mainline ;-)
I have some comments about your patches.

=46irstly could you please use English character in the representing na=
me in e-mail client not Korean character :-)
And make sure it's text type.

>Hi,
>Thank you for your interesting.
>On Mon, Sep 27, 2010 at 11:58 AM, Kyungmin Park <kmpark@infradead.org>=
 wrote:

(snip)

>> +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE |       \
>> +                                S5PV210_UFCON_TXTRIG4 |        \
>> +                                S5PV210_UFCON_RXTRIG4)
>Any reason to use TRIG4? just use the full trigger e.g., 256.
>=20
>Okay, I'll fix it.
>=20
Hmm...Kyungmin, any reason to use full trigger here?

It depends on board...so it doesn't matter TRIG4 or anything else if th=
ere is no problem on your board.
It means the maximum value is not best condition...only depends on your=
 situation/condition.

>> +
>> +static struct s3c2410_uartcfg torbreck_uartcfgs[] __initdata =3D {
>> +       [0] =3D {
>> +               .hwport         =3D 0,
>> +               .flags          =3D 0,
>There's no code for flags, please remove it all.
>=20
>Okay, I'll remove it.
>=20
I think no need to modify it.
Actually I said many times about this...

And as Ben Dooks said in other patch, the format will be changed soon.

>> +               .ucon           =3D TORBRECK_UCON_DEFAULT,
>> +               .ulcon          =3D TORBRECK_ULCON_DEFAULT,
>> +               .ufcon          =3D TORBRECK_UFCON_DEFAULT,
>> +       },
>> +       [1] =3D {
>> +               .hwport         =3D 1,
>> +               .flags          =3D 0,
>> +               .ucon           =3D TORBRECK_UCON_DEFAULT,
>> +               .ulcon          =3D TORBRECK_ULCON_DEFAULT,
>> +               .ufcon          =3D TORBRECK_UFCON_DEFAULT,
>> +       },
>> +       [2] =3D {
>> +               .hwport         =3D 2,
>> +               .flags          =3D 0,
>> +               .ucon           =3D TORBRECK_UCON_DEFAULT,
>> +               .ulcon          =3D TORBRECK_ULCON_DEFAULT,
>> +               .ufcon          =3D TORBRECK_UFCON_DEFAULT,
>> +       },
>> +       [3] =3D {
>> +               .hwport         =3D 3,
>> +               .flags          =3D 0,
>> +               .ucon           =3D TORBRECK_UCON_DEFAULT,
>> +               .ulcon          =3D TORBRECK_ULCON_DEFAULT,
>> +               .ufcon          =3D TORBRECK_UFCON_DEFAULT,
>> +       },
>> +};
>> +

(snip)

>> --
>> 1.5.6.3
>>
If possible, please use later version git.
It doesn't mean latest git is best...
This is just private opinion. :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
