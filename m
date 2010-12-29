From: Barry Song <21cnbao@gmail.com>
Subject: Re: S3C OTG udc driver isochronous support
Date: Wed, 29 Dec 2010 14:00:44 +0800
Message-ID: <AANLkTikqTh-w-94cAdEw5BA9+Z75H+XNKSoEU4RqP0Gt@mail.gmail.com>
References: <AANLkTi=ssBu9FQp3svPBk3i3dPZTd-Dd03h9EyrO0waH@mail.gmail.com> <AANLkTi=nKqX4VQug_rk3TiV2w=UW7ayoDFiHp37qDgyq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:47623 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab0L2GBF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Dec 2010 01:01:05 -0500
Received: by iwn9 with SMTP id 9so9858312iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2010 22:01:04 -0800 (PST)
In-Reply-To: <AANLkTi=nKqX4VQug_rk3TiV2w=UW7ayoDFiHp37qDgyq@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Thomas,
Thanks for your reply.

On Wed, Dec 29, 2010 at 12:02 PM, Thomas Abraham <thomas.ab@samsung.com=
> wrote:
> On Sun, Dec 26, 2010 at 10:06 PM, Barry Song <21cnbao@gmail.com> wrot=
e:
>> Hi All,
>> After checking the S3C OTG udc drivers in drivers/usb/gadget, i didn=
't
>> find it can support isochronous endpoint. According to datasheet of
>> S3C6410, EPtype field of DIEPCTLn and DOEPCTLn is read-only. Current
>> S3C OTG udc driver list ep0~ep9, which are control endpoint and
>> bulk/int endpoint according to the source codes:
>
> Iso transfer type is not yet supported in the s3c otg driver. But the
> EPtype field can be programmed as bulk, interrupt or iso endpoint. Is=
o
> transfers have been used on 6410 but that support is not yet posted.

datasheet says the field is read-only :(
can you post the iso mode codes then i can use ahead?

>
>> static struct s3c_udc memory =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.usb_address =3D 0,
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.gadget =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =
=3D &s3c_udc_ops,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ep0 =
=3D &memory.ep[0].ep,
>
> <snip>
>
> The drivers/usb/gadget/s3c-hsotg.c file is the s3c usb otg gadget
> driver. Are you referring to some other file.

What i am referring is a samsung 2.6.28 tree in git.kernel.org, i
think it has different otg gadget source codes with yours.

>
>> ep10~ep14 are not in the list. So is it possible ep10~ep14 are iso
>> endpoints? I guess only samsung engineers can answer this question.
>> And has anybody improved the udc driver to support ISO mode? Here i
>> want to use this mode to support g_webcam gadget.
>
>>
>> Thanks
>> Barry
>>
> <snip>
>
