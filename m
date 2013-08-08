From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 2/3] ASoC: Samsung: I2S: Add quirks as
 driver data in I2S
Date: Thu, 8 Aug 2013 11:31:24 +0100
Message-ID: <20130808103124.GU6427@sirena.org.uk>
References: <1375865122-5258-1-git-send-email-padma.v@samsung.com>
 <1375865122-5258-3-git-send-email-padma.v@samsung.com>
 <2116389.OxrlCQ9LXd@amdc1227>
 <CAAgF-BdpsgQk8myq7OOk5zJ8Zxy+J6LUPb3-d40+iE2aNwdwDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8126326205863901185=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BdpsgQk8myq7OOk5zJ8Zxy+J6LUPb3-d40+iE2aNwdwDw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, abrestic@chromium.org, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============8126326205863901185==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PseDLKNfj4uXA+Je"
Content-Disposition: inline


--PseDLKNfj4uXA+Je
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2013 at 01:13:02PM +0530, Padma Venkat wrote:

> If legacy platforms not required to change then I need to introduce a
> new samsung_i2s_dai_data structure which holds only dai_type for
> non-dt platforms. If I change legacy platforms it breaks the older
> platforms now. Is it okay adding a samsung_i2s_dai_data structure for
> non-dt platforms which will be removed later?

This is totally fine and looks much nicer - you're not creating DT style
names in the platform bus, nor making names that are so long that we
need to expand the maximum length of a plaform device name (which isn't
awesome).

--PseDLKNfj4uXA+Je
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSA3N5AAoJELSic+t+oim9fmwP/isaw453TfVvVkNp3dVAZ0DD
X9g+vk/u45d4BK992PsY9jaPo5Ae6jPkDeOJU74/9GmmJH8n3pucT05/FJXk6G0B
SJwMMJ148M74kjdZ2OPOHE0Htg9dXuqsM8MS0ZfCgRL7rsDHsb3meqSbNDP1Qr3D
HovqOFWEeeC9Ykrm9TeqNoDn9Gq02fXKiwJAcAvn3YIpQo0/WUMCLSWyXYfNdld4
RAmigD3+kVuGSTxJej4oDmVKr27mFZqP5XE3sMsvNOgaoQg9TO/TIV8LWciNuDGX
7e18WPxwr0RSh5H4053n+cdu/+wpwCRFdiV3RVFjjjWDWGmVL0OqaiIw0Abi13EB
ZuS5a7SBwoOqxQyw45MOZBr0rKD4Nf3BUritUrJnEW9em5hlh1WpVxoauiyuy7/z
mrTIK6zNwRjxpNgBHHR3wL/Jet8OwzBt7Wr3jXwsP+xJpg8nuz5NYYDWEfH9CF3G
HowkDVkDNbZSBX9G0Q8m4zdtFFHVJdTnpw62i6zXKJKfXHvkLUCWV9Ln8EZsYWVN
PbocLSk7ntuhKI0MyJhPi7nIbB1Kz0HJi1if5ts2Hx6BI1Mv+IBQCEq4gAWfbWuO
wAisJ7I8QBPrF42Bm2Zz9usmXREanjfNyKZCE+9ukcxuWSwLoT7+Uo1cBajOdT3A
9cT3X66YKZMHpC/Cfqgs
=v3eL
-----END PGP SIGNATURE-----

--PseDLKNfj4uXA+Je--

--===============8126326205863901185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8126326205863901185==--
