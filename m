From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V2 0/3] drm/bridge: panel and chaining
Date: Thu, 15 May 2014 12:32:58 +0200
Message-ID: <20140515103256.GH6434@ulmo>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
 <536B26FC.507@samsung.com>
 <CAF6AEGvWxCS-NX4uLjyMqc==7X9znn8PJ0AmJ6aFqqHYSBgsrQ@mail.gmail.com>
 <536C9B2B.2010006@samsung.com>
 <CAF6AEGsd8xViZWroUgsT5Lf_DZhbC5-V_ycR_HOtqdUH9QbA1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946506944=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGsd8xViZWroUgsT5Lf_DZhbC5-V_ycR_HOtqdUH9QbA1A@mail.gmail.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0946506944==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 09:59:34AM -0400, Rob Clark wrote:
> On Fri, May 9, 2014 at 5:08 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
[...]
> > 4. And the last thing, it is more about the concept/design. drm_bridge,
> > drm_hw_block suggests that those interfaces describes the whole device:
> > bridge, panel, whatever.
>=20
> hmm, I don't think this is the case.  I can easily see things like:
>=20
>   struct foo_panel {
>     struct drm_panel base;
>     struct drm_bridge bridge;
>     ...
>   }
>=20
> where a panel implementation implements both panel and bridge.  In
> fact that is kinda what I was encouraging.

For lack of a better entry point into the discussion, let me pick this
example. It seems like in general we all agree that the basic structure
would have to be something like this:

	CRTC -> encoder -> bridge [ -> bridge ... ] -> panel

Where panel could optionally be a bridge/panel hybrid as Rob pointed
out. I'm not sure if there's panels like this, but I suspect the use
case would be where a panel had built-in controls to modify the image in
some fashion (brightness, saturation, ...). I think those things exist
in DCS for example.

What's missing here, and if I understand correctly what Sean said about
the connector type, what we need to solve is how to wire up the
connector so that it reflects the correct type. So the above would have
to become something like this:

	CRTC -> encoder -> bridge [ -> bridge ... ] -> panel
		connector -----------------------------^

One of the problems with that approach is that panel is more than just a
video sink. It also controls the panel (and optionally backlight) power.
The standard DRM connector helpers don't work well in that case, because
drm_helper_connector_dpms() forwards changes to the CRTC and encoder,
though that could possibly be solved by wrapping it in a small custom
implementation that also controls the panel. Anyway, that's really just
an implementation detail.

So once a complete chain from encoder to panel has been created, we need
a way to find the appropriate connector type. Perhaps to achieve that it
would be useful to instantiate the connector by the bridge that's
connected to the panel. So essentially something like this:

	struct drm_bridge {
		/* to allow chaining */
		struct drm_bridge *next;
		/* for bridges directly connected to a panel or monitor */
		struct drm_connector *connector;
		/* for bridges directly connected to a panel */
		struct drm_panel *panel;

		...
	};

To make this work in a generic way, I think we're missing one bridge
instance. Currently the bridge in an encoder is completely optional, so
if there is no bridge in the system this needs to be special cased. One
way to unify this would be to make drm_encoder implement drm_bridge, or
an alternative would be to make drm_panel implement a bridge. Both can
possibly be dummies stubbed out with simple helpers.

I wonder if this would have any consequences on Dave's DP MST work,
since presumably an MST hub could be considered a bridge. In that case I
guess there would need to be support for multiple "next" bridges,
perhaps a simple doubly-linked list instead of a next pointer. The first
bridge would then be used to model the hub's input and child bridges
would be used to model each
of the outputs.

Thierry

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdJfYAAoJEN0jrNd/PrOhBWgP/1NVEiXREF2zc2NkBUUpTzIc
WG0db44qEax4sZLCUnkQm8l0sarkMhAoK5NQBCcjyzLhGszDqN/Lj8lrJqOHLWll
I5M79DsqmCTa//46YPVPfKDTbg+CcUxU7d2fcdvxQv1DewMo9p9I5AAu3meLhHc6
6wy4xZScg0ycPer+u9Rri/hhxa5SS59NonSXtdyv+iP6MyU5/uBQAa7252ZRFhpf
LuqmTuVzAk2eh8HG54ceuSAi5JcXqryCNC7L56MQ0Ya21Z+gtd1+mDYVb2oA4YSL
8M2+GVq18UZkQbMrwR/suP04eFzxaeyxJ7dK6AVHuR0vmQVvriCyqE1pj/O1Zh5k
p5uhRSm5k0mApYrYcrOVe3FBe46elmF+jsGPKXvc0pJ14X91RHb1fKz1387yTI//
EpcFuJf5UMUzRiYYcdEIWlNw8Q3zOjwKmJ0aHwiXM+hM4/Elg+HaUUm+nklt4VR4
QoMaD0Iu8uVVkvh/h0SpAt8LonCa2nlDiyqqBJGxwZmj1NN/uUVenfReh6vN/PND
eNXDcaH4AOjSZeGCO9It/ma2XLlW9BSFsi33EB4aRCpF0ztFMhrtmjoYQ8ohBePg
zGHwBdcLY9/20tRSPPJNm5gg+RBB0/zn6EOgZ7V7l2OTbUXInohoxesL0w25dmMo
oBjU1qA+DRfeXs2CyRze
=rUNs
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--

--===============0946506944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0946506944==--
