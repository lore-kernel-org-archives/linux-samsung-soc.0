From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date: Thu, 19 Sep 2019 13:50:20 +0100
Message-ID: <20190919125020.GJ3642@sirena.co.uk>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8701822571931956441=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919075924.GB13195@pi3>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============8701822571931956441==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline


--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2019 at 09:59:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > part of the wm8994 driver so they can be further handled in the audio
> > CODEC part.

> I think these are needed only for the codec so how about getting them in
> codec's probe?

Yeah.  IIRC when these were added a machine driver was grabbing them.  I
don't think that machine driver ever made it's way upstream though.

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DeYwACgkQJNaLcl1U
h9CZ/Qf/RnqP8s+fNH8XRLC3f4NOhlEUuENvy3/L25UO6SoTsonta4x2bJJcUR+q
2qmI1q9VB6m4j0cXXZomB9tyElioGlvOr+91MN4OlewIIX3g15iUftM9HDEBV4yh
+zRz2YrNQLQeXO8Dh1tb2ImAgQB5alhxuOxCi+Sx0pFKf6TtioOOCJ4Nc25daN8j
By6n3XPTWaBythxtIRrtHrJUrKits1sfbG/qIKWOpjPCPVU41KX46bx/fCcjYw31
TWfsABgUpNmsHj0ndLsw8bnUByQMC59PfiHAwdS8THTH3s5EjRnFVkfvApeTZpuT
rYxEEvYM9MT2h8jesRjQgJIim/LTdg==
=nNva
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--


--===============8701822571931956441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8701822571931956441==--
