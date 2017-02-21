From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170221 build: 2 failures 9 warnings (next-20170221)
Date: Tue, 21 Feb 2017 09:47:37 -0800
Message-ID: <20170221174737.2gf63ywzdjrh33ub@sirena.org.uk>
References: <E1cg6WK-0000gP-QT@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eswlzpm66weyq47t"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33760 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753537AbdBURsA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 12:48:00 -0500
Content-Disposition: inline
In-Reply-To: <E1cg6WK-0000gP-QT@optimist>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org


--eswlzpm66weyq47t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2017 at 09:14:04AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/pci/dwc/pci-exynos.c:132:25: error: 'struct exynos_pcie' has no member named 'pp'
> ../drivers/pci/dwc/pci-exynos.c:162:25: error: 'struct exynos_pcie' has no member named 'pp'
> ../drivers/pci/dwc/pci-exynos.c:185:25: error: 'struct exynos_pcie' has no member named 'pp'

due to b09d4ac91a3934e9 (PCI: dwc: all: Split struct pcie_port into
host-only and core structures) which replaced the struct member pp with
*pci but has missed some users.

--eswlzpm66weyq47t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlisfTgACgkQJNaLcl1U
h9CGTgf7Bki3Xo59eGN8GBpvr3Q9VNDU0R6drohgM9dmdya3htqVIHE1cGUITWN2
IAYm5wECGvM0wcadShCxaX2x1hcc1rTk1vSZ0urJFyZmsvW6i4oozU7agIf3H/kH
xKr29I/FyTeeCTPEV07qRn5WIAC2LkMr/r0BmmPsNyPHsQFd1hX1trPzlBSYcpO2
jey3fjwf3SKQil2mL4GOk14rh2oYitekUmwdkq7lMvLQg1kpX1Q2QPi95zGNiqsI
Uerq/WyorPM4LUozk4Xns4p9VZQKZZfFapDwNf8CNnHgfa64fjkAgE7D29D63WR2
OraTak9NMo7YzkQhhQ6EZy5Pl4D9TA==
=m2Kr
-----END PGP SIGNATURE-----

--eswlzpm66weyq47t--
