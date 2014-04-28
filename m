From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Mon, 28 Apr 2014 12:57:45 +0100
Message-ID: <20140428115745.GZ21279@lee--X1>
References: <1398180298-2018-4-git-send-email-dianders@chromium.org>
 <20140422190754.GF12304@sirena.org.uk>
 <20140423105540.GJ21613@lee--X1>
 <CAD=FV=V0uWMGTt68CST5i30Xf4pTNMt50-D7XeRmtSdfbPwwLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:33656 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbaD1L5v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 07:57:51 -0400
Received: by mail-wg0-f52.google.com with SMTP id x12so739026wgg.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 04:57:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAD=FV=V0uWMGTt68CST5i30Xf4pTNMt50-D7XeRmtSdfbPwwLQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> >> > Nearly all of the registers in tps65090 combine control bits and
> >> > status bits.  Turn off caching of all registers except the selec=
t few
> >> > that can be cached.
> >>
> >> Lee, I don't mind if I apply this and send a pull request to you o=
r I
> >> pull a tag from you with this in - what's easiest for you?
> >
> > I'm happy to do it.
> >
> > Doug,
> >   Can you send the patch-set again with all of the *-bys and ensure
> >   I'm on TO or CC please?
>=20
> It looks as if you've already applied 1, 3, and 4.  I've sent up 2 an=
d
> 5 again with collected tags.
>=20
> https://patchwork.kernel.org/patch/4042761/
> https://patchwork.kernel.org/patch/4042751/

I think we have this sorted now. I sent a pull-request to Mark this
morning.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
