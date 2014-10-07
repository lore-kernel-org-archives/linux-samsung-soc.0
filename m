From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 7 Oct 2014 10:06:10 +0300
Message-ID: <543390E2.1080108@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <20140923144509.GF5982@ulmo> <542283DE.5040909@ti.com> <353158006.4Zqtrv9CtX@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MvlkbJLE7MAhNI2kc0gsXGtLcvW8miOFi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:52048 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751223AbaJGHGc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 03:06:32 -0400
In-Reply-To: <353158006.4Zqtrv9CtX@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

--MvlkbJLE7MAhNI2kc0gsXGtLcvW8miOFi
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 06/10/14 17:40, Laurent Pinchart wrote:

>> But seriously speaking, I was thinking about this. I'd really like to
>> have a generic video-mux node, that would still somehow allow us to ha=
ve
>> device specific configurations for the video sources and sinks (which
>> the endpoints provide us), without endpoints.
>>
>> The reason endpoints don't feel right in this case is that it makes
>> sense that the mux has a single input and two outputs, but with
>> endpoints we need two endpoints from the bridge (which is still ok), b=
ut
>> we also need two endpoitns in the mux's input side, which doesn't feel=

>> right.
>>
>> I came up with the following. It's quite ugly, though. I hope someone
>> has ideas how it could be done in a neater way:
>>
>> bridge1234 {
>> 	bridge1234-cfg1: config1 {
>> 		high-voltage;
>> 	};
>>
>> 	bridge1234-cfg2: config2 {
>> 		low-voltage;
>> 	};
>>
>> 	output =3D <&mux>;
>> };
>>
>> mux: video-gpio-mux {
>> 	gpio =3D <123>;
>>
>> 	outputs =3D <&panel1 &panel2>;
>> 	input-configs =3D <&bridge1234-cfg1 &bridge1234-cfg2>;
>> };
>>
>> panel1: panel-foo {
>>
>> };
>>
>> panel2: panel-foo {
>>
>> };
>>
>> So the bridge node has configuration sets. These might be compared to
>> pinmux nodes. And the mux has a list of input-configs. When panel1 is =
to
>> be enabled, "bridge1234-cfg1" config becomes active, and the bridge is=

>> given this configuration.
>>
>> I have to say the endpoint system feels cleaner than the above, but
>> perhaps it's possible to improve the method above somehow.
>=20
> Isn't it possible for the bridge to compute its configuration at runtim=
e by=20
> querying properties of the downstream video entities ? That would solve=
 the=20
> problem neatly.

You mean the bridge driver would somehow take a peek into panel1 and
panel2 nodes, looking for bridge specific properties? Sounds somewhat
fragile to me... How would the bridge driver know a property is for the
bridge?

 Tomi



--MvlkbJLE7MAhNI2kc0gsXGtLcvW8miOFi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUM5DqAAoJEPo9qoy8lh71oYcQAKSTFpRixvYktSf3tmaL/Vy1
Kasr0gVwI/vX2VLgLkmfdda+vh9a0PwbsMyopGpCKPeWSS90C4JG8TqfpNHOXvck
j4KqqTqxITtfNsAOXUccypiLYfmItneUMAW6MkXHpSax4d/qnk5m6VbJnek3VSGu
VHSjnewOwYFNQDEJCBv9ZX/RMZwtEDWb4KMAkilZxHtpG1UX32GVeUu4GQfltMmB
EuH+ytXS1PI0HnrWjeOAI/pZ0rLk9uR4jEt9+VZ4J9hupt+cTJke2B23vSvMTa+t
zr288J2QL0OTUZ2TY025rl8Xv/d1JATc+zdjDcxZ9HozGpx9kKOS4WejUlr8lale
ltgiET47wNm+HKdt/+rjrQ9QZeLCS7NmHPwQxBiyzgGWKC5xbs9rKu0pcBD1O/8f
mRZqLko5XXvRwld+k66/LdMhQ0vHN6GkjO7+uloOUGAyKH1IZb1DmByvQ5bQHjhy
fA5TynLAqnOa+gmoAsBHuBqAOSSuD3EmLpa1hDF6CDlV5B/1njWg4aPe7VoNXw/e
Nk/N+/5KC0WASqey6qPhd/fPHoHB6pMYhutQ0IT26tSlx441j1SZCJNGFvM4xsNY
3Et9PvJWfw2ceNI4f2SfWR2+VlEoRKmcAvJ7m9CHf8/JMYAK60pZNAhKGJSGGY7e
pwqRCPNfq1uq+0ovqo53
=K6jW
-----END PGP SIGNATURE-----

--MvlkbJLE7MAhNI2kc0gsXGtLcvW8miOFi--
