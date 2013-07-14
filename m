From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: remove references to non-DT
	SoCs
Date: Sun, 14 Jul 2013 13:45:38 +0100
Message-ID: <20130714124538.GA11538@sirena.org.uk>
References: <1373804812.1370.23.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6344258372033547532=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1373804812.1370.23.camel@x61.thuisdomein>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6344258372033547532==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 14, 2013 at 02:26:52PM +0200, Paul Bolle wrote:
> Commit 383ffda2fa ("ARM: EXYNOS: no more support non-DT for EXYNOS
> SoCs") removed the Kconfig symbols MACH_SMDKV310 and MACH_SMDKC210.
> Now remove the references to both of these symbols from the Kconfig
> entry for SND_SOC_SAMSUNG_SMDK_WM9713. They're not needed anymore.

Look at the code you are editing here:

> -       depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110 || MACH_SMDKV310 || MACH_SMDKC210)
> +       depends on SND_SOC_SAMSUNG && (MACH_SMDK6410 || MACH_SMDKC100 || MACH_SMDKV210 || MACH_SMDKC110)

Simply removing the dependencies is not going to give the clearly
intended effect here.  The dependency on the DT only machine needs to be
replaced with something, not just deleted, otherwise the driver can't be
enabled in Kconfig.

Also let me again remind you to submit patches with subject lines that
are appropriate for the subsystem you're updating.  I very nearly
deleted this unread since it looks like a patch for arch/arm with no
relationship with audio but in fact it doesn't touch arch/arm at all.

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR4p1oAAoJELSic+t+oim9DLsQAJVpWI9QM6ijA+jlUWrJ44xF
g3BM8ut+H444RiP8f6lDrOnpWuqF3Ii5STX0Ce4uoethQfb2WVb0XHS4YT2+QzAg
ncCQ6nw2sk68QjNHtOU9cF2yDwyV5JVazKz1BVYbpFU171vncuEF0UGP4HxjykMI
4nNiwzHiJMxecvs5ZOoB6amSTr+LnIwkz7MjQuEE3ViiVECkYEaJp1WV9170dcbl
pCgfefmsyXaTDNyYupu9RXhUrEE+IscnyO4Nn6uyeirmPQbwNHUyWhSyyWPmtvo9
WMsvhSqYarOHFQR3sOy9gAFTEWpuZESF3FMYZDlg+HdE2a7DiEO488q+HcMKPVwo
Kga0JRAzlgywGnO5AVD/KmgU5meTUOJ09CEQIAm7AaLHQm9tWd8IHDsTbMfRZ6OK
aCszuXfxrUJfKcW1XlskrQnfEoZhlt7uTSR+MAuaI+PQbzXX+iwpuivpoaz7yphG
nb4Yx7VZ4W/nZRD0pE3TQQZCeg1wxYB01ZM4t+XCKKVP/B+oCahE4q50TNHpFPoD
cFAlYGhXDsk59jALNYNxx4rFX9pN+Ar8JBSe5nPe4m15Hh6+S+qw3k4DvwQImO4s
nEQgJWDm4GQMJUL9BOf9WAKCF16HkIU0FMAmAdRTPtbEh1/NbhUEhf1wDISSv7n6
4EPE1hCPXb3a4M4zM2zD
=Q1pW
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

--===============6344258372033547532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6344258372033547532==--
