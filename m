From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: exynos5: disable fifo-almost-empty irq signal
 when necessary
Date: Thu, 23 Feb 2017 13:03:04 +0100
Message-ID: <20170223120303.uupbr2zkidcotydp@ninjato>
References: <CGME20170222101123eucas1p25482d192dd5d119aaf6ddc15a01c60c0@eucas1p2.samsung.com>
 <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7p6aswoznlvmy7o2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47104 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751041AbdBWMMy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 07:12:54 -0500
Content-Disposition: inline
In-Reply-To: <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--7p6aswoznlvmy7o2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 11:11:20AM +0100, Andrzej Hajda wrote:
> Fifo-almost-empty irq signal should be disabled as soon as possible,
> to avoid unnecessary interrupt storm. The best moment is when there is
> no more data to feed fifo.
> This patch fixes system stalls caused by IRQ storm.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next (will be in this merge window), thanks!


--7p6aswoznlvmy7o2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliuz2kACgkQFA3kzBSg
KbadRA/+PCgyyeNV+leDM6g2oo/W64yf4HD+NO76VZO7lhZfAalj1wPCI3HdjNTz
18tfjeGjKv95vp52nZtCO/QKQ91WsMgm1Uol/VzWWtfNnPogpmlP4B3ybkeFhezA
sbQp2n35220a94zZek/XezI4B+lKux/liNc8CUeJythWdj+RmmjQqBDxs28MpoZ2
epT6n8K81/11STXsbDGmQ0kAY4Z9TL0j8bU46EfrI875XH2imzG1gnzaALQrFqc8
cN6SjfapwwiY2gstDTf4d6oYNyiLRa89dFuBOpow1NrtVMiVkNokxcjrj4nRTqAx
IBbGe3f82kq/XFrjUyNGGb3xDABF9Tcy6Ujdg5d/6PgSBelaHvmwrghHsfA+kkF+
nAKJ9aNedzLZaoQ97fQCh7DIJyXr6UUfthNee1ICeUnB+p+SC9R3fSGk9gDQJnkN
qL/SEBkLLFZWqyJMlqhMosfRVb0LpQDzXXYO1H16WrMC2XXKhP04o5KMsmIbuQJv
gPqV3vpCeJf8b+L0k/O2F/XHKh5vnTf4VnyUmciB9N/tzgE5n0lEgjW5ZJAOoI55
mp9EiPlqQtmh2tN8ks6dTTiKdVY670Ymp0ANAoUL661kxf2F8wi5fhl5VDAI4ZJf
IXefyjZLuSGBA2F/M84l4UU1tEYjVQIjm/8ylQf9JWDjsX32WdY=
=JZg8
-----END PGP SIGNATURE-----

--7p6aswoznlvmy7o2--
