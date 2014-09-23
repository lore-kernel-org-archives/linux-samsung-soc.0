From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:41:28 +0200
Message-ID: <20140923144127.GE5982@ulmo>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
 <542140D3.8080806@samsung.com> <20140923101032.GU30514@ulmo>
 <54214CCE.7050102@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359028171=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54214CCE.7050102@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0359028171==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 12:34:54PM +0200, Andrzej Hajda wrote:
> On 09/23/2014 12:10 PM, Thierry Reding wrote:
> > On Tue, Sep 23, 2014 at 11:43:47AM +0200, Andrzej Hajda wrote:
> >> On 09/23/2014 10:35 AM, Thierry Reding wrote:
> > [...]
> >>> But I agree that it would be nice to unify bridges and encoders more.=
 It
> >>> should be possible to make encoder always a bridge (or perhaps even
> >>> replace encoders with bridges altogether). Then once you're out of the
> >>> DRM device everything would be a bridge until you get to a panel.
> >> I agree that some sort of unification of bridges, (slave) encoders is =
a good
> >> thing, this way we stay only with bridges and panels as receivers.
> >> But we will still have to deal with the code like:
> >>     if (on the other end of the link is panel)
> >>         do panel framework specific things
> >>     else
> >>         do bridge framework specific things
> >>
> >> The code in both branches usually does similar things but due to frame=
work
> >> differences it is difficult to merge.
> > That's because they are inherently different entities. You can perform
> > operations on a panel that don't make sense for a bridge and vice-versa.
> >
> >> Ideally it would be best to get rid of such constructs. For example by
> >> trying to
> >> make frameworks per interface type exposed by device (eg. video_sink) =
and
> >> not by device type (drm_bridge, drm_panel).
> > But then you loose all information about the real type of device.
> Driver knows type of its device anyway. Why should it know device
> type of devices it is connected to? It is enough it knows how to talk to
> other device.
> Like in real world, why desktop PC should know it is connected to DVI
> monitor or to
> DVI/HDMI converter which is connected to TV?

TVs are much more standardized. There are things like DDC/CI which can
be used to control the device. Or there's additional circuitry or
control paths to change things like brightness. The same isn't true of
panels.

> >  Or you
> > have to create a common base class. And then you're still back to
> > dealing with the two specific cases in many places, so the gain seems
> > rather minimal.
>=20
> For example RGB panel and RGB/??? bridge have the same hardware input
> interface.
> Why shall they have different representation in kernel?

Because panels have different requirements than bridges. Panels for
example require the backlight to be adjustable, bridges don't.

Thierry

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYaXAAoJEN0jrNd/PrOhfqAQAL46pjj3cVUDfUQn7CFcyaek
hI5HPyMBDkyrIDgc48F/FtGR3DtvV2KexfgHsThBXM1FKsrDSO697kYN5Cqmo0s6
VUWsed6gnqOkFsPNvwXhkLlHYWHLonK5nR60UFcG39KP0Dh4D4d/2kRYCyiLiC7E
a6xS/pkbjtU805Mk2HZIy1ItFpyAEZJjtcqfGoiHtd7js0cU2W8Dm2TZ7Q53jcKc
4vl/MOCxlES7Oz+2Uc4x6DOG19zvX3OKA3QdkqRa/ePYj5Cxc6qvfUbd0ltJLcV+
CHqEn1+yWlfVRBeo39y4B0o7vhc+pnqpD0u7HE/uSsCjkMfhw2VXLmCMnp0miJ9Z
tqxN1036z+ME70tu/uPGq8lAsh7LlH9lMRsG+dNGOxBRXhTYehtQmx+qHBCYfavI
bg+xPmFYQoDExOYUSvoHxK8L3lRv3LsEH3Ai/FnfBPhdzM5JpltqOtIqYPjCTPRV
/3ZrhiD/qzPcSUu/fLFKhq2oKrp/rxZm2TEo5YEukpgdPzR7DdeZWRs6vo1H2gKT
C2AeF+5VaZX3ea9hJMiEOfzdCAvX2ouXsinzWfC7/WcbEbxyXv1ybGcj2C8k0CTo
x2uJQY8NV1jemlgrDuyB7roTveBpbg9/7JYfUdSeQBl57bqnkx1mnZDZgzk30BTy
FvMspTyHwca6bmzrUCO9
=FMx4
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--

--===============0359028171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0359028171==--
