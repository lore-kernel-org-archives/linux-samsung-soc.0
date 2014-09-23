From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 14:15:54 +0300
Message-ID: <5421566A.7050905@ti.com>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com> <541C279A.2030601@ti.com> <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com> <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo> <54203561.5090306@ti.com> <20140923055352.GB30514@ulmo> <54213250.8050107@ti.com> <20140923092815.GQ30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8QAob2xWlLCuvL3Mf5fCRSPGhbJws6dMu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:41347 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753694AbaIWLQO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:16:14 -0400
In-Reply-To: <20140923092815.GQ30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--8QAob2xWlLCuvL3Mf5fCRSPGhbJws6dMu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 12:28, Thierry Reding wrote:

>> But, for example, let's say that the board is designed in a way that f=
or
>> panel0 the bridge needs to output a bit higher level voltages than for=

>> panel1. That's not a property of the panel, so it can't be queried fro=
m
>> the panel.
>>
>> That feature (varying the voltage level) is specific to the bridge, an=
d
>> thus the properties should be in the bridge's DT data. So we need two
>> different configurations in the bridge, one for panel0 and one for
>> panel1. This is what endpoints give us.
>=20
> You could get the same by moving the mux in front of the bridge instead=
=2E

I didn't understand. Moving the mux between the SoC and the bridge? How
would that solve the problem. Or what do you mean with "in the front of
the bridge"?

> Trying to do this within the bridge's node directly has two flaws:
>=20
> 	1) It violates the DT principle of describing hardware. The
> 	   device itself does not know anything about multiple streams
> 	   and deals only with a single input and output. You'd be
> 	   describing a board specific aspect in the device binding.

We _are_ describing board specific aspects in the board.dts file. That's
what it is about.

If the board's hardware is such that the bridge's voltage level needs to
be higher when using panel0, that's very much describing hardware.

> 	2) Such a solution would have to be implemented for all bridge
> 	   devices that can potentially be muxed (really all of them).
> 	   If you describe it accurately in a separate mux node you get
> 	   genericity for free and it will work for all bridges.

I do agree that a generic mux is better if there's nothing special to be
configured. But how do you use a generic mux node for bridge device
specific features?

Well, I think it'd be great to have all bindings use ports/endpoints (or
a standard simpler representation), and have good helpers for those.
Then, the bridge driver would not need to know or care about endpoints
as such, it would just be told that this port & endpoint should be
enabled, and the bridge driver would get its configuration for that
endpoint, which it would program to the HW. And the same would happen
with or without complex video graph.

But that's not strictly required, the bridge driver could as well
support only single configuration. When someone uses the bridge in a
setup that requires multiple endpoints, he can then extend the driver to
support multiple endpoints.

>> I disagree. If we don't have a common way to describe the connections
>> between video devices, we cannot:
>>
>> - have a common helper library to parse the connections
>=20
> We have a common helper already. It's called of_parse_phandle().

Yes, but what is the name of the property, and where does it go? Does
the panel have a phandle to the bridge? Does the bridge have a phandle
to the panel?

>> - study the connections before the drivers are loaded
>=20
> Why would you need that?

I think this was discussed earlier, maybe Laurent remembers the use cases=
=2E

I think one possibility here is to have an understanding of the
pipelines even if the modules have not been loaded or a single device
has failed to probe.

>> - handle the connections anywhere else than the specific driver for th=
e
>> component
>=20
> Why should we do that?

We could, for example, have a single component (common or SoC specific)
that manages the video pipelines. The drivers for the
encoders/bridges/panels would just probe the devices, without doing
anything else. The master component would then parse the links and
connect the devices in whatever way it sees best.

>>> While there are probably legitimate cases where the video graph is
>>> useful and makes sense, in many cases terms like ports and endpoints =
are
>>> simply confusing.
>>
>> I again agree that I'd like to have a simpler representation than vide=
o
>> graphs for the simpler use cases. But again, I think it's important to=

>> have a standard representation for those connections.
>>
>> Why do you think it wouldn't be good to have a standard for the simple=
r
>> connections (in addition to the video graphs)? What kind of device
>> specific variations do you see that would be needed?
>=20
> What do you mean by standard? I agree that it would make sense to give
> properties standard names, but I don't think we need to go any further.=


Standard names and standard direction. I don't think there's anything
else to simple phandles.

> I mean, in the case of a simple phandle there's not much more to it
> anyway. But I fail to understand why standard properties should be a
> hard requirement.

And I fail to see why they should not be a hard requirement =3D).

> Having a standard representation only matters if you want to be able to=

> parse the pipeline without knowing about the device specifics. But I'm
> not sure I understand why you would want to do that. This sounds like
> you'd want some generic code to be able to construct a pipeline. But at=

> the same time you can't do anything meaningful with that pipeline
> because the generic code doesn't know how to program the pipeline. The
> only thing you'll get is a list of devices in the pipeline, but you can=

> do that by looking at the bindings and the DT content, no matter what
> the properties are named

You can, but then you need to know all the possible variations and ways
the phandles are used.

>> Even if the points I gave about why a common way to describe connectio=
ns
>> is important would not be relevant today, it sounds much safer to have=
 a
>> standard representation in the DT for the connections. I'd only go for=

>> device specific custom descriptions if there's a very important reason=

>> for that. And I can't come up with any reason.
>=20
> One of the good practices in DT is to keep property names similar to th=
e
> signal names of the chip to make it easy to correlate. So if you have a=

> bridge that converts RGB to LVDS and DSI for example, you'd have to
> describe two outputs. That's kind of difficult to do with standard
> property names. Well, it depends, you could do this:
>=20
> 	bridge {
> 		panels =3D <&lvds &dsi>;
> 	};
>=20
> Alternatively:
>=20
> 	bridge {
> 		lvds-panel =3D <&lvds>;
> 		dsi-panel =3D <&dsi>;
> 	};

Nothing says the bridge is connected to a panel, so "output" or such
would probably be better there.

> Or I guess you could do the same with ports/endpoints given that there
> are actually two outputs here. With endpoints it's of course difficult
> to correlate them without adding extra properties.
>=20
> 	bridge {
> 		ports {
> 			port@0 {
> 				endpoint@0 {
> 					remote-endpoint =3D <&lvds>;
> 				};
> 			};
>=20
> 			port@1 {
> 				endpoint@0 {
> 					remote-endpoint =3D <&dsi>;
> 				};
> 			};
> 		};
> 	};
>=20
> Note that you could also write it without graph but with a more similar=

> structure:
>=20
> 	bridge {
> 		lvds {
> 			panel =3D <&lvds>;
> 		};
>=20
> 		dsi {
> 			panel =3D <&dsi>;
> 		};
> 	};
>=20
> While it's true that it'd be more difficult to parse that in a generic
> way I also think it's a whole lot more readable than some abstract grap=
h
> where a lot of context is simply lost.

Yes, your examples are easier to read. Then again, it's simple to add /*
lvds */ comment on the full graph for clarity.

Also, I don't know if anything stops us from naming "port@0" to "lvds".
All the sub-nodes of "ports" are ports, so it's implicit. But then
again, I don't see that really buying much, as a simple comment does the
trick also.

 Tomi



--8QAob2xWlLCuvL3Mf5fCRSPGhbJws6dMu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIVZqAAoJEPo9qoy8lh71slMQAKrqY9gBRPSmx9O/ySL2y69S
+t4OfscGpSKyspzvSUVwZHaG3mrHVqEdOs8Wf9AGHTXk/fHKFxDEYz6OoVSqqwwB
0PhB+ZyR3hzJ+MuI+xtq+9wXaXfcCoeRlsfIr6VZMhgAENi5i1dua0Nz4+TOEt9L
gq0u4bN/IWxB1nkYOLMEflgEIyRT6d5vLOzyIWgarYKKZxOQHiHN8w3NHU0CZBhs
8HtaJnI7n3VAW3JleVB6qWpv80PoNRA9yt6abDCS5plM33viKEpxCTLMQzJdNbsv
5hfvpgj6mp1Qnv5py96MWlu+7TgYXygwVn1nNFE0nXEdFv3xeEYyPGuP42T/MCgq
yd2nGeHgzXK0xc40/oCOydIgNPFr1lqZvb3rpYMmFXwwXLiAPgUw4TC2ciKLmBf6
p2oE67MftYwyqzo1+h1t/d+ydd273BpEvyDXOKuAQHihZB2RPe27y7/k0yno9vvd
PF9o9s6FmeUQrtve29wRykUugbFS5xI5+hfwkhoZ7TehhrXswAshB5LeI2D1vTQW
whQPhxpuzbVHhwjR3g2fS/vWFgLWI52YHEtpSzbiW+LIlm0uhzoQjV7M5Y85AL1G
lSzcVmQi3hLzuIz5mpy0kfMXTW0CcJ7qLlw9yf7+7/BpddkMTmmCrQizo0DkEedk
U4tagwgZ+VSsU3T2bvVN
=0L3Y
-----END PGP SIGNATURE-----

--8QAob2xWlLCuvL3Mf5fCRSPGhbJws6dMu--
