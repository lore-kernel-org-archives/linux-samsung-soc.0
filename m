From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/8] ASoC: Samsung: I2S: Add quirks as
 driver data in I2S
Date: Sat, 27 Jul 2013 12:50:22 +0100
Message-ID: <20130727115022.GE9858@sirena.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
 <1374845812-7803-3-git-send-email-padma.v@samsung.com>
 <20130726145319.GI9858@sirena.org.uk>
 <CAAgF-BerOfvhPJemVf0HBK5L4edw7pgm9bgwKGL+XSMpoaR3vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8342411192740199332=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BerOfvhPJemVf0HBK5L4edw7pgm9bgwKGL+XSMpoaR3vw@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, abrestic@chromium.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============8342411192740199332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QZ8yv+eHGPXxF0+s"
Content-Disposition: inline


--QZ8yv+eHGPXxF0+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 27, 2013 at 06:38:02AM +0530, Padma Venkat wrote:
> On Fri, Jul 26, 2013 at 8:23 PM, Mark Brown <broonie@kernel.org> wrote:

> > As Russell indicated you should really keep the old name around, though
> > marking them as deprecated is OK.  However I'm not sure anyone will have
> > deployed this so I'm not sure how much it matters - every downstream
> > kernel I've seen was still using board files anyway.

> This is there only on exynos5250.dtsi, so changing this file alone is
> enough. patch3 in
> this series have the same.

The idea with DT is that you can bake the DT into a board firmware and
then upgrade the kernel without upgrading the DT.

> Having only the version info is confusing. When I posted my previous version of
> patches I was clear which version introduced in which platform and
> again if I come
> back today and see I again had to search each SoC datasheet. So I think this
> patch now clearly explains what new support introduced in which
> version of IP and which
> SoC platform.

Like I keep saying the problem we've always had is that there's never
been a 1:1 mapping between SoCs and IIS IPs, and of course nobody can
get the documentation on the older SoCs outside of Samsung so...  If it
were a linear march forward in terms of IP it'd be a lot easier :(

--QZ8yv+eHGPXxF0+s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR87P7AAoJELSic+t+oim9xacP/2c0kC0QgdAhzxnVdXnhqOuf
Ni4sktspOZWb+ajOSXcM7kk/rtNUGLdzjwr41cl6K5c9nwCRHCuk52NmYo1aHr1p
apwhBUNm+ulhfVIap9f+SUZ8N6Tnpoz/Azcgl6DSLtDc6AnjcPU+AnxHgRNyYF1T
va+y37Xs7hI/n2ISBfJjdudNhTMJpiUHpSy3TNucFGD7Z1C+qdJJ63v2x0/Yon+Z
WW27e/8tRsR495a9XyJ4ewY+8ahu3xmRI8d9pnkj/6K9Jfxtgg0Ru/CAwehMhVYt
QzBIhEiJ39uUTRmlsU+zGaipzQ18B/xOV23UeHudEzOp24TCUV6okoNNXiitjNx5
Lsl84SDz3Fxt09UKQDYB25OX51ZdFoH7JpdB6FzT0sAeXanl1v4YfEBYuAAeafy/
J7/yBgngD3aM9vl8ANxhoccyGfp3Ow6+T+xh8cFmO1hphGyUosOmcX8D3mrAM2rK
w26MeQ9151LUQfQagUWBD0TT6Bvx41WyhMV1Se+0ljqyrsA4yUFMHL4BdkxPS70V
rNtAJt1KjOTmwJPWkjsW1YAIMwVIPKAWGep6lwRyetBW90QOh0QfGI+YzAwSj/iu
USy5vNwc2Ensf4tE2b3gVgNzJdpyBUPAv/G9och5kHfcO5bTpCjCDxfNN9hmzb6a
W43SRLQitWD80EH2lfBY
=8G4N
-----END PGP SIGNATURE-----

--QZ8yv+eHGPXxF0+s--

--===============8342411192740199332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8342411192740199332==--
