From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: restart: move SWRST based S3C platforms to machine_desc hook
Date: Mon, 19 Dec 2011 13:58:25 +0100
Message-ID: <201112191358.26307.heiko@sntech.de>
References: <03dc01ccbe45$80633d30$8129b790$%kim@samsung.com> <201112191325.56090.heiko@sntech.de> <03de01ccbe4b$a8a5bb00$f9f13100$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:35893 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211Ab1LSM6e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 07:58:34 -0500
In-Reply-To: <03de01ccbe4b$a8a5bb00$f9f13100$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, rmk+kernel@arm.linux.org.uk

Am Montag, 19. Dezember 2011, 13:42:24 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
> > S3C2412/S3C2416/S3C2443 use a special register to signal the reset =
to
> > the processor and used therefore the s3c24xx_reset_hook mechanism i=
n the
> > s3c24xx-specific arch reset.
> >=20
> > This patch introduces restart functions for these architectures,
> > moves the board files to them and removes the s3c24xx_reset_hook
> > infrastructure, as all users are gone.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > @Kgene: This is my first cleanup step, done before your s3c64xx mai=
l
> > arrived,
> > which transforms the 2412,2416 and 2443 arches which use the specia=
l
> > SWRST register to do the reset. Just if it helps :-)
>=20
> Heiko, thanks.
>=20
> I'm looking at S5P SoCs now and of course this helps. And if possible=
, let
> me do it with this.
>
> As a note, we need to implement local header file before using new re=
start
> hook and I'm thinking which one is better to us between all s3c24xx S=
oCs'
> common or each mach-s3c24xx's one.
=46or the three arches in the patch I put the function declaration into
s3c2412.h/s3c2416.h/s3c2443.h . They all use a SWRST register, but its
position and the value needed to be written to it differs for each SoC,=
 so
they need to be separate like in the patch.
So these three arches do not seem to need a new header and seem to be o=
k
with this patch.


The other two S3C24xx-arches (s3c2410 and s3c2440) all use arch_wdt_res=
et
to do the reset, so I thought about declaring a=20

void s3c24xx_default_restart(char mode, const char *cmd)
{
	if (mode =3D=3D 's') {
		soft_restart(0);
	}

	arch_wdt_reset();

	/* we'll take a jump through zero as a poor second */
	soft_restart(0);
}

for these.

I thought about putting it into plat-s3c24xx/cpu.c and its extern
declaration into plat-samsung/include/plat/cpu.h, but I'm not really su=
re
if this would be the correct location.


Heiko
