From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 18:25:42 +0300
Message-ID: <542190F6.10403@ti.com>
References: <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com> <541C279A.2030601@ti.com> <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com> <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo> <54203561.5090306@ti.com> <20140923055352.GB30514@ulmo> <54213250.8050107@ti.com> <20140923092815.GQ30514@ulmo> <5421566A.7050905@ti.com> <20140923142941.GC5982@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WbiQ4cPloiB2ufibjnjl6fsBgpTM1XCMd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:45132 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932150AbaIWP0O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 11:26:14 -0400
In-Reply-To: <20140923142941.GC5982@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--WbiQ4cPloiB2ufibjnjl6fsBgpTM1XCMd
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 17:29, Thierry Reding wrote:

>>> Trying to do this within the bridge's node directly has two flaws:
>>>
>>> 	1) It violates the DT principle of describing hardware. The
>>> 	   device itself does not know anything about multiple streams
>>> 	   and deals only with a single input and output. You'd be
>>> 	   describing a board specific aspect in the device binding.
>>
>> We _are_ describing board specific aspects in the board.dts file. That=
's
>> what it is about.
>>
>> If the board's hardware is such that the bridge's voltage level needs =
to
>> be higher when using panel0, that's very much describing hardware.
>=20
> You misunderstood. It's describing a use-case rather than the device
> itself. You describe, *within the device node*, that it can be muxed
> whereas the device itself doesn't know anything about muxing. That's
> where the violation is. You require a board-integration issue to be
> described in the binding of a specific device.

The .dts files are not only about hard HW features. The .dts files are
full of configuration properties and such. So while the aim should be to
describe only the HW, I think it's well within the limits to describe
things like whether to enable/disable HW features for a particular output=
=2E

I guess there could be an external mux node, and that mux node could
contain HW specific properties for both the inputs and outputs of the
mux. The input and output drivers could fetch their features from that
mux's node.

But that sounds much worse, than having ports/endpoints and HW specific
properties there. (or actually, does it... it would simplify some
things, but how would the bridge driver get its properties...).

And I don't quite see your point. Presuming we have a property in the
bridge for, say, "higher-voltage-level", which with simple phandles
would be present in the main bridge node, and presuming that's ok. (Is
it in your opinion? That is describing configuration, not HW.)

If so, I don't think it's different than having two endpoints, each with
their own property. In that case we just have the wires from the single
output going into to destinations, and so we need to different places
for the property.

>>> We have a common helper already. It's called of_parse_phandle().
>>
>> Yes, but what is the name of the property, and where does it go? Does
>> the panel have a phandle to the bridge? Does the bridge have a phandle=

>> to the panel?
>=20
> My point was that we don't need a common helper library if we have a wa=
y
> of getting at the phandle and resolve the phandle to a bridge or a
> panel. While I think standard names can be advantageous, using the
> regular of_parse_phandle() and a lookup function we don't even need
> them.

Well, we have also cases where the more complex video graphs are needed
(or, at least, are not too complex, so they could well be used). If so,
it'd be nice to have the driver manage the connections via a single API,
which would underneath manage both the video graphs and simple phandles,
depending on what is used in the .dts file.

>>>> - study the connections before the drivers are loaded
>>>
>>> Why would you need that?
>>
>> I think this was discussed earlier, maybe Laurent remembers the use ca=
ses.
>>
>> I think one possibility here is to have an understanding of the
>> pipelines even if the modules have not been loaded or a single device
>> has failed to probe.
>=20
> I don't see how that would be useful.

Ok. But it's still something that can be done with standardized
bindings, and cannot be done with non-standardized.

>>>> - handle the connections anywhere else than the specific driver for =
the
>>>> component
>>>
>>> Why should we do that?
>>
>> We could, for example, have a single component (common or SoC specific=
)
>> that manages the video pipelines. The drivers for the
>> encoders/bridges/panels would just probe the devices, without doing
>> anything else. The master component would then parse the links and
>> connect the devices in whatever way it sees best.
>=20
> You don't need any of that. The SoC driver simply obtains a phandle to
> the first bridge connected to it. That bridge will already have done th=
e
> same for any chained bridges. There's no need to connect them in any wa=
y
> anymore because they are already properly set up.

Yes, there are different ways to do this in the SW side. The point is,
with standard bindings we have many different options how to do it. With
non-standard bindings we don't.

If there are no strong reasons to use non-standard bindings, I don't see
why we would not standardize them.

>>> Having a standard representation only matters if you want to be able =
to
>>> parse the pipeline without knowing about the device specifics. But I'=
m
>>> not sure I understand why you would want to do that. This sounds like=

>>> you'd want some generic code to be able to construct a pipeline. But =
at
>>> the same time you can't do anything meaningful with that pipeline
>>> because the generic code doesn't know how to program the pipeline. Th=
e
>>> only thing you'll get is a list of devices in the pipeline, but you c=
an
>>> do that by looking at the bindings and the DT content, no matter what=

>>> the properties are named
>>
>> You can, but then you need to know all the possible variations and way=
s
>> the phandles are used.
>=20
> Which is described in the DT bindings. Really, the DT should be
> describing the device in whatever is the most natural way for that
> device. It is the job of the OS to abstract things away so that
> components can be seemlessly integrated. The DT doesn't need to (and
> shouldn't) have that kind of abstraction.

But here we're discussing about how the device connects to other
devices. That's not internal to the device in question.

And really, I don't understand your reluctance for standardizing the
connection bindings. The only argument so far I've heard was that
property "lvds" is easier to understand for a human when reading the
=2Edts file than "output0".

You must agree that standardizing enables the uses I've been describing,
even if you may not agree that they should be implemented. So, having
them standardized is safer option. If the only drawback is that you may
need to write /* lvds */ comment in the .dts to be human-friendly, well,
I'm for it.

>>>> Even if the points I gave about why a common way to describe connect=
ions
>>>> is important would not be relevant today, it sounds much safer to ha=
ve a
>>>> standard representation in the DT for the connections. I'd only go f=
or
>>>> device specific custom descriptions if there's a very important reas=
on
>>>> for that. And I can't come up with any reason.
>>>
>>> One of the good practices in DT is to keep property names similar to =
the
>>> signal names of the chip to make it easy to correlate. So if you have=
 a
>>> bridge that converts RGB to LVDS and DSI for example, you'd have to
>>> describe two outputs. That's kind of difficult to do with standard
>>> property names. Well, it depends, you could do this:
>>>
>>> 	bridge {
>>> 		panels =3D <&lvds &dsi>;
>>> 	};
>>>
>>> Alternatively:
>>>
>>> 	bridge {
>>> 		lvds-panel =3D <&lvds>;
>>> 		dsi-panel =3D <&dsi>;
>>> 	};
>>
>> Nothing says the bridge is connected to a panel, so "output" or such
>> would probably be better there.
>=20
> Hmm? How does the above not say that the bridge is connected to a panel=
?

Sorry, let me rephrase: nothing says the bridge must be connected to a
panel. The bridge could be connected to another encoder on some board.
And I don't think the bridge should know or care what kind of device it
is connected to.

 Tomi



--WbiQ4cPloiB2ufibjnjl6fsBgpTM1XCMd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIZD2AAoJEPo9qoy8lh71ToIP/AkQQ6k33WxdAtngA0W5+2ao
z93vpNhR7bK8TfWiSn9hyIEG7pXNAPxE1oCGcf80CoE1tspXUVK04nWiCwrArvtD
i5ZR8plovf/cUsjC4gTGTfhv07kNI1+eauLQcxRkidkDYPOovOTLGhleJR16tlw5
Qw8U6b6dlh600ZsMubQ5l79wM/cHYYawWOHIxgcBj1qj1Oz5SrausDmHQJtSzQrR
P9f2QQWgrN9aOKIO/TZtwyAuJ9BvDAFDoUTbJhFT8Zz20Gxx5QPfQkjPJrhyv6UW
AS0UmMtDLgG+CixaamHl1op1NKj50iNOarRQxW0Hksouvinaqh3Vyd3QkVI25SwZ
uo6Cg+qlo+Hsz2B3Do26SdUB/Os0mOxoCWAq0jmZtnAHtThwocPg5Uc7KUJ0j6mg
wAnEGjdSdZhYHAC3U81Vnz4/Jk2Ym4rJONwqOdol0wtnG9vkyD6KXB9XzOPYayac
I0qAI9ntEPtvL+gshbcw3lGaLZIPt3T0lX7PBmUg4uA3RIVlOr8A0onVFld022sQ
/fvWNzI4KRjbbNxWZN514Yf1/sF8snRKY3/gyd/3wg5WIn8oNPfUsbviey5JJX5s
lZzOubMSsK8ky49byfkq/sb8TgC48CjhNnuIzg6Ad8hrYMLLk61pfHNQ4a+bbQdE
52UnO8sfxbkzx4ILjfVR
=K+LM
-----END PGP SIGNATURE-----

--WbiQ4cPloiB2ufibjnjl6fsBgpTM1XCMd--
