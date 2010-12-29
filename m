From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: S3C OTG udc driver isochronous support
Date: Wed, 29 Dec 2010 09:32:29 +0530
Message-ID: <AANLkTi=nKqX4VQug_rk3TiV2w=UW7ayoDFiHp37qDgyq@mail.gmail.com>
References: <AANLkTi=ssBu9FQp3svPBk3i3dPZTd-Dd03h9EyrO0waH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:57144 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab0L2ECb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Dec 2010 23:02:31 -0500
Received: by fxm20 with SMTP id 20so10206003fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2010 20:02:30 -0800 (PST)
In-Reply-To: <AANLkTi=ssBu9FQp3svPBk3i3dPZTd-Dd03h9EyrO0waH@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Sun, Dec 26, 2010 at 10:06 PM, Barry Song <21cnbao@gmail.com> wrote:
> Hi All,
> After checking the S3C OTG udc drivers in drivers/usb/gadget, i didn'=
t
> find it can support isochronous endpoint. According to datasheet of
> S3C6410, EPtype field of DIEPCTLn and DOEPCTLn is read-only. Current
> S3C OTG udc driver list ep0~ep9, which are control endpoint and
> bulk/int endpoint according to the source codes:

Iso transfer type is not yet supported in the s3c otg driver. But the
EPtype field can be programmed as bulk, interrupt or iso endpoint. Iso
transfers have been used on 6410 but that support is not yet posted.

> static struct s3c_udc memory =3D {
> =A0 =A0 =A0 =A0.usb_address =3D 0,
>
> =A0 =A0 =A0 =A0.gadget =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ops =3D &s3c_udc_ops,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ep0 =3D &memory.ep[0].ep,

<snip>

The drivers/usb/gadget/s3c-hsotg.c file is the s3c usb otg gadget
driver. Are you referring to some other file.

> ep10~ep14 are not in the list. So is it possible ep10~ep14 are iso
> endpoints? I guess only samsung engineers can answer this question.
> And has anybody improved the udc driver to support ISO mode? Here i
> want to use this mode to support g_webcam gadget.

>
> Thanks
> Barry
>
<snip>
