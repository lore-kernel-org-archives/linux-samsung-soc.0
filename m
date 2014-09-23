From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 08:04:53 +0200
Message-ID: <20140923060452.GD30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0385659742=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <542030DD.3060906@ti.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0385659742==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 05:23:25PM +0300, Tomi Valkeinen wrote:
> On 22/09/14 11:06, Thierry Reding wrote:
>=20
> >>> Why do we need a complex graph when it can be handled using a simple =
phandle?
> >>
> >> Maybe in your case you can handle it with simple phandle. Can you
> >> guarantee that it's enough for everyone, on all platforms?
> >=20
> > Nobody can guarantee that. An interesting effect that DT ABI stability
> > has had is that people now try to come up with overly generic concepts
> > to describe devices in an attempt to make them more future-proof. I
> > don't think we're doing ourselves a favour with that approach.
>=20
> I kind of agree. However, there are boards that need a more complex
> approach than just a simple phandle. They are nothing new.
>=20
> So while it may be true that this specific encoder has never been used
> in such a complex way, and there's a chance that it never will, my
> comments are not really about this particular encoder.
>=20
> What I want is a standard way to describe the video components. If we
> have a standard complex one (video graphs) and a standard simple one
> (simple phandles), it's ok for me.

I certainly agree that it's useful to have standard ways to describe at
least various aspects. For example I think it would be useful to add
standard properties for a bridge's connections, such as "bridge" or
"panel" to allow bridge chaining and attaching them to panels.

But I think that should be the end of it. Mandating anything other than
that will just complicate things and limit what people can do in the
binding.

One of the disadvantages of the video graph bindings is that they are
overly vague in that they don't carry information about what type a
device is. Bindings then have to require additional meta-data, at which
point it's become far easier to describe things with a custom property
that already provides context.

> >> The point of the ports/endpoint graph is to also support more
> >> complicated scenarios.
> >=20
> > But the scenario will always remain the same for this bridge. There will
> > always be an input signal and a translation to some output signal along
> > with some parameters to control how that translation happens. More
> > complicated scenarios will likely need to be represented differently at
> > a higher level than the bridge.
>=20
> Yes, there's always one active input and one output for this bridge.
> What the video graphs would bring is to have the possibility to have
> multiple inputs and outputs, of which a single ones could be active at a
> time. The different inputs and outputs could even have different
> settings required (say, first output requires this bit set, but when
> using second output that bit must be cleared).

As discussed elsewhere this should be handled at a different level then.
DT should describe the hardware and this particular bridge device simply
doesn't have a means to connect more than a single input or more than a
single output.

Thierry

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIQ2EAAoJEN0jrNd/PrOhTpYQAI9XyPrIb5zyS9oj67TEP7W2
TXqJxHB+z6fmfqUcyPOZPbGYBSJM74hPTrctHuRerKl8azA6TH5hTPzpz72zAbOr
DRygtPlNCkYEtbp+GEYRwoECNxatGnsHGobw+c6U87xqExlGcOSH1O+IgalmnfPx
QUs+LYW3NJxNkwtl9BhyuvYCE5RCVJC6O0DKCJeYMFhUuEjvgqZY12DORAWhI8vD
3RQVPoVVLcDPZLfxtCUq9hxuBdtnJ6pXTDFhQEll+aL1UYtOiR+ApC3g/bOjrE5K
q6zp3+S1ziBPwLf6wbnNYwLdmj59XZboc1HMyH7b0ww9/i1Re5HaVNmNHpF7u4z6
ktTQwulH1cOQihoY1H26AhVS/D9MWf/fMznK3YnbyQFJSKU3OQls3f9gFyxs+CM7
X6M4q9GS9jLdfmu4oaTn2pV39joE3/o28IgQkXz0VquyltbiPsx+6bePV117aboH
MCDpcg01rRRSKKmAgCZzT0OeP8PGIlFGrZifxVOqT+R2+owvNXq3pi50aORX20kb
3i+2qBAxJmUc7YE0Mu47Jy8MTqIlshSkYlQVn4RxISivjqY0sug0BYBzZdJOkTOo
Cnr2AB9zCwwcG76Cq1N33jhEDZoQiZv9EkanFJh8mW8HtzhUkc3esexLClBtIM3/
SmazL8i+Aae5DRC2Ibst
=j3pt
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--

--===============0385659742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0385659742==--
