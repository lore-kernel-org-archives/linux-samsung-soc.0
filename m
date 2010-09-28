From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5PV210: Add Torbreck board support
Date: Tue, 28 Sep 2010 15:12:48 +0900
Message-ID: <AANLkTikOtyxq7GzO4m5YUQK=MOUD_OAQ4ZVKpNnQBt5x@mail.gmail.com>
References: <1285463130-14227-1-git-send-email-chlrbgh0@gmail.com>
	<AANLkTik5SkqjEz5Ymtg6RvwfrU0i8XzhPQq3Un7gMbP=@mail.gmail.com>
	<AANLkTik1YAd8W75DzrDmfhFYG-JE8__Tu4uq83RKsioC@mail.gmail.com>
	<004c01cb5ed1$bb44b890$31ce29b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:46117 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752904Ab0I1GMu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 02:12:50 -0400
Received: by wwj40 with SMTP id 40so58409wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2010 23:12:49 -0700 (PDT)
In-Reply-To: <004c01cb5ed1$bb44b890$31ce29b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?B?7LWc6rec7Zi4?= <chlrbgh0@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Hyunchul Ko <ghcstop@gmail.com>

On Tue, Sep 28, 2010 at 2:55 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> =EC=B5=9C=EA=B7=9C=ED=98=B8 wrote:
> Hi,
>
> Welcome to Linux mainline ;-)
> I have some comments about your patches.
>
> Firstly could you please use English character in the representing na=
me in e-mail client not Korean character :-)
> And make sure it's text type.
>
>>Hi,
>>Thank you for your interesting.
>>On Mon, Sep 27, 2010 at 11:58 AM, Kyungmin Park <kmpark@infradead.org=
> wrote:
>
> (snip)
>
>>> +#define TORBRECK_UFCON_DEFAULT (S3C2410_UFCON_FIFOMODE | =C2=A0 =C2=
=A0 =C2=A0 \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV210_UFCON_TXTRIG4 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5PV210_UFCON_RXTRIG4)
>>Any reason to use TRIG4? just use the full trigger e.g., 256.
>>
>>Okay, I'll fix it.
>>
> Hmm...Kyungmin, any reason to use full trigger here?
>
> It depends on board...so it doesn't matter TRIG4 or anything else if =
there is no problem on your board.
> It means the maximum value is not best condition...only depends on yo=
ur situation/condition.

So I ask ANY REASON to use TRIG4?
And my opinions,
=46irst. it's not true for all UARTs. it's only valid on UART0.
Second, "the maximum value is not best condition" then why Spec said
"increase the FIFO size for performance".

>
>>> +
>>> +static struct s3c2410_uartcfg torbreck_uartcfgs[] __initdata =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>>There's no code for flags, please remove it all.
>>
>>Okay, I'll remove it.
>>
> I think no need to modify it.
> Actually I said many times about this...
>
> And as Ben Dooks said in other patch, the format will be changed soon=
=2E

I always listen "will be changed" so until that time use the correct co=
de.
Don't add the meaningless codes.

Thank you,
Kyungmin Park
>
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 },
>>> + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 },
>>> + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 2,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 },
>>> + =C2=A0 =C2=A0 =C2=A0 [3] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hwport =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 3,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ucon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D TORBRECK_UCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ulcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_ULCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ufcon =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D TORBRECK_UFCON_DEFAULT,
>>> + =C2=A0 =C2=A0 =C2=A0 },
>>> +};
>>> +
>
> (snip)
>
>>> --
>>> 1.5.6.3
>>>
> If possible, please use later version git.
> It doesn't mean latest git is best...
> This is just private opinion. :-)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
