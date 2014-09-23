From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:49:38 +0200
Message-ID: <20140923144937.GG5982@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <26633587.NifLIetGL4@avalon> <54215DDC.3050909@samsung.com>
 <2238934.uLuAbtBXFj@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1210435607=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2238934.uLuAbtBXFj@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1210435607==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline


--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 02:52:24PM +0300, Laurent Pinchart wrote:
> On Tuesday 23 September 2014 13:47:40 Andrzej Hajda wrote:
> > On 09/23/2014 01:23 PM, Laurent Pinchart wrote:
[...]
> > > This becomes an issue even on Linux when considering video-related de=
vices
> > > that can be part of either a capture pipeline or a display pipeline. =
If
> > > the link always goes in the data flow direction, then it will be easy=
 to
> > > locate the downstream device (bridge or panel) from the display contr=
oller
> > > driver, but it would be much more difficult to locate the same device=
 from
> > > a camera driver as all of a sudden the device would become an upstream
> > > device.
> >=20
> > Why?
> >=20
> > If you have graph:
> > sensor --> camera
> >=20
> > Then camera register itself in some framework as a destination device
> > and sensor looks in this framework for the device identified by remote
> > endpoint.
> > Then sensor tells camera it is connected to it and voila.
>=20
> Except that both kernelspace and userspace deal with cameras the other wa=
y=20
> around, the master device is the camera receiver, not the camera sensor. =
DRM=20
> is architected the same way, with the component that performs DMA operati=
ons=20
> being the master device.

I don't see what's wrong with having the camera reference the sensor by
phandle instead. That's much more natural in my opinion.

Thierry

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYiBAAoJEN0jrNd/PrOh4yAQAJi8l8NkOTwAU7jiJEAkAIiQ
FAlJiiMEqthUAMMabQkLWAKfqjFGeWUBBqKvOvNookBSTWdZ/+It08/Y38DAwZCm
ZXjqTvWB0bDiKeR9oDCTfu2Zm+8KDJKZWNJ+rJ06MEoiOSeupFgPUsFmEglIxgFd
Xzpzx5v+pUmsDYm6hJeltUEccI6yr5QY9EuiQ+l2C7E3GtcWpeH6djvHzhiE915M
ENUbA/F9hH2XSePHO4puQIN1/l+lRKgEFP0rG09t7bTlTOJdVtgLAL3aRzSY2MMU
LSJPVGjNEcg6kBZ6IpmIMw3zQrirMbHVsBSRTfa3P4yEZMOVnl2FRIg7V+EjHRn5
VGLG6HZFbHXhQ1QhhrGOqrfSlnHl0cQvvKykaeAsm8R1eDlb4zzoA/zsluveOrLk
fh9QC/e9KNDO4qIPWiHdyKvObdae+k9vP3SxI5SiRP/d34NFRNIfGQoauGNrQLq4
depcQv9YSainL3xoQuhQhnBkOGOMdxe01OWqTTqsavqqDDsmkEnKKG3QscI0zB/i
AzTSPVQxGmygxwbTQMTb62T8aT/QngDjw4JRcyLgsKUoAHaUKoVhlKOHtwZIKqT8
UIFO8xexDl7OJxlkOz5h9RfFZTzaXMhLlkbe/NWo3Q96/3puTUQKyqYFrhaI8zoP
zDkqxvR0q7jc8LwfSOtI
=21fk
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--

--===============1210435607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1210435607==--
