From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 3/4] USB: ehci-s5p: Add phy driver support
Date: Fri, 18 Jan 2013 15:16:17 +0200
Message-ID: <20130118131617.GI4672@arwen.pp.htv.fi>
References: <1357916550-11421-1-git-send-email-gautam.vivek@samsung.com>
 <1357916550-11421-4-git-send-email-gautam.vivek@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3605417538347201034=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357916550-11421-4-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============3605417538347201034==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Content-Disposition: inline

--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 08:32:29PM +0530, Vivek Gautam wrote:
> Adding the phy driver to ehci-s5p. Keeping the platform data
> for continuing the smooth operation for boards which still uses it
>=20
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Missing Alan's Acked-by here.

--=20
balbi

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ+UshAAoJEIaOsuA1yqRE8hsQAI1bHyPfRvgyfwVohST/KyVN
lEZQCpMWi7w94YDS8jhuZH88dQih34QVGxmMDs2U1QY86R23PeOkB7crj4Kl63nY
mpcgMPOb5ONYnw9dAPzNYWd6GlFoJo5OtOUawXbFWy+H0GbaUbQV51bULAb947TO
Jo2eXFUV7zfkCJsS/7MZVncXNqqpYa+Z7+AiTBzGEAbx6Ae9zTJ2lkR/Pcmqh0Jw
WKwLCp/Kt/jx0bpca+PAFP6k2ka4WVTUxrMoX97/EXG38aNKKPlYeE00QZJJivb0
WiJPg8IB5cqV9ixp8JhinDn/gZm/kGxsbiwnXd3ooU9we3iSknEkm8gR1B3mlwgT
JP2b/7o3/XNaOV9ssfizNj71GyA4UHbjXS8RMMR7FvCFl161ESGR/ITrXfKT6WqI
sJQBYGTOnoSF++h4hFz/iJw17Y4mKgCf2H6wIqqrWUMVx2ijgY/KRUEBJ4g0+9sj
Jx35//+wYObptrjmmzTTXNjbQXMwB57c+MyrnIvaQfu8gCzaoS/7t6U8rFLlV+ol
+jXCn+VzVLAfbx7gqW6xuNVJVAKufgNHp2PDu+RMXWA+ohCqmbDYebA+B6iOObgc
ZTmO5sW6TmNg3pSVmnZ2Ewq+UoC8djdywXJMTeZGSIT5T/GtryglqzfdIdTkRpsw
U7vDEkJblT/e+LIwepQB
=k8CN
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--

--===============3605417538347201034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3605417538347201034==--
