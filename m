From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 12:01:40 +0200
Message-ID: <20140923100139.GT30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
 <54214008.4040105@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1938467845=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54214008.4040105@ti.com>
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


--===============1938467845==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YqKeQn+qkMVHQmbT"
Content-Disposition: inline


--YqKeQn+qkMVHQmbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 12:40:24PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 11:35, Thierry Reding wrote:
>=20
> > Well, a display controller is never going to attach to a panel directly.
>=20
> With parallel RGB, that (almost) happens. There's voltage level shifting
> probably in the middle, but I don't see anything else there.

The level shifting could be considered an encoder. Anyway, I didn't mean
physically attach to a panel but rather in DRM. You'll always need an
encoder and connector before you go to the panel.

> > But I agree that it would be nice to unify bridges and encoders more. It
> > should be possible to make encoder always a bridge (or perhaps even
> > replace encoders with bridges altogether). Then once you're out of the
> > DRM device everything would be a bridge until you get to a panel.
>=20
> What exactly is a bridge and what is an encoder? Those are DRM
> constructs, aren't they?

Yes. I think bridges are mostly a superset of encoders.

> As I see it, a video pipeline consist of a video source (display
> controller usually), a chain of encoders (all of which may not be
> strictly "encoders", they could be level shifters, muxes, ESD protection
> devices or such), and either a display device like a panel or a
> connector to outside world.

Well, the panel itself is attached to a connector. The connector is
really what userspace uses to control the output and indirectly the
panel.

> Am I right that in DRM world the encoder is the first device in the
> display chain after the display controller,

Yes.

>                                             and the next is a bridge?

A bridge or a connector. Typically it would be a connector, but that's
only if you don't have bridges in between.

> That sounds totally artificial, and I hope we don't reflect that in the
> DT side in any way.

Yes, they are software concepts and I'm not aware of any of it being
exposed in DT. A display controller is usually implemented as DRM CRTC
object and outputs (DSI, eDP, HDMI) as encoder (often with a connector
tied to it).

Thierry

--YqKeQn+qkMVHQmbT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIUUDAAoJEN0jrNd/PrOhF5AP/3xynALdWz1uhZONDGZz/jKW
gfI8A4mfF62ftSnq7+5tzhW01gNj6m1nST2bsT2Yc7TopNenQF29afSMq9Mqvgm4
svGxgrMkNmv3JZhzlpEV6v9C4iXvAceu8C3597bGM3TxB0Xm7aZzQXBGm/czQbC9
uh8/dFi8/GevtVnmmW3da/mb311DVv+ya83O60lXkY//KQ8Gn8nXkNt8lesbDpcA
BCet7Izh/thYHLnqt5d/fDG5Vz/8BBxkTcjZAByQgCl2vNbuA8HVkki3RAM2T5PU
IhQW+tTG2GOYGca7SFweD5ZUXs2JNN44994YP/u6b8QRe2bB56GosQ5corxNJKR2
AMgOlM3Qg0lI/EGpjZIa/+C3mV1gqzPUTQsvGJeiRujwRIZiGHiSn6ObSXOy1Hgw
30qrHlIaIXVa7HP2BpDd5ItFg+p79BqhWrKRtNJV6KmF5wpsJEmMJyJSOKifuaCW
KzeIkxmeUrwPyNAiRsqdTai6Igk3pATF53oTu5DZQ2WfZGcPqPT3WJBbkVhhadBL
mEFGK4kllE/CPPtkC4PZMuh/YXTzEsIif1L94AKUs7lcldooaKKP2sFcsyF9Wkq/
rda4AI1xqHpsJefhyGzvDL2VuA0jDMpxDj/VGBQb7PS5ksltAlbnYXTzEW2xsbZA
fmWL+egEh2WAqSc+8dZ/
=L3HE
-----END PGP SIGNATURE-----

--YqKeQn+qkMVHQmbT--

--===============1938467845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1938467845==--
