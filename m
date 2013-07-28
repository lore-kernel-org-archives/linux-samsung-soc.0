From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/8] clk: samsung: pll: Add support for PLL6552 and
 PLL6553
Date: Sun, 28 Jul 2013 13:30:51 +0100
Message-ID: <20130728123051.GQ9858@sirena.org.uk>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <1374536965-3545-3-git-send-email-tomasz.figa@gmail.com>
 <11551938.yDBcNngaZN@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4580453267176853010=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11551938.yDBcNngaZN@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, stern@rowland.harvard.edu, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============4580453267176853010==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="trkD0OZPq5p8NMmu"
Content-Disposition: inline


--trkD0OZPq5p8NMmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2013 at 01:52:19AM +0200, Tomasz Figa wrote:

> Changes since v2:
>  - Reworked to use new PLL registration method introduced by Yadwinder
>    Singh Brar's patch series:
>    ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041 )

I'm not able to test this series since that lot isn't in -next and I
didn't get a copy.

--trkD0OZPq5p8NMmu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR9Q74AAoJELSic+t+oim9T/4QAIJZUzt5dUMVnP6K8Y/zJSBF
+slACmIVDUDVG3TfGfidw2kDPr4AsUj3qrwui214hCpXS5aZ3dmHMCLxztOnLaEz
l4o9iTvPV1MC9aPUAasN3I8JEw0YSWneUcO69mIjkGQ1FbumsEoE5vHgeFaCIa7h
brMaUhiVjFK8BEYF9hAsyR7RauWM+l/OdFjiLksOlHADHwb1J43r/CE9RkCl8m7F
ifBjeYHm4UKYCl6wVQg3SmGLLti5hZ8N7BwOQe1xjIsC0RtHxGt5Vh5itJ4t2+IS
OHE8erTvYRrlq14CWM1wByFQb13VnoA01H/i0gvDEkaP/lRfIkr2dJANQNhe3Wf7
SFhiMdO6VKp56Y5eFOWnG9HIRRXm1XBHX0eEY/GBtu4S+BMoC3VBeUZ4Ew3wHWVY
meBkv6HdvAnAhNPiB6KsRj5yZ1dDlnBRf4DG9RMY7Cfk1nt3TEV4FXgwFXivvZ9f
YE1QDlh5r5j9y2lw4ummy5w93T/kNUDzpkd28PccC6TMYaWDfZoCZ91W8mrPKl7c
MAPcd7TT0R0IGs9kWhtPIvLwQNSeETzkIersDGmrazBR1AwAu3d1q8XCULsDmKLg
UVDxBhwfOEtxvAo+t+PmsbOpurIX7XVGIgB/MU0Wvx7NrrJPCKjThkSAlcV9KiVH
tJVii4RMSSBQL2EJQotx
=zr2j
-----END PGP SIGNATURE-----

--trkD0OZPq5p8NMmu--


--===============4580453267176853010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4580453267176853010==--
