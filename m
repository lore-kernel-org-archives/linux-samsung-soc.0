From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Thu, 31 Jul 2014 12:23:49 +0200
Message-ID: <20140731102348.GC7458@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de>
 <CAEC9eQOpS90U9kWmY8YdcAtdxQYKoM9ikoWpkwMs6T2udLeZHA@mail.gmail.com>
 <53D9484A.1070905@suse.de>
 <CAEC9eQOFWQ8t1zzOVrHm2=aS4+N94EW6LSjBUG2fH51aFs0GLQ@mail.gmail.com>
 <53DA0513.3080602@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0813948619=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53DA0513.3080602@suse.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0813948619==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 10:57:55AM +0200, Andreas F=C3=A4rber wrote:
> Am 31.07.2014 10:38, schrieb Ajay kumar:
[...]
> > With just the spring-bridge.v6 branch of your own tree, I am able to see
> > bootup logo on Skate(a variant of spring which also contains ps8622).
> > I have tried both exynos_defconfig and multi_v7_defconfig.
> > I enable DRM, EXYNOS DRM, BRIDGE CHIPS, IOMMU, EXYNOS IOMMU
> > in configs.
> >=20
> > Even in your bootlogs, I can see DP getting probed.
> > And, you say backlight is also visible. That means entire display
> > path should be fine. Its just that you should start writing to the buff=
er.
> > Have you enabled boot logos?
>=20
> Let me clarify: U-Boot uses the display [*], so it is powered and I see
> penguins initially. Then, when drm gets initialized, the screen goes
> black and no longer prints kernel messages or systemd output or X11 gdm
> login screen.

Who's displaying the penguins? If you're referring to the Linux boot
logo then it shouldn't be displayed at all until after DRM has been
initialized (and the framebuffer console been set up).

> Since drm stuff is the only variance here and it works with simplefb,
> surely something prints to some buffer!

If you have something like simplefb enabled in addition to a DRM driver,
then perhaps the DRM driver isn't properly taking over the framebuffer
console.

Thierry

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2hk0AAoJEN0jrNd/PrOhF6AP/0v+SgzgrxIofx1C+LdVLpVL
zPhI9aoqLlMOH8xgPAeQqna6Bs3fZRtW69MSl/95darTxsqCiuuK9/cEF9mhqrfQ
mn2/SX+droK0+1Wukw/vMyL3iT/xHWGX9u89qkOTJMfW1HfxFMQs0puJWL4ZZyWy
DDzoRtp0Zv0W9CNYnTEqLIw7kOKvS3F/xyNXwjEpny+eI088CR/IWzIVVQ6o7gYs
BxPr991L2xjltCIyZXc5Qx4acnn1Pbomv/M4+gww7YmL/rwoE6w1G9DaCRUN9nME
NcSnourg8VpAGnjWjNpfB1+zkUgBGerq8QCxo2lmAQP6Iz1OjMgWLYVhAOyR2sBm
BuD+sBkOD/XW8T5EbX450fZ0OVqyuQpSv0VRdFfxyiW884gRQ2BbrlG4J9XN4ps+
WGFiyaiZjYDx9AwaX0AGwy2AdwRkiDuCxAeEr+fbDnbfeNkflaZbLpt/rmFryUNr
Vy7QqXsF9u80iUjPj88Gb9dAnWanOnNb4mzRRaLevNYS4zmOiW3Ap50h7Ga/mrtD
y5jNgLwDCRDn2piCoWspEV11TmlMqcVolc4mn25Sm5zrU1wmGR1CbKxzKQyPKt8m
sfqG0Wz7l3sKneSAyL3hz6KNA9VoA//+ZPZv0Suam/io2BMMPx/3SFQDHIsl48fs
RC0xRIP4vHDA1uTD9tv+
=19l3
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--

--===============0813948619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0813948619==--
