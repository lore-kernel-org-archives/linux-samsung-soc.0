From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] h1940: use gpiolib for latch access
Date: Tue, 24 Aug 2010 17:04:14 +0200
Message-ID: <201008241704.14566.marek.vasut@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <201008241640.21488.marek.vasut@gmail.com> <201008241750.43535.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44037 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507Ab0HXPE4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Aug 2010 11:04:56 -0400
Received: by bwz11 with SMTP id 11so4845114bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Aug 2010 08:04:55 -0700 (PDT)
In-Reply-To: <201008241750.43535.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org

Dne =C3=9At 24. srpna 2010 16:50:36 Vasily Khoruzhick napsal(a):
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 24 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 17:40:21 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Marek Vasut =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB:
> > Defining S3C2410_GPH_GPIONAME for each bit might be better then.
>=20
> Well, that requires massive refactoring of h1940 (and rx1950) support=
=2E And
> btw, that's common for s3c24xx-based machines to use generic s3c24xx =
gpio
> names, not machine specific.

I assume I see how it works now. Ok, please put a comment around it the=
n so=20
others will understand what it does.

Using machine-specific GPIO names might help readability btw. -- the ap=
proach=20
"everyone does it this way so I'll do it this way without thinking" is =
bad :)

Well, it's just my suggestion for improvement of the overall code quali=
ty. Ben,=20
what's your opinion?

Cheers
>=20
> Regards
> Vasily
