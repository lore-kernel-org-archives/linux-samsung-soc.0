From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 15 May 2014 11:49:10 +0200
Message-ID: <20140515094908.GG6434@ulmo>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
 <536B26FC.507@samsung.com> <536B35E4.10705@samsung.com>
 <CAEC9eQNAactYm=E7XU7FqM8R7wKF=1WuTXFwg8AzWJSNj+W1Xg@mail.gmail.com>
 <536B7137.70503@samsung.com>
 <CAF6AEGtOpTxsvr9-4oo2JqKP6=LYxujDFR1x-n07otvnXb9miQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239849575=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGtOpTxsvr9-4oo2JqKP6=LYxujDFR1x-n07otvnXb9miQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, "airlied@redhat.com" <airlied@redhat.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1239849575==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline


--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2014 at 02:28:12PM -0400, Rob Clark wrote:
> On Thu, May 8, 2014 at 7:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
[...]
> > And more thing, we would need to consider image enhancer device placed
> > between crtc and connector/encoder devices. And it'd better to rename
> > drm_hw_block to drm_bridge, and existing drm_bridge relevant codes
> > should be removed.
>=20
> I don't object to changing the name to hw_block or something else.
> Although to avoid introducing too much confusion in this discussion,
> for now I am calling it bridge/drm_bridge_funcs/etc for now ;-)

FWIW, I think the name drm_bridge is fine. It describes a device that
takes a video signal as an input and outputs a video signal, possibly
using a different encoding.

Thierry

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdI2UAAoJEN0jrNd/PrOh6PoQAKpctvpn+YxrIF08SoOxIDeB
NQ/3iYdpWMygWzIkSm1uZzqUy7UungIlFVwMF9gZmYAVGGai1bUgT5yLW8WT3Cri
asueFhs3CPnWTVar/tLqTlvnrN5MsTxAgcQAM2fvh9Rnyye6IUeyauN+Yit+tgdg
UfokWSITB4qcBuQdKN87qnapa4+dmKXTszkCQBZPk+XBn22wWaKU15w+f8QYnZ0L
mbDWY5o0FcQpsj1fVXj5i49hcnCr9QbQ9fyFsaz6NUTT93U5TyH3gdiDoehBfyPZ
HYgsdMaijVncgVQm0pLEUP4ZcePvU2MN/SkiuWtSkzlW5dPfa0VPKHiQAky/0WHK
oPDIodbyzPq7P3H4LL26U4xN4zsq1ZMZfJIZoQR6mgpgdUG17qY4p4fLwUJbXi7z
KzHGmgYsrI1mN36CwMFXhIb1lBnUGekLy/qjU7LZUM2VpVqGbi4kG5RE+4BYqlEJ
cxZdymvZArCcSLn2UEeCnhJrins6JlynQgOE66UQEjNwa0AyEQ7yOCucnvqvw/aM
KRI9iw94V6oCGzYLg8/Dz2DcbA0cUwLIbQFw5OM0TGxSzoKtpiEMio3DdJ/4q/3K
w9nL1K6zyVBvZLRXn3GkoXoC2UNCJObJwDeaqgL2QOqU442m2g465cu/97LBTs0g
z+eBRQJoBedOqXaae315
=fLKw
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--

--===============1239849575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1239849575==--
