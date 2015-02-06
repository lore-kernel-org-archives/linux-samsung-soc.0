From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: samsung: Remove goni or aquila with the WM8994
Date: Sat, 7 Feb 2015 07:55:13 +0800
Message-ID: <20150206235512.GS31311@finisterre.sirena.org.uk>
References: <1421664101.9655.52.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2373502731445690491=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421664101.9655.52.camel@x220>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Valentin Rothberg <valentinrothberg@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============2373502731445690491==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMM+kVNHGkMezEqK"
Content-Disposition: inline


--XMM+kVNHGkMezEqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2015 at 11:41:41AM +0100, Paul Bolle wrote:
> Commit 28c8331d386a ("ARM: S5PV210: Remove support for board files")
> removed the Kconfig symbols MACH_GONI and MACH_AQUILA. As a result the
> dependencies of SND_SOC_GONI_AQUILA_WM8994 can never be met. So remove
> the unbuildable "SoC I2S Audio support for AQUILA/GONI - WM8994".

Applied, thanks.

--XMM+kVNHGkMezEqK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU1VRgAAoJECTWi3JdVIfQ1+EIAIDl13cwehCh8CgH5twoBO7F
ty2O6w7GLzccDutmMnLbOKOkGWdoS0WIJDhUBSjrKuFxNb4kabziqXByFA0r5cdD
bdPZ8KMepGm489NOtUWnsgOv/Nlu8tg30IqYOy80zziyYwgjf0l+i2fKOcFdEnDi
6n3PHwNtZm9nOHwbGoVZiLKqrxz50pom0tJ8j4eGoe6u3kVxhzOOliiRfjhLaFMW
CC9nbZcvT2owMg8mmSKfJLD77rulzeGFTlrN8gFClR6MAJoMwXYssvZ9V5HP5ur/
z15ZTk75BBC9hApD/SxCaQZgsJDI82XDswoZCnhszlmF5BIebQd9Xdfu1rvXpqA=
=2Y8d
-----END PGP SIGNATURE-----

--XMM+kVNHGkMezEqK--


--===============2373502731445690491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2373502731445690491==--
