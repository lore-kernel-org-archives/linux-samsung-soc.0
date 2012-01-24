From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 11:38:32 +0200
Message-ID: <20120124093831.GT27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201082159.02368.heiko@sntech.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7Ha3rcGc4ZVRbLT1"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201201082159.02368.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--7Ha3rcGc4ZVRbLT1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wrote:
> The phy-power-handling is common to S3C2443/2416/2450, so introduce a
> s3c2443-pm-common.c to handle this for all of them.
>=20
> This makes it possible to remove the raw write to the PWRCFG-register
> from the s3c-hsudc driver.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

I believe this doesn't really depend on previous patches (??) In that
case, it can be carried with s3c's tree:

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

--=20
balbi

--7Ha3rcGc4ZVRbLT1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHnwXAAoJEIaOsuA1yqREWcwQAKXMOzKpoXOQFhUGt3kpwvBU
60DGk//WF1Kk0XQJXut/Z8IUiNy5ONrxhNtZmKkXzEFxt8q6Rg+PqdUmMX7DyjFA
tFyP8S/OxNOWcXmTfwPDisiK8iQ/pSt4ejA+Ac89zshFbxhv2W1xMrL5F2/Ys9eB
woFFVZIyLi7B3Tb2Q0iDUmzDg4FwpeguSC+P8AR4qHV1zvr5C6KMuUjjVAYgpYTB
k1GLGGYDOOzMOrgos+YdS9rkj53CgmKfmdtOYJ5H29n+7knCVVID680KZIrNOYj5
E55X97ou1B1mGSB5N+wLVPN9TwBMGOEVn5Hp4JSE/Tpoxk/eN5ysfAhBdEqR+SSn
37tfJzt0EgZgTUAeHtcffqA2Pebfdz+OUSXCd5MkYnWenKwYwlJsxp4TpnsrFuRv
Y2Akz0Uekc8ivU3JVT50gFUIE+vFdihcHoakTCL0rT7/jVoNTXyzP8SauqGgWp/u
l6mSgHyQqVAZZdXs2JUeLivYybpZ5B0LF32HOHNJ0yNlpOY+mgeQSdAKLhjAY2PC
h4kxCxIgRb77qzjAYijuRg1ksz7gY02kz/rG6WW9qZnfo/5axv13zHCLx3fqhVkh
PQqloqEP7PPAqtsqNd6X5lobDxstyKxnakj7GbkS0LPnmfisbAXUU6MGSk8V7K5M
4M9oaqqUwpmwSkjfuOkq
=PdMT
-----END PGP SIGNATURE-----

--7Ha3rcGc4ZVRbLT1--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
