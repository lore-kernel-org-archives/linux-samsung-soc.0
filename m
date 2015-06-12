From: Thomas-Karl Pietrowski <thopiekar@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Fri, 12 Jun 2015 08:53:02 -0700 (PDT)
Message-ID: <11787514.t5ZmzSH1aL@home>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com> <557AFEC3.3050806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f195.google.com ([209.85.212.195]:34490 "EHLO
	mail-wi0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751002AbbFLPxE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 11:53:04 -0400
Received: by wivr20 with SMTP id r20so3240962wiv.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 08:53:03 -0700 (PDT)
In-Reply-To: <557AFEC3.3050806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@samsung.com>, linux-samsung-soc@vger.kernel.org

Am Freitag, 12. Juni 2015, 17:46:11 schrieb Mateusz Krawczuk:
> Could you send your config and log using gist.github.com, because
> pastebin.com is forbidden by company IT.
>=20
>=20
> Mateusz Krawczuk
> Samsung R&D Institute Poland
>=20
> W dniu 12.06.2015 o 15:53, Thomas Pietrowski pisze:
> > Hello again,
> >=20
> > first after fixing my booting problems I now get different warnings=
 after
> > boot. - config: http://pastebin.com/MHUu51pF
> > - log: http://pastebin.com/9YMgMmFL
> > - repo: arm-soc
> > I read the last days that you are still working on the clk drivers,=
 so
> > as these warnings appear to be related to that you might be interes=
ted
> > on them.
> >=20
> > Additionally my CPU fan it running at full RPM all the time. I chec=
ked
> > the temperature just to be sure and it says it's 20=B0C. Is this pr=
oblem
> > known or can I help debugging it?

Of course I can. Didn't know about this restriction.

-config: https://gist.github.com/thopiekar/440059953391ccadc324
-log: https://gist.github.com/thopiekar/061d12802a4346eb783f
