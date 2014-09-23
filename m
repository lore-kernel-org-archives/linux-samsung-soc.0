From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 10:35:15 +0200
Message-ID: <20140923083514.GM30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0388174224=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5421201C.6000509@samsung.com>
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


--===============0388174224==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/jvaajy/zP2g41+Q"
Content-Disposition: inline


--/jvaajy/zP2g41+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 09:24:12AM +0200, Andrzej Hajda wrote:
> Hi Thierry, Tomi,
>=20
> On 09/23/2014 08:04 AM, Thierry Reding wrote:
> > On Mon, Sep 22, 2014 at 05:23:25PM +0300, Tomi Valkeinen wrote:
> >> On 22/09/14 11:06, Thierry Reding wrote:
> >>
> >>>>> Why do we need a complex graph when it can be handled using a simpl=
e phandle?
> >>>>
> >>>> Maybe in your case you can handle it with simple phandle. Can you
> >>>> guarantee that it's enough for everyone, on all platforms?
> >>>
> >>> Nobody can guarantee that. An interesting effect that DT ABI stability
> >>> has had is that people now try to come up with overly generic concepts
> >>> to describe devices in an attempt to make them more future-proof. I
> >>> don't think we're doing ourselves a favour with that approach.
> >>
> >> I kind of agree. However, there are boards that need a more complex
> >> approach than just a simple phandle. They are nothing new.
> >>
> >> So while it may be true that this specific encoder has never been used
> >> in such a complex way, and there's a chance that it never will, my
> >> comments are not really about this particular encoder.
> >>
> >> What I want is a standard way to describe the video components. If we
> >> have a standard complex one (video graphs) and a standard simple one
> >> (simple phandles), it's ok for me.
> >=20
> > I certainly agree that it's useful to have standard ways to describe at
> > least various aspects. For example I think it would be useful to add
> > standard properties for a bridge's connections, such as "bridge" or
> > "panel" to allow bridge chaining and attaching them to panels.
> >=20
> > But I think that should be the end of it. Mandating anything other than
> > that will just complicate things and limit what people can do in the
> > binding.
> >=20
> > One of the disadvantages of the video graph bindings is that they are
> > overly vague in that they don't carry information about what type a
> > device is. Bindings then have to require additional meta-data, at which
> > point it's become far easier to describe things with a custom property
> > that already provides context.
>=20
> I think it is opposite, graph bindings should describe only the link and
> certainly not what type of device is behind the endpoint. The fact we
> may need that information is a disadvantage of Linux frameworks and
> should be corrected in Linux, not by adding Linux specific properties to
> DT. For example display controller should not care where its output goes
> to: panel, encoder, bridge, whatever. It should care only if the
> parameters of the link are agreed with the receiver.

Well, a display controller is never going to attach to a panel directly.
But I agree that it would be nice to unify bridges and encoders more. It
should be possible to make encoder always a bridge (or perhaps even
replace encoders with bridges altogether). Then once you're out of the
DRM device everything would be a bridge until you get to a panel.

I think we discussed this a while back in the context of bridge
chaining.

Thierry

--/jvaajy/zP2g41+Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUITDCAAoJEN0jrNd/PrOhrmoP/1PTvVhXY6izh+Kt41Yy3HAE
pOZ4fl1NL+NXabu/MEZgN0fHGH4xQQl57WA+CXHHqOW2hi/u/k953tvclHyF+noq
tZqXktZcplelqSfcwZZSisoaoq4zdvztOZ6g/wrHwcT4ET/gnOOx9g9cmnnITvNN
Op8FLQe8gjMfcDMW9gOqt22D3YtGlQ91a7wBw81QFmKfkJqfQElt0XyUEpTeZAo/
yz5rkOGYH2doBCeiPXuyACwSmu8oGTQefMOlGX9GFVRcLo5LFxF9BasJAsZM5t8D
0mZz14WTPQshw1Wk3K0YPxAikTaHZ3+9N0QlPsK5YB08khplFydGp431N38gDwlH
2TGOSwI2mfNma9HJeU03wNDPUHa1ManAIEthFG15LDJiK8K6vnW2/NnUOeLcR1ey
9kAgf3hFtjlRXVVbhFnPuTmsUyYLMWoG7yBEilS+HPOcjlGjNYl0b2YcewYPPLnZ
ecb5uHIc/sAEtOvLJYVEs9YtPM6Z8mOlCz1Ky3GGFf5/HkLSn5ZEkS9hUdlyjBnj
EzJ6+EqI6wU+aoIorTcBoFqIrCLCzP+y/vzTf50ABL7MzVIxexcPJEIJFm0bu2X8
vDexF29Maz1oAwO493jb3RIEnA9/bW0xj4fgB6ckv9NFKwk4WhqKFwZIVw/EDDfX
px3t5gauIvhsdQ+9Cqtw
=KoGf
-----END PGP SIGNATURE-----

--/jvaajy/zP2g41+Q--

--===============0388174224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0388174224==--
