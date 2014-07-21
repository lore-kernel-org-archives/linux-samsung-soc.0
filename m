From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 08/12] drm/bridge: ptn3460: Support bridge
 chaining
Date: Mon, 21 Jul 2014 14:40:54 +0200
Message-ID: <20140721124053.GC15238@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
 <20140721082223.GF8843@ulmo>
 <CAEC9eQO8yTwYd08_8Cu_o4VSLPZXMrmYPmszap_gcN_bvBVz3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:34069 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754141AbaGUMk6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 08:40:58 -0400
Received: by mail-we0-f170.google.com with SMTP id w62so7528466wes.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 05:40:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAEC9eQO8yTwYd08_8Cu_o4VSLPZXMrmYPmszap_gcN_bvBVz3A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 05:28:13PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> On Mon, Jul 21, 2014 at 1:52 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, Jul 18, 2014 at 02:13:54AM +0530, Ajay Kumar wrote:
> > [...]
> >> Also, remove the drm_connector implementation from ptn3460,
> >> since the same is implemented using panel_binder.
> >
> > I think that's a step backwards. In fact I think the panel-bridge binder
> > driver shouldn't be needed at all. At least not for now. We have a very
> > limited number of bridge drivers, so it shouldn't hurt at this stage to
> > implement the connector instantiation within each driver. Once we have
> > more bridge drivers, and therefore a better understanding of what they
> > need, we can always add something like the panel-binder (though I think
> > it should be library code, similar to the drm_encoder_helper_add() API,
> > rather than this kind of self-contained object).
> panel_binder was needed to wrap around panel as a bridge, and this was in=
 turn
> needed because people wanted to represent a bridge+panel combo as a chain
> of bridges.
> So, if we choose to drop panel_binder, we choose to drop the idea of chai=
ning
> the bridges, and end up calling drm_panel functions directly from
> individual bridges.
> And, the bridge will implement the connector functions as you suggested.
> I am okay with this, if Daniel/Rob don't have an issue with this.

I think bridge chaining and panel handling are separate issues. That's
why I think we shouldn't mix them like this. From earlier discussion[0]
the conclusion was that the final element in the chain should implement
a connector (with the appropriate type). Often that last element would
be an encoder (when there are no bridges). Sometimes the last element
would be a bridge. It's logical for that same element to also implement
the panel integration since it's closely tied to the connector.

Thierry

[0]: http://lists.freedesktop.org/archives/dri-devel/2014-May/059685.html

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzQpVAAoJEN0jrNd/PrOhxgIQALoiIkPTs3S+zX2Zp28uclrn
cCJnsFDHYFC/It07pBBh+4ZPuJqcfpOAjrx0nEuraGXr+uwacTx93JIRXWWHOk6h
XPn5UOu2hcR5ztWrMoAQcfFWhWZ46XajOhvR1Hfulw6Nq6Eme1Rbx5hMnh03cDiS
Ufl0o4b9aEuHkbXXvxtIs1gmlAiu51PwlCJfCPWWcv2yvlxhme9Q4MIOTYFTCMIQ
05Vg17hlGZ5sGBHhwc4mbYtLIe35DxA8K11991AG4f2JaL8yBo9cPHZqfui8B6aj
MMDeKodPJVXFwtWkLnCqK04TRH8wOpM7uNPOdr2UEbUyFCq5yUjSQ5NC/vIDWqf2
Qx9YNBV3lmFCNkw7QYHjINyGXWi2foWjiShvLTAgiMLLlVIl5OnACqN31izKeadm
muNks5grch+Wkft2n9Xh8efRUKGtVCeVfWMPMbT0y9IbQ5rTItpy8s3PLVUx63MB
qgFd59j98pJGdQv052An7pIUV1IZGZz+8TrkNhHI7Z1uQOZi3tTooWojKkHQd1Ll
BGtEVMGgSYsXN5w4uncdNJ3lzS57QFcanGTVNMsoCIIGr/veBOwEHt6EhNPjDEUA
lDkI6i3nywclyERwMsFebu34FoDntw5ehFXVay9jmiqjlkEvdQMEpWJRNpwZtts8
YpzAjxTq4q9wh5KBFEBZ
=hmhk
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
