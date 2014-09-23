From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:38:55 +0200
Message-ID: <20140923143854.GD5982@ulmo>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
 <54214008.4040105@ti.com> <20140923100139.GT30514@ulmo>
 <54216308.2050500@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1998708128=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54216308.2050500@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1998708128==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 03:09:44PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 13:01, Thierry Reding wrote:
> > On Tue, Sep 23, 2014 at 12:40:24PM +0300, Tomi Valkeinen wrote:
[...]
> >> What exactly is a bridge and what is an encoder? Those are DRM
> >> constructs, aren't they?
> >=20
> > Yes. I think bridges are mostly a superset of encoders.
>=20
> Superset in what way? If I have a SiI9022 RGB-to-HDMI encoder embedded
> into my SoC (i.e. a DRM encoder), or I have a board with a SiI9022
> encoder on the board (i.e. a DRM bridge), what is different?

Superset in what they represent from a software point of view. As in:
an encoder /is a/ bridge. Though they aren't currently implemented that
way.

> >> As I see it, a video pipeline consist of a video source (display
> >> controller usually), a chain of encoders (all of which may not be
> >> strictly "encoders", they could be level shifters, muxes, ESD protecti=
on
> >> devices or such), and either a display device like a panel or a
> >> connector to outside world.
> >=20
> > Well, the panel itself is attached to a connector. The connector is
> > really what userspace uses to control the output and indirectly the
> > panel.
>=20
> Yep. That's also something that should be fixed. A connector SW entity
> is fine when connecting an external monitor, but a panel directly
> connected to the SoC does not have a connector, and it's the panel that
> should be controlled from the userspace.

I disagree. A panel is usually also attached using some sort of
connector. Maybe not an HDMI, VGA or DP connector, but still some sort
of connector where often it can even be removed.

Panels are theoretically hot-pluggable, too, much in the same way that
monitors are.

> But again, the legacy...

You've got to make the abstraction somewhere, and I'm quite surprised
actually how well the DRM abstractions are working out. I mean we can
support anything from HDMI to DP to eDP, DSI and LVDS with just the
connector abstraction and it all just works. That makes it a pretty
good abstraction in my book.

Thierry

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYX+AAoJEN0jrNd/PrOhLjkP/17XiQSB7ueK0cOH+A62xnh/
J/DSJ6UjelnZ3lvoUhViydBoSyp/duf3rAHRT0M+o9HvbW/qB+a4D6SA6sIR+4bp
swuAXQBgHo0lWRyriOfY6CXq/9luhuc+Nd9sv433OwymL+SjRKndU8IMFI2eSDCN
RMhapO4ZomB3/bF0P6NG+v9I31h/Zdtz3xqn1JmaIIp/5pHZ6viIbt7dDdXz+LiG
JaPJuyJPwfTctkMS9TraGm+R1mHOX5fHm3sU8pp5BeRRbFB3TkUeKb7CHTsE+yUf
SZgFGQuCKs+RU65HHJX5jiPpmWMPCbPWp1UVww0jwZs1bKdDrKd1sUFuENlI38zR
bjJyVYe4uJb56hdD3VM0HJgWmKHTPraxu++9RwI9xBEGQ+okOdXEV6puJB8bju90
oNnxb3D7z4wkHxvJIKVOnSTfgFyltipmdcKudPf2pyefWSQbbqQA11+hHomZfd2I
wZNZnwda3/agDRmPgmTf++Rn4g8tnV60gQSPwTVDc68T4+lS+ltM38C/RazL+/a/
SSrLfLxTPMS8Gp8tqH8sqPdK20kjP48hmHvFZv8pSb1DgncOMmzSMx1/A0tEadjx
8LA+A7gq/0yk5F6d8BoyGmTDXe4MAzHVwBGjv/AlQ9kbZLpDx4fWY4a/a7wJiLeD
xYaJdXwqcHe4V0jV6YYb
=DspQ
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--

--===============1998708128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1998708128==--
