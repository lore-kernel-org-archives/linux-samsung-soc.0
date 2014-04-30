From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH Resend] ARM: EXYNOS: Map SYSRAM address through DT
Date: Wed, 30 Apr 2014 12:52:56 +0200
Message-ID: <6892427.lZl848UvyJ@wuerfel>
References: <1397649051-3288-1-git-send-email-sachin.kamat@linaro.org> <1493367.CDjMd4ghZP@phil> <CAK9yfHxBh3x7coj1FtLOrYvRv9viN_1tS3irL5+inarwuHZWYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:64202 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756331AbaD3Kxf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 06:53:35 -0400
In-Reply-To: <CAK9yfHxBh3x7coj1FtLOrYvRv9viN_1tS3irL5+inarwuHZWYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wednesday 30 April 2014 09:39:54 Sachin Kamat wrote:
> On 16 April 2014 22:55, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Mittwoch, 16. April 2014, 16:35:36 schrieb Arnd Bergmann:
> >> On Wednesday 16 April 2014 17:20:51 Sachin Kamat wrote:
> >> > Instead of hardcoding the SYSRAM details for each SoC,
> >> > pass this information through device tree (DT) and make
> >> > the code SoC agnostic.
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> > ---
> >> > Rebased on latest linux-next.
> >>
> >> Thanks for sending this again. I'd like Heiko to have a look
> >> and provide an Ack if he's happy with it.
> >>
> >> It seems similar to what he did with the SRAM for mach-rockchip,
> >> and if it is we should use the same binding that he introduced,
> >> which would be a minor variation of this.
> >
> > The sram binding is derived from the generic reserved-memory bindin=
gs to
> > enable the sram in general to be used generically through the sram =
driver,
> > while still retaining some areas for special purposes, like the smp=
-trampoline
> > in my case.
> >
> > From my reading of platsmp.c, it looks like offset+0x4 starts the s=
o called
> > boot-registesr, which get the smp-start-address written to.
> >
> > So I guess it all depends on what is contained in the rest of the s=
ysram. If
> > it is all covered with such special registers or other special uses=
, the code
> > below is fine. But if the most of the area is just general purpose =
sram, a
> > solution like on rockchip might be nicer - i.e. handling the sysram=
 via the
> > sram driver and declaring a reserved section for the boot registers=
=2E
>=20
> Thanks for your inputs. In our case, we use sram for secondary boot
> addresses but could not find any other general purpose use.
>=20
> > So, depending on the above:
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
> So I believe your ack applies to our case :). Thanks again.

My interpretation is the opposite. :)

=46or what I can tell, you use only part of the SRAM for this, and the =
rest
could be used for something else, you just haven't had the need for it.

If this is the case, you really should be using Heiko's binding instead=
,
to make it future-proof in case some other use for the SRAM comes up.

	Arnd
