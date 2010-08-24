From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/3] h1940: implement mmc_power function
Date: Tue, 24 Aug 2010 17:07:31 +0200
Message-ID: <201008241707.31629.marek.vasut@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <201008241641.57621.marek.vasut@gmail.com> <201008241756.11529.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50830 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507Ab0HXPIO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 11:08:14 -0400
Received: by bwz11 with SMTP id 11so4847598bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 08:08:13 -0700 (PDT)
In-Reply-To: <201008241756.11529.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

Dne =C3=9At 24. srpna 2010 16:56:06 Vasily Khoruzhick napsal(a):
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 17:41:57 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:
> > Dne =C3=9At 24. srpna 2010 16:21:01 Vasily Khoruzhick napsal(a):
> > > =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=
=BE=D1=82 24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 17:01:12 =D0=
=B0=D0=B2=D1=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:
> > > > pr_err() and don't probe the device for which you couldn't requ=
est
> > > > GPIO.
> > >=20
> > > Well, handling those errors in machine init functions doesn't mak=
e
> > > sense. PDA is not usable without basic hardware.
> >=20
> > You can use PDA without LCD for example (there are such people, tru=
st
> > me). So, this comment really isn't too valid. You can also use PDA
> > without MMC support, you still have onboard flash, etc. etc.
>=20
> But error handling here just increases code size, and gpio_request in=
 init
> function should always succeed. It means something's going really wro=
ng
> (kernel bug or misconfiguration) if gpio_request fails. Btw, Ben sugg=
ested
> to use WARN_ON in machine init, look through init functions of qt2410=
,
> n30, rx1950, vr1000, etc.

See my previous response. It'd increase code size, but if you mark that=
 code=20
__init, it'll be freed after that function finishes so it doesn't matte=
r.

If something wrong goes on, you can still debug it without for example =
MMC card=20
(though if you continued probing the MMC driver, it might cause additio=
nal=20
unwanted noise and make the debugging harder). That's the whole point.

Cheers
>=20
> Regards
> Vasily
