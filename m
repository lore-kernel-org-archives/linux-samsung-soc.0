From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 12:10:33 +0200
Message-ID: <20140923101032.GU30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
 <542140D3.8080806@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711554409=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <542140D3.8080806@samsung.com>
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


--===============0711554409==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nZJAkgcjPzQrJB+u"
Content-Disposition: inline


--nZJAkgcjPzQrJB+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 11:43:47AM +0200, Andrzej Hajda wrote:
> On 09/23/2014 10:35 AM, Thierry Reding wrote:
[...]
> > But I agree that it would be nice to unify bridges and encoders more. It
> > should be possible to make encoder always a bridge (or perhaps even
> > replace encoders with bridges altogether). Then once you're out of the
> > DRM device everything would be a bridge until you get to a panel.
>=20
> I agree that some sort of unification of bridges, (slave) encoders is a g=
ood
> thing, this way we stay only with bridges and panels as receivers.
> But we will still have to deal with the code like:
>     if (on the other end of the link is panel)
>         do panel framework specific things
>     else
>         do bridge framework specific things
>=20
> The code in both branches usually does similar things but due to framework
> differences it is difficult to merge.

That's because they are inherently different entities. You can perform
operations on a panel that don't make sense for a bridge and vice-versa.

> Ideally it would be best to get rid of such constructs. For example by
> trying to
> make frameworks per interface type exposed by device (eg. video_sink) and
> not by device type (drm_bridge, drm_panel).

But then you loose all information about the real type of device. Or you
have to create a common base class. And then you're still back to
dealing with the two specific cases in many places, so the gain seems
rather minimal.

Thierry

--nZJAkgcjPzQrJB+u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIUcYAAoJEN0jrNd/PrOhZvwQAKTJLz/zj7VcMelKI/GkBsxs
fUr6S9Vj3jlRh0h/dKx/nCl4K2ZX6qj6+Lo4n3BRilKhTe8rf3mpEPiMfL6Xkaze
J7RF9Rr7oq5GqY+ycw5qLLCKHPwzkfevpVfSUfUmO1j9UcYOBCZZH+4JVnBNMQB7
nP647n5xqbG3NqUEA2MZEKSbO8FH9qfajWAYjg+2molLDHbRgEWCK+5cS6ip1bCc
dXfcGLjEyKsn0PDs8gmpnAg0t8+j7RH4lUp/6PtYJuwrK8e1qE15tBxMTY1dx97o
oHvDCSwUQcmfhievDAQ7TIblPT/szsGZS1J+lpR1iLL7nTjv8tIgdX9EMYGp1s9s
BHPBsnSaKZnGaFY46h6uv7EbjHefh+MuJxToPEP2+ESXtyEmoRtoP+S3KY9Ep/57
d+WCxsfQENGErWI8RSnqhxr/jQ7SBYBhKEPGZrUfJBK1r9o/zTyGaA/35wHcS+ME
ylHng1qGniTZyh2qzRyiCncxYFdUZCiqeKBGncDYRkD0XqnOwPlOPfp+8uO/ABkd
tqpIgQ7uDo8J9HCZNzl0KS9v14yiZzK65awUJFOEcPd9cM0c4rS2pf6mtCqJGxFH
uCr3LPIKfowEWmpjRfrPpNnpRNGUtu1NZEiUkpPPb8MtpV2hfQnLNHBZy1XbuMnh
kGubrvHsB+HLi96xDJ1W
=QrTg
-----END PGP SIGNATURE-----

--nZJAkgcjPzQrJB+u--

--===============0711554409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0711554409==--
