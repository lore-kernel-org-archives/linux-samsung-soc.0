From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 12:40:24 +0300
Message-ID: <54214008.4040105@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="jgPCRJOE9GamS4RJAFkDs7x7i3DQ7dEj4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:37725 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543AbaIWJki (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 05:40:38 -0400
In-Reply-To: <20140923083514.GM30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

--jgPCRJOE9GamS4RJAFkDs7x7i3DQ7dEj4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 11:35, Thierry Reding wrote:

> Well, a display controller is never going to attach to a panel directly=
=2E

With parallel RGB, that (almost) happens. There's voltage level shifting
probably in the middle, but I don't see anything else there.

> But I agree that it would be nice to unify bridges and encoders more. I=
t
> should be possible to make encoder always a bridge (or perhaps even
> replace encoders with bridges altogether). Then once you're out of the
> DRM device everything would be a bridge until you get to a panel.

What exactly is a bridge and what is an encoder? Those are DRM
constructs, aren't they?

As I see it, a video pipeline consist of a video source (display
controller usually), a chain of encoders (all of which may not be
strictly "encoders", they could be level shifters, muxes, ESD protection
devices or such), and either a display device like a panel or a
connector to outside world.

Am I right that in DRM world the encoder is the first device in the
display chain after the display controller, and the next is a bridge?
That sounds totally artificial, and I hope we don't reflect that in the
DT side in any way.

 Tomi



--jgPCRJOE9GamS4RJAFkDs7x7i3DQ7dEj4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIUAIAAoJEPo9qoy8lh71bQkQALID0gvQwN2K5pzBAC/4w2Kk
8XxJyySfCoAy72MKHSAWXTZ41QzMQ5FFErHeR589EtzJkzxxQ2zSz7+r0dYq2is2
E9p06RR0p2EuYNmx2PZme1iGeLYJcITbvRwwdTQBy7I1a5cbzHQGZdI2s8gB7c3N
EgaVYT9FL0mBDU8foTJVCNdtP8yohElgScE2EuIwigykrK26SGmXmFXHd33dUo9s
KWrN6wNSxtdNHDcYe2BvwUefuiU0O+1O5kYbgOs02aIg73A3ksv1a2RDPW2KoR9k
TfGVr27Cvbf2diw1fiv6yKYGuCkBOGIK89Rt5bc8gRmUpXYvbc37QVwE1QFSyBb0
jJWquHhhLqtPdmFn5fpOA7f86GN4ncxaz49DkbA3oCp+fLXS+pp4oIFVrYkALEA/
g4GpOvMEevyrIgrmyoUEk3KXcZu7eo714YS65/jM3hK8e8rr90rYMbddvLcKUGwr
L2ffaZeYbdgvqQFvhjv85/XhAE0xuy5RJBMhfhbko4jRuYg6A5eq8Ga8DbOgea4P
S+m0jF5XheJU8deCE/c2VX4KBB0ophj5IFELZ8W8FG0f32NzrASSCAMXZprs1WvI
3BGqM2OwNUUdb9yF/WLEn4FdEyXmvcUxODMDslWRLP7KQqUVqHPcwBq6ThgvWbGb
Ze+VdOPpTZAmVGirAshW
=ZVuj
-----END PGP SIGNATURE-----

--jgPCRJOE9GamS4RJAFkDs7x7i3DQ7dEj4--
