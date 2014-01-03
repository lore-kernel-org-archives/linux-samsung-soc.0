From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v4] i2c: s3c2410: dont need CPU_FREQ transitions for
 exynos series
Date: Fri, 3 Jan 2014 17:23:52 +0100
Message-ID: <20140103162351.GI7132@katana>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
 <1385439767-18586-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385439767-18586-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2013 at 09:52:46AM +0530, Naveen Krishna Chatradhi wrote:
> For Exynos4 and Exynos5 SoCs from Samsung the i2c clock is based
> on a fixed 66 MHz peripheral clock, and therefore is completely
> independent of the cpu frequency.
> Thus, registering for a CPU freq notifier is very wasteful.
>=20
> This patch modifes the code such that, i2c bus registers to
> cpu_freq_transition only if CONFIG_CPU_FREQ_S3C24XX is enabled.
>=20
> This change should save a bunch of cpufreq transitions calls
> which does not apply to exynos SoCs.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to for-next, thanks!


--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSxuQXAAoJEBQN5MwUoCm23DgP+wTf3YlfmOrh7G+lpYvsgqxQ
r16o7AOEnjZbJkOE1sN6LNcrCiH/4jAJE756ZBZZGTSzQh6FAb0UPi8abUp18Rzq
wpsndT//AyhoZKaO6E4qnj67089jqZc2C83+xZrvHJjxXokIz4kfB7yVfHJEsViK
Wpxtgt7mOxDSF/FAul+ayEw+lSblTBT3y+xF1oLcLPvgl8iMpdzwLSuXkFmrQALO
4hvOLEh1hfeYafwN8AYMcvgZAttJBrpjDjy4dVScGdQd4RdB0zUCFcSSdonCsBlb
Hj8ZOSirqN45S6LO7njJL7nImcYmU/r0+atdKHiHKSpayqJBi74OURNciaUmSSSX
lBFDg0e5Mw41QYryqSmxfbXO7VaF+SNZ9KzApk64MHCFbTNaYrhaColOsFHMu0Xx
1fB4wQJD2xFhTQP7Da9uZEpytoq4Vay5TBEMGYiPwQ/u/+Z8E5giZYjoMzgzP2Ki
4zzlSiGEd0NiZLa7OuIvA7eIrZmEKrWD7rEesSCm5OEO7MHZnRcKEn7bdOlRgGsL
8yAjyKCiSLeCmepG4MlR99obIPuK4cp4oEm622orV/Yc2kaMUXRMrGzSYIbtlrBH
g6hIJQRTaZdqAsqS/kSm1ShjoXwj/QhpXBnpwXWKbmBc3rprkfx+mUEEDuLBEEHZ
btRMTWVtR7dL+YSPOpBU
=+/YN
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
