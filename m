From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 17:42:41 +0300
Message-ID: <54203561.5090306@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com> <541C279A.2030601@ti.com> <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com> <541C3D95.7080200@ti.com> <20140922082647.GE1470@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="I2VsOJ5fxBKrG9sfSjDIoQqk3Ht8LNFld"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:39434 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754307AbaIVOm4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 10:42:56 -0400
In-Reply-To: <20140922082647.GE1470@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--I2VsOJ5fxBKrG9sfSjDIoQqk3Ht8LNFld
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/09/14 11:26, Thierry Reding wrote:
> On Fri, Sep 19, 2014 at 05:28:37PM +0300, Tomi Valkeinen wrote:
>> On 19/09/14 16:59, Ajay kumar wrote:
>>
>>> I am not really able to understand, what's stopping us from using thi=
s
>>> bridge on a board with "complex" display connections. To use ps8622 d=
river,
>>> one needs to "attach" it to the DRM framework. For this, the DRM driv=
er
>>
>> Remember that when we talk about DT bindings, there's no such thing as=

>> DRM. We talk about hardware. The same bindings need to work on any
>> operating system.
>>
>>> would need the DT node for ps8622 bridge. For which I use a phandle.
>>
>> A complex one could be for example a case where you have two different=

>> panels connected to ps8622, and you can switch between the two panels
>> with, say, a gpio. How do you present that with a simple phandle?
>=20
> How do you represent that with a graph? Whether you describe it using a=

> graph or a simple phandle you'll need additional nodes somewhere in
> between. Perhaps something like this:
>=20
> 	mux: ... {
> 		compatible =3D "gpio-mux-bridge";
>=20
> 		gpio =3D <&gpio 42 GPIO_ACTIVE_HIGH>;
>=20
> 		panel@0 {
> 			panel =3D <&panel0>;
> 		};
>=20
> 		panel@1 {
> 			panel =3D <&panel1>;
> 		};
> 	};
>=20
> 	ps8622: ... {
> 		bridge =3D <&mux>;
> 	};
>=20
> 	panel0: ... {
> 		...
> 	};
>=20
> 	panel1: ... {
> 		...
> 	};

Yes, it's true we need a mux there. But we still have the complication
that for panel0 we may need different ps8622 settings than for panel1.

If that's the case, then I think we'd need to have two output endpoints
in ps8622, both going to the mux, and each having the settings for the
respective panel.

>>> If some XYZ platform wishes to pick the DT node via a different metho=
d,
>>> they are always welcome to do it. Just because I am not specifying a
>>> video port/endpoint in the DT binding example, would it mean that pla=
tform
>>> cannot make use of ports in future? If that is the case, I can add so=
mething
>>
>> All the platforms share the same bindings for ps8622. If you now speci=
fy
>> that ps8622 bindings use a simple phandle, then anyone who uses ps8622=

>> should support that.
>>
>> Of course the bindings can be extended in the future. In that case the=

>> drivers need to support both the old and the new bindings, which is
>> always a hassle.
>>
>> Generally speaking, I sense that we have different views of how displa=
y
>> devices and drivers are structured. You say "If some XYZ platform wish=
es
>> to pick the DT node via a different method, they are always welcome to=

>> do it.". This sounds to me that you see the connections between displa=
y
>> devices as something handled by a platform specific driver.
>>
>> I, on the other hand, see connections between display devices as commo=
n
>> properties.
>>
>> Say, we could have a display board, with a panel and an encoder and
>> maybe some other components, which takes parallel RGB as input. The sa=
me
>> display board could as well be connected to an OMAP board or to an
>> Exynos board.
>>
>> I think the exact same display-board.dtsi file, which describes the
>> devices and connections in the display board, should be usable on both=

>> OMAP and Exynos platforms. This means we need to have a common way to
>> describe video devices, just as we have for other things.
>=20
> A common way to describe devices in DT isn't going to give you that. Th=
e
> device tree is completely missing any information about how to access a=
n
> extension board like that. The operating system defines the API by whic=
h
> the board can be accessed. I imagine that this would work by making the=

> first component of the board a bridge of some sort and then every drive=
r
> that supports that type of bridge (ideally just a generic drm_bridge)
> would also work with that display board.

I'm not sure I follow.

Obviously there needs to be board specific .dts file that brings the
board and the display board together. So, say, the display-board.dtsi
has a i2c touchscreen node, but the board.dts will tell which i2c bus
it's connected to.

Well, now as I wrote that, I wonder if that's possible... A node needs
to have a parent, and for i2c that must be the i2c master. Is that
something the DT overlays/fragments or such are supposed to handle?

But let's only think about the video path for now. We could have an
encoder and a panel on the board. We could describe the video path
between the encoder and the panel in the display-board.dts as that is
fixed. Then all that's needed in the board.dts is to connect the board's
video output to the encoders input with the video graph. Why would that
not work?

Sure, there's more that's needed. Common encoder and panel drivers for
one. But it all starts with a common way to describe the video devices
and the connections in the DT. If we don't have that, we don't have
anything.

> Whether this is described using a single phandle to the bridge or a mor=
e
> complicated graph is irrelevant. What matters is that you get a phandle=

> to the bridge. The job of the operating system is to give drivers a way=

> to resolve that phandle to some object and provide an API to access tha=
t
> object.

I agree it's not relevant whether we use a simple phandle or complex
graph. What matter is that we have a standard way to express the video
paths, which everybody uses.

 Tomi



--I2VsOJ5fxBKrG9sfSjDIoQqk3Ht8LNFld
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIDVhAAoJEPo9qoy8lh71FG4QAJ4/K2BYZlVHg/klQsTeXs83
MGA9ysRWRXX2lVQeYNF7tVyTWWXC1F+D3ml6lSZh5hyD7+HAth+pXZdoFIt3n6ms
vQFh3cGQaDe26nC9ZD7+2wX9C3QyhfyLRgANVR4CPfMrILzIONbsm9K1HpLDqep+
0FDuZq7dD6VwNOfnXHLMCPVPs8HcmfPG4v9P1E49XJjJ8tteE6pc3+9LpGn6FT8U
yZjmvjAcD8aXoQJbw7qx+sxikqOznshQy3ir0WyBRvKOEqQrtSGJt/seWnt+1zFo
LofZvd4ORMRLYzfJEoV+zFQqn4MZ7RiTLpB1/Dx7o3qwR78GHHFpcdo9ot6WrpO+
IsynjFQiphidvuuakZWFyIBIc+Ga/LXndyz0iWcubE9n1QuDuLJiqeULzPG9GLer
8yufmKrcUNskpEGAXxx6zsRCKUkfOQdVOWJrEhsfS6JvxBkcuX+uWRLZkzoVqLXq
VxZ3gtmh3sasSRGBXKvt/hlNr/ZCERU8O9P+3xws1D8Uf4baPiiZV/RD2J7A2+4K
ZbhrApe8AQ3mKfvLIMY2mFol7HrQ1KXIT1INy8gHzB1CnAUobGwA/zdfoiz43q+b
QLeYKE5K/+HaEE4DtyIFpeX2JQC2zjmPAZ2PpUtwEMy3OSQztAL/4KlxIsLX0VYj
GABHPLjYAoB7peAeOQ/1
=FLpC
-----END PGP SIGNATURE-----

--I2VsOJ5fxBKrG9sfSjDIoQqk3Ht8LNFld--
