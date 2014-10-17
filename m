From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/7] regulator: max77802: Add set suspend mode for
 BUCKs and simplify code
Date: Fri, 17 Oct 2014 14:39:37 +0200
Message-ID: <20141017123937.GM1820@sirena.org.uk>
References: <1413478133-2577-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413478133-2577-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UUMz/kfoogzZ9WLZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413478133-2577-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--UUMz/kfoogzZ9WLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2014 at 06:48:48PM +0200, Javier Martinez Canillas wrote:
> The max77802 PMIC has a special enable pin (PWRREQ) that can be used
> by the Application Processor (AP) to power down and up voltage rails.

Applied, thanks.

--UUMz/kfoogzZ9WLZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUQQ4JAAoJECTWi3JdVIfQXMcH/RCRHKr8sop8a40AAPZ1DBIm
K0vg154jcXlaa9iP2fWoTQ/4ZDF+NYaNJqtVTF6gotDNOnoEYinLOhqOFN8N9Qxb
GDu2B/53JkSTX/wsZQ7TAv4AX8aUJskWyZbvuJFO61jrelHrlzbw7sn6Y2w3U9by
pxSEchwTp9acWcbds5b+4t0h8WcHP0VNDwBrHagvdwCYPDx8idab4LDqwS34p7kX
zqV1ZWyFaNS4ziRLuHv2NBGTNcuxHC2fcJPi7d9Dnr66PY2VZoDY296ItYTByePM
MWH8CgxEBI+2eNbTfDCKWCm8r4axL9Xx8Ch1UvqdAtWVcwxqvz5MHXJbXwBZnXI=
=cz7v
-----END PGP SIGNATURE-----

--UUMz/kfoogzZ9WLZ--
