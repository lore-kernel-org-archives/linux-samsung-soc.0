From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: samsung: clean up references to outdated
 Kconfig symbols
Date: Sat, 7 Feb 2015 07:50:44 +0800
Message-ID: <20150206235044.GO31311@finisterre.sirena.org.uk>
References: <1421664067.9655.51.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1872107940140704945=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421664067.9655.51.camel@x220>
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


--===============1872107940140704945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="31zvzas5NXT9fief"
Content-Disposition: inline
Content-Length: 1335


--31zvzas5NXT9fief
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2015 at 11:41:07AM +0100, Paul Bolle wrote:
> A few series of ARM cleanups regarding S5PC100 and S5PV210 were included
> in v3.17. These series removed these five Kconfig symbols:
>     MACH_AQUILA
>     MACH_GONI
>     MACH_SMDKC100
>     MACH_SMDKC110
>     MACH_SMDKV210
>=20
> This series, done on top of next-20150119, removes the remaining

If you are posting a patch series please ensure that all the patches in
the series are threaded in reply to the cover letter (or first patch if
there isn't one) so that mail clients can see to display them as a
series.

--31zvzas5NXT9fief
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU1VNTAAoJECTWi3JdVIfQAtoH/joPAnxlEA4teq3gF2BizF80
LecNeHYR6fwtEy1r6RGDPJJV4QWwZLhkEhaIwfuTg1p7iP5NZ2ivLy3oxHNKBAZM
1JjtCBHMMz/ncNllJrOj/hktbAe1NVwj7K+0xBReVNqhjRFxrxzuL+gryuoJCuYS
ESsG7vVtAEYLOzlnPnZTqyKc7v8vriDfh3R3nHxoepKMmFxtQSD9o8edWiudE5+B
qA6d1/O5xRl8WsQGsJQTb5GucGVciitoglC/jSBrUI/QlRqZkEHFWzjmsetbKTF3
1C6JnHwLR8VYrlUOT7+HL1TXfZ3Huq40vS6JQ0nlZO3jUA/vycfJ/jgx2Y+qBXA=
=Tuji
-----END PGP SIGNATURE-----

--31zvzas5NXT9fief--


--===============1872107940140704945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1872107940140704945==--
