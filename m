From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/8] ASoC: uda134x: Optionally initialize L3 ops to
 default GPIO ops
Date: Thu, 4 Aug 2016 22:03:23 +0100
Message-ID: <20160804210323.GK10383@sirena.org.uk>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
 <1470317928-25365-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1292344180506869695=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470317928-25365-4-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1292344180506869695==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline


--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2016 at 03:38:43PM +0200, Sylwester Nawrocki wrote:

> The downside is that it will request GPIOs on behalf of the codec
> device and thus allow only one user on the bus, but it desn't seem
> to be a limitation with current code and usage of the GPIO ops is
> optional anyway.

Does L3 actually support multiple devices?

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXo62aAAoJECTWi3JdVIfQoFcH/iX1ofpNf+SlAj41FjXPFPwB
S8idLGj6MnoqWTBwZTujh549Ao5Xt9+hEjMvu6bmpkNR01Dvz7WJYibWAtxxTja9
rv2OG4iHiCqty6mo/wkdg+iHhbEN5UpiE+XwQdCDJ+DCDlt6FDhI93vXGnzZBKsy
iSIQycxaFYuIqfIzctHWmLEyveXOreOWswAdZRqtb4v2clZKCcUFTwIw7RfnwwAQ
n4bpiuZv5pGq0we3eLjdTYRyEIKdgNoj8w8OseOZcRFUkR4HS4+Cr3TEyq82rzHm
FEmJnVDjjXwGVKu7jSR7TAb18gdjvDSxfPomoXHe7Gt5jgtCwYYHgX4nJMjirEw=
=OiYj
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--


--===============1292344180506869695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1292344180506869695==--
