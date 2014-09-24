From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 24 Sep 2014 11:42:06 +0300
Message-ID: <542283DE.5040909@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <54213543.7000306@ti.com> <20140923093916.GR30514@ulmo> <54215A17.8050606@ti.com> <20140923144509.GF5982@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Jo9olE8c3GOQiqCrjPwsn8tkKxBkBf3iu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:38354 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752169AbaIXImT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 04:42:19 -0400
In-Reply-To: <20140923144509.GF5982@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--Jo9olE8c3GOQiqCrjPwsn8tkKxBkBf3iu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 17:45, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 02:31:35PM +0300, Tomi Valkeinen wrote:
>> On 23/09/14 12:39, Thierry Reding wrote:
>>
>>> My point is that if you use plain phandles you usually have the
>>> meta-data already. Referring to the above example, bridge0 knows that=
 it
>>> should look for a bridge with phandle &bridge1, whereas bridge1 knows=

>>> that the device it is connected to is a panel.
>>
>> The bridge should not care what kind of device is there on the other
>> end. The bridge just has an output, going to another video component.
>=20
> You'll need to know at some point that one of the devices in a panel,
> otherwise you can't treat it like a panel.

The bridge doesn't need to treat it like a panel. Someone else might,
though. But the panel driver knows it is a panel, and can thus register
needed services, or mark itself as a panel.

>>>> Well, I can't say about this particular bridge, but afaik you can
>>>> connect a parallel RGB signal to multiple panels just like that, wit=
hout
>>>> any muxing.
>>>
>>> Right, but in that case you're not reconfiguring the signal in any wa=
y
>>> for each of the panels. You send one single signal to all of them. Fo=
r
>>
>> Yes, that's one use case, cloning. But I was not talking about that.
>>
>>> all intents and purposes there is only one panel. Well, I guess you
>>> could have separate backlights for the panels. In that case though it=

>>> seems better to represent it at least as a virtual mux or bridge, or
>>> perhaps a "mux panel".
>>
>> I was talking about the case where you have two totally different
>> devices, let's say panels, connected to the same output. One could tak=
e
>> a 16-bit parallel RGB signal, the other 24-bit. Only one of them can  =
be
>> enabled at a time (from HW perspective both can be enabled at the same=

>> time, but then the other one shows garbage).
>=20
> So we're essentially back to a mux, albeit maybe a virtual one.

Yes. Are you suggesting to model virtual hardware in .dts? I got the
impression that you wanted to model only the real hardware in .dts =3D).

But seriously speaking, I was thinking about this. I'd really like to
have a generic video-mux node, that would still somehow allow us to have
device specific configurations for the video sources and sinks (which
the endpoints provide us), without endpoints.

The reason endpoints don't feel right in this case is that it makes
sense that the mux has a single input and two outputs, but with
endpoints we need two endpoints from the bridge (which is still ok), but
we also need two endpoitns in the mux's input side, which doesn't feel
right.

I came up with the following. It's quite ugly, though. I hope someone
has ideas how it could be done in a neater way:

bridge1234 {
	bridge1234-cfg1: config1 {
		high-voltage;
	};

	bridge1234-cfg2: config2 {
		low-voltage;
	};
=09
	output =3D <&mux>;
};

mux: video-gpio-mux {
	gpio =3D <123>;

	outputs =3D <&panel1 &panel2>;
	input-configs =3D <&bridge1234-cfg1 &bridge1234-cfg2>;
};

panel1: panel-foo {

};

panel2: panel-foo {

};

So the bridge node has configuration sets. These might be compared to
pinmux nodes. And the mux has a list of input-configs. When panel1 is to
be enabled, "bridge1234-cfg1" config becomes active, and the bridge is
given this configuration.

I have to say the endpoint system feels cleaner than the above, but
perhaps it's possible to improve the method above somehow.

 Tomi



--Jo9olE8c3GOQiqCrjPwsn8tkKxBkBf3iu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIoPeAAoJEPo9qoy8lh71xoMQAJ0asuBeb6p8wfZHh6bVpF7D
I0I4+jVy239yAkDfv+wIB1b7z7KokAvG+GVUNDv5bTGFwv5B3GX055raJ//M0DMx
Be8OZ5H0LA/AkLQP5e9B79UHzoR/fwXartNVZ3AuiN4deIU6V5glJsL9tBzXQCmZ
Uc8TDRCO1dNeXfaAv3G/vDSCw3tuP1zjeiQ7bOfOY0CTfo5qVcYsL1VNGD6fc66f
E4/RlBiwUFyggbEAB101WtVL5/xWV4z/BGj8R4Pe4204n7as3LUZkZn20RVh+X2L
EgKxkY7Yjs2UvaOvnwZLWjVLA+js+Hq4w4nY7sjpATQa5l0GJ4AhlQucOwamKiAc
BMj8SAtIV9gyCX53U0l8YVwRQecWqnGdY5/bqx+ot+4mhCrpklKF2uYHYiv0u1Ll
9/FEfS1X67X6I6EfpdTFy9c5CC0QlEg//LHyZOklgGkl2FQLUigBRMe7mMLggjtW
qikdmuotbK8OQlrMjgC6eTK/+rA80ZKKrGXpU9WhsvR4sNX1qw0B2ecsWmShvNdM
sBDDuFyPWeRORsSu5MX9naDdQjzzESt2UcoYurGS8X7NRPS2qZlEoDuoYhcrwi6/
KnTwh8ClO/qBeXFOaHdMGt0EJkWMpymqip1E+Kg/A3TmNoj3XTvLRft8Zhy/EUmU
j6cKnPjt/Scpku8ygx1u
=Bj+m
-----END PGP SIGNATURE-----

--Jo9olE8c3GOQiqCrjPwsn8tkKxBkBf3iu--
