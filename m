From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 1 Oct 2015 10:50:18 -0500
Message-ID: <20151001155018.GC4469@saruman.tx.rr.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
 <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 12:16:12PM +0200, Marek Szyprowski wrote:
> DWC2 module on some platforms needs three additional hardware
> resources: phy controller, clock and power supply. All of them must be
> enabled/activated to properly initialize and operate. This was initially
> handled in s3c-hsotg driver, which has been converted to 'gadget' part
> of dwc2 driver. Unfortunately, not all of this code got moved to common
> platform code, what resulted in accessing DWC2 registers without
> enabling low-level hardware resources. This fails for example on Exynos
> SoCs. This patch moves all the code for managing those resources to
> common platform.c file and provides convenient wrappers for controlling
> them.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

I just caught several build errors which this patch. I hope you can
send me a follow-up fix (which I can amend to $subject) otherwise
I'll have to drop this series

--=20
balbi

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDVY6AAoJEIaOsuA1yqREduEP/22DXd/hbx2oAI8q8ewO2An+
ElSetPdJaAM69voOg3Lp2o9dHHB7N/Yv33/TdGPKWadjnMewSi0KRn5CRw8mmIuN
OmQ/L6kJjKZ5inl36PuyiTDnKcw1Wm3o6axcftGqeccjIZEr7v4TT1JBw9GRBcD3
GHZ5KhQ5OzDcIf88qwzZWZyfqA0YVVB6jApjy7Dr9rqNTSMKgVyNVCAqN8+/3mQY
YYMGHuFY2wXiQOEpQc9ApYXclO2NXp1hUvqqlsSgpo+GWIlCnbRDaY87x+n718v6
LuY1s+52mI2Z8IYD33Q4dQS/U5YUMtt0pA1eUPsCisP2flsLNuaqw4j6uPPh/QRe
X+mbTsjuk5bTVQVfidlgK492hhyTbMp1KeDrLYMk6xlsWsGqoaY4I3ayUKsO0fUm
vcg6NIhjJZpUuVTiIxC7PqA1zvWMMnZILW0Lbp/KVngLPtXy3yzvOJjC331+YI/T
+ZUQJVOig8l1SoFAZVSxRm/6rxEFVoX6XsucDxkpvxtHP+JcgSC5HI6G6tnkfHC8
Kxxf2B8hTN6QjCKk/u0klKZeZClbNBOesVcqKX/ySrmz/yAgzcy2iVpemP4f9aWF
ogfikS41v8lgIsHA6hJat0B5dre4184Y69R3qKuV6JagRZ8ia17kqqNpC7uGMK9T
NAkhzltPTGeSgICdPPDp
=wRYq
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
