From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Thu, 6 Apr 2017 23:33:06 +0200
Message-ID: <20170406213306.GC27728@ulmo.ba.sec>
References: <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308014258epcas5p3eb623c49b888c91ef102a7fc8f35d1b7@epcas5p3.samsung.com>
 <1488937357-5623-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488937357-5623-3-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 10:42:36AM +0900, Hoegeun Kwon wrote:
> This patch add support for MIPI-DSI based S6E3HA2 AMOLED panel
> driver. This panel has 1440x2560 resolution in 5.7-inch physical
> panel in the TM2 device.
>=20
> Signed-off-by: Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   6 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 739 ++++++++++++++++++++=
++++++
>  3 files changed, 746 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c

Applied, thanks.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmtBIACgkQ3SOs138+
s6ErWhAApYu9qFie0xpP5X297Y1Tm0irg0FOVHO9KdLbVYqdOd8XNpYnLsWv/qFq
0ALvi214i/2vexbwXSOLhQLqicP/TFSfYa5C85ELmVC3HTe57tfrjcdqDPOyknm3
gSH90jbtOLUvbIewJwHf9gPl85uz4/F2t6pA+fwnFCW5k/fIoUSu6MQa4qSpUCp/
8QnbqlLJsYdBbd97cI8Ndm/vx+I5Vdv6AbGscG8Ar9agtr2CTsKw4TxCy+ZtDDzD
g61PY6j5guMTe7isMUlapaDr2uyq6MZN598GlnefB+ccr06mQs60GM8QIvx4AXPK
P7jGJ26ZoVGpdpOglLrKy+dupoCGmdWisLrAmJ7GsPr5ykhJhpPdVY3k+ZNM4IFs
ny9DRtWHLt2PwT7uH7puOZgZJdThbc3iSsUZNXlNFs5P7jNActlEbtodpni23tBZ
/tUy/werzTlIpIjxZdIoAVPQD1bg0TJUw/l2INQwpDDHWjwyCHR/d35ecEux9XDU
NyGnjNcJJf70SBfuMdpjRs9YH7gEIlYnK35Sm+Lh7FUA7jgCkd45BmXS04DT37Ci
mgB9nsv80BMXorAu02QObBaai2hEhzNbOANd7qaCKBqx9TV56/cskxavgMgNuut3
2oUVlYuRKUjXCpZ3rfCRUTjgFnwlA48H6ZvPduE7x5MSLXpiS1w=
=yFO5
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
