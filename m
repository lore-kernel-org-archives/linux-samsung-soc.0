From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
Subject: Re: [PATCH 2/2] [media] s5p-g2d: Replace old driver with DRM version
Date: Wed, 13 Jul 2016 09:46:28 -0400
Message-ID: <1468417588.2867.6.camel@gmail.com>
References: <1464096493-13378-1-git-send-email-k.kozlowski@samsung.com>
 <1464096493-13378-2-git-send-email-k.kozlowski@samsung.com>
 <20160712200202.7496445e@recife.lan>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1179958497773191892=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160712200202.7496445e@recife.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1179958497773191892==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-y01b2W7X6i6bCU4v/zIy"


--=-y01b2W7X6i6bCU4v/zIy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 juillet 2016 =C3=A0 20:02 -0300, Mauro Carvalho Chehab a =C3=A9=
crit=C2=A0:
> I suspect that you'll be applying this one via DRM tree, so:
>=20
> Em Tue, 24 May 2016 15:28:13 +0200
> Krzysztof Kozlowski <k.kozlowski@samsung.com> escreveu:
>=20
> > Remove the old non-DRM driver because it is now entirely supported
> by
> > exynos_drm_g2d driver.
> >=C2=A0
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Kamil Debski <k.debski@samsung.com>
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Acked-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
>=20
> PS.: If you prefer to apply this one via my tree, I'm ok too. Just
> let me know when the first patch gets merged upstream.

Just a note that this is effectively an API break.

cheers,
Nicolas
--=-y01b2W7X6i6bCU4v/zIy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAleGRjQACgkQcVMCLawGqBwL7QCePqdETcq62X5jzGbQvj7Bn135
YjMAnR1g59OdM4GdoHaaWGKDrWq/T4v7
=25bp
-----END PGP SIGNATURE-----

--=-y01b2W7X6i6bCU4v/zIy--



--===============1179958497773191892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1179958497773191892==--
