From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: samsung: Remove PCM support for WM8580 on SMDK
Date: Sat, 7 Feb 2015 07:53:50 +0800
Message-ID: <20150206235350.GP31311@finisterre.sirena.org.uk>
References: <1421664127.9655.53.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2952655251902433716=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421664127.9655.53.camel@x220>
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


--===============2952655251902433716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vhqu5qQ3bjg0ZI9i"
Content-Disposition: inline


--Vhqu5qQ3bjg0ZI9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2015 at 11:42:07AM +0100, Paul Bolle wrote:
> Commit 28c8331d386a ("ARM: S5PV210: Remove support for board files")
> removed the Kconfig symbols MACH_SMDKC110 and MACH_SMDKV210. As a result
> the dependencies of SND_SOC_SMDK_WM8580_PCM can never be met. So remove
> the unbuildable "SoC PCM Audio support for WM8580 on SMDK".

This doesn't apply against current code.

--Vhqu5qQ3bjg0ZI9i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU1VQNAAoJECTWi3JdVIfQVzoH/jUgo8Rb7HITGhhUgBE3BBO0
QUX/zPnkScHhzQPV46045jIMWXEehgOmIyGOojBVze21YLnNf/wXUGHzOJ8FSGFA
QoZXxIRhRy1mYwKRO2lxhmyXMk15DD3VaTtGzx2gjE3sYZV2ucs8ib7L2DAAjGk+
PEnow/dzxobTvicL9FlB0OzM9VHVDZBBkn8/qWgwL8id0apg7czdCpwazAwN3Ccf
M5S88GLRoh67RIZ8QiQkroTGJ2De7cuRp8cDAms4uTSiQaeTfO91WOtJ78NT1ZfJ
y3hboGYKeSVpuJjHWDPjq5m2e7G/Lc8MqJyAfbdKSEg/LMdng4ej/CMFEEsByeA=
=XWeZ
-----END PGP SIGNATURE-----

--Vhqu5qQ3bjg0ZI9i--


--===============2952655251902433716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2952655251902433716==--
