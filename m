From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 17/18] spi: s3c64xx: Always select
 S3C64XX_PL080 when ARCH_S3C64XX is enabled
Date: Mon, 12 Aug 2013 11:07:28 +0100
Message-ID: <20130812100728.GL6427@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <1376243970-6489-18-git-send-email-tomasz.figa@gmail.com>
 <20130811191140.GI6427@sirena.org.uk> <2033369.1oHkX7kdGa@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8060266758988182096=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2033369.1oHkX7kdGa@flatron>
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


--===============8060266758988182096==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aQCvZzThlHwFiHtP"
Content-Disposition: inline


--aQCvZzThlHwFiHtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 01:03:19AM +0200, Tomasz Figa wrote:
> On Sunday 11 of August 2013 20:11:40 Mark Brown wrote:

> > Do we need the select here (or should we have other selects for the
> > Exynos SoCs)?

> The driver would build fine without this symbol selected, but since it=20
> relies on availability of DMA, it doesn't make too much sense to build it=
=20
> this way. This kind of selects makes kernel configuration more user=20
> friendly IMHO.

> Possibly adding appropriate selects (PL330) for s5p* and exynos could mak=
e=20
> sense.

Right.  On these SoCs it's probably worth doing it in the arch/arm code
rather than for every device using the controller though, it's the same
DMA controller for everything.

--aQCvZzThlHwFiHtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCLPdAAoJELSic+t+oim9FeoQAJj94+H4Az6oU73/hTDGjK9j
naYh5zgbvXVABht78k56GjvJQ8dkg9h9Y6EvxYVmfEbCbssRgSpsXTGj7qCEdubV
g5yhgZeNHkrPL9eBOBOzzc9hp7ziNZ0BgUsWwRkXmQa3vbXVxgdnAvj04ag2vCMJ
j2YHMP7BzuAKydPEFyjfaj7PP17VmFyUGYNyS/5FMMYMYF2QneRg89jgU2w+p3BG
Qfnypl0k4ox9ObisB5i2O/o7i8LCILvxzWtPod43xNFZIN5Kjc6nuUSWLlnng208
FFwV+PYljeNGsZsAoFcTj6oaFGVvMoTdu9TjJajRJZEwUPRPYDSeu2uifgExMGqb
8n7LIdx+O2X9/TyAVshl9ivQSUzC/IXyHPlW4mjkBODXO4wDDo8m4UtZj6Z29ga/
hzcQBNBaMbM37ug89TvBcA2EIqLbuFpBG/tQObQTqKQ8I/r/8VN3wAClxyKzpyqN
hZLUsfb+ck/qO6KyXl1q0ugAiF1c/odDdaQhPU1zDTYa6Np5qzspOH/6uMdFN0nU
NboZ7+OSJFSebDeGbhf2kDGVs5yOsafsKaB8LD3/MZndwaKaFtFRybkgcLJoFI4Q
LxbTeStEibhh9j7ghFsUj1rMMVSdQFs1WB8DMyAAoGhINlDDVPe0rqU/jXXtPXdM
hhFGMCDoz+vgCFvE8wgO
=QcK5
-----END PGP SIGNATURE-----

--aQCvZzThlHwFiHtP--

--===============8060266758988182096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8060266758988182096==--
