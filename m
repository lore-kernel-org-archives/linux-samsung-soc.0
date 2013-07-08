From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/4] usb: gadget: s3c-hsotg: Allow driver instantiation
 using device tree
Date: Mon, 8 Jul 2013 10:41:33 +0300
Message-ID: <20130708074133.GC16635@arwen.pp.htv.fi>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
 <1372174706-5459-2-git-send-email-t.figa@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5524077590971762399=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372174706-5459-2-git-send-email-t.figa@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: l.majewski@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============5524077590971762399==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 25, 2013 at 05:38:23PM +0200, Tomasz Figa wrote:
> This patch adds OF match table to the driver to allow instantiating it
> using device tree.
>=20
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

I will take this one only, the others have no dependency on this.

cheers

--=20
balbi

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR2m0tAAoJEIaOsuA1yqREmWcP/jKKIl361JXR6PQM5ORfbTia
+FU7DRMuXx3QFH7G4FnigfOJtq4FcgNMB/lj1H6qLwpXhcFKDS9nKV6+MxW6i9vw
uEmJAUQEoGJ6Lx4YKAr//tFTfS/XrL1U107lFWRSvPS2ss4LUenLfr1H55IAYtkR
zDQeJdQF74NsLoRSfPwLpess5Lc3g7odnigOvUK17Rz8tpJQi1ffLYzIy50298Ek
YGhZDPwlsOQaIujgDM1S8oDHyWu9h4ZITNXA/eOuKlMppajqtr/WncsR78AofhJ5
DREqK/m6brHeRUT3lERKOGSta67o8sPix5igPDo5dJ2vuemd0I6T2EdXcFuCLonH
xLARrbm5nA429OMr/Rz1p/UATUDzHD9rmR7QVJ5FKGwG4lrYonRNjF0mFqPG4RXV
yQvO0tzPC17i/OOF77LfX0vkIfQCsrVGMVpXj54gDs1iiZCENqQ3wcfELjZEnqP/
oCTFExFuijGoMkZAQwxPVjHLyalw0z6wIiAW83AF57FSbRNcQjoAfPd+Qdo2IC68
C8aQ6xt9CDB/711y12lKPN0bE8GEflTSuZWBhCL4dZcRA20fRZ5po1RltMtqWSWn
33mfOpiKSqZteVAA0AZGTexC1liaNSS71s/cFRtOvQ+atRw+VgSrHNFgzi284+S/
CrFM6IJ8yndy+di5qNuE
=kdrh
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--


--===============5524077590971762399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5524077590971762399==--
