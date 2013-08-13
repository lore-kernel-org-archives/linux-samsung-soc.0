From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 12/18] ARM: s3c64xx: Add support for DMA
 using generic amba-pl08x driver
Date: Tue, 13 Aug 2013 21:35:36 +0100
Message-ID: <20130813203536.GI6427@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-13-git-send-email-tomasz.figa@gmail.com>
 <20130813175251.GC6427@sirena.org.uk> <4262768.VLqddFvVic@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6082986098341513195=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <4262768.VLqddFvVic@flatron>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6082986098341513195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Vr4v9a0xMzD0x07"
Content-Disposition: inline


--5Vr4v9a0xMzD0x07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 01:10:02PM -0700, Tomasz Figa wrote:
> On Tuesday 13 of August 2013 18:52:51 Mark Brown wrote:

> > On Sun, Aug 11, 2013 at 07:59:24PM +0200, Tomasz Figa wrote:
> > > +#define pl330_filter pl08x_filter_id

> > So, this is pretty fun and probably not going to play too nicely for
> > multiplatform kernels...

> Yes, this is really funny and only shows the brokenness of current channe=
l=20
> filtering mechanism used in DMA engine subsystem. Fortunately this is=20
> quite irrelevant to multiplatform kernels, because no users of it will be=
=20
> compiled in, since it's used only for legacy (non-DT) channel filtering.

Well, the thing here is more about the fact that the match function is
silently being hijacked - it should be possible to do this in the device
registrations.  I'd expect you could get a non-DT kernel which was
affected, but you'd probably have to try.

> Anyway, I would happily redesign and rewrite the DMA engine channel=20
> matching completely to make it much more sane, but I guess I would need a=
n=20
> ack from Vinod and Dan to do it.

I'd be really keen to get this code merged sooner rather than later for
ASoC development so if there's a way to do it separately to fixing the
filtering that'd be good.

--5Vr4v9a0xMzD0x07
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCpiVAAoJELSic+t+oim9MAAP/3HX1IK+aB+Ilsw39w42zb8n
320rmAVrtcykTm0pskBAiEOpRgDK+SnpJQdmw53is/zZBfnZTafcz57Mp+ftfoLJ
w+J5AJ/E1DMVmeiaWETFouMnqLfaVDyyb89eTtSlUvWw6YvoEWgm69R5D4l3gNgW
XrHOWaDHMBb2CswKVGUCBlLhDDHxVpKgSYxEC2rZOISO89Q9FjfjdOi/BBNiMUqA
fXGRfJ+859bDtpsc2T4aJh3CHoW1swSVaUKxbt0HDa+NKDPi7woNBikdqPNhN60W
TJyIhM4Qn/a3PI6WIBdJwW553LIa8bMEEInGGzd92hlqVQ01S1ugmYQ78H0CqGHT
R0lcwc657i5vrN/eaGtt50mfVOm+S7nn7/9uWKpMLqAgKANRfCZMl4hcE0B8V8kO
5pVY1O3A3qcJP9+oMwTzP7BOIA3Vr8/U/V7t6ye2/yYWI5la+NWQGjHV7c4GfIAZ
u/iW1aCh7wS9WxNm5E48/XEeyWNPS+HS5oNW5rETEfs+bPZx9+aWjb6AqB5aJ9hb
yLE3cBMX2OX01P0nAuy9N1/jrXzXWslD7r0YDBANujujuoTjxCB7xGrs1tWNi2qZ
UHMiSmsA3SOVOrtRjQNVEeL8bKzSnZjBpUKqa7Cqdo8os4c4cV/yqAQDAucfTy5k
6o7Ac5WJvv4H3mzJnwzp
=0ass
-----END PGP SIGNATURE-----

--5Vr4v9a0xMzD0x07--

--===============6082986098341513195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6082986098341513195==--
