From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 17 Sep 2014 19:22:05 +0300
Message-ID: <5419B52D.4060107@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>	<5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bj9opPDSCuirbbxlvEUQGsT3KSIt3rIxG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:53399 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755339AbaIQQWU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 12:22:20 -0400
In-Reply-To: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--bj9opPDSCuirbbxlvEUQGsT3KSIt3rIxG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/09/14 17:29, Ajay kumar wrote:
> Hi Tomi,
>=20
> Thanks for your comments.
>=20
> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.com>=
 wrote:
>> On 27/08/14 17:39, Ajay Kumar wrote:
>>> Add documentation for DT properties supported by ps8622/ps8625
>>> eDP-LVDS converter.
>>>
>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>> ---
>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++=
++++++++++
>>>  1 file changed, 20 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps=
8622.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.tx=
t b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>>> new file mode 100644
>>> index 0000000..0ec8172
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>>> @@ -0,0 +1,20 @@
>>> +ps8622-bridge bindings
>>> +
>>> +Required properties:
>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
>>> +     - reg: first i2c address of the bridge
>>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pin.
>>> +     - reset-gpios: OF device-tree gpio specification for RST_ pin.
>>> +
>>> +Optional properties:
>>> +     - lane-count: number of DP lanes to use
>>> +     - use-external-pwm: backlight will be controlled by an external=
 PWM
>>
>> What does this mean? That the backlight support from ps8625 is not use=
d?
>> If so, maybe "disable-pwm" or something?
> "use-external-pwm" or "disable-bridge-pwm" would be better.

Well, the properties are about the bridge. "use-external-pwm" means that
the bridge uses an external PWM, which, if I understood correctly, is
not what the property is about.

"disable-bridge-pwm" is ok, but the "bridge" there is extra. The
properties are about the bridge, so it's implicit.

>>> +
>>> +Example:
>>> +     lvds-bridge@48 {
>>> +             compatible =3D "parade,ps8622";
>>> +             reg =3D <0x48>;
>>> +             sleep-gpios =3D <&gpc3 6 1 0 0>;
>>> +             reset-gpios =3D <&gpc3 1 1 0 0>;
>>> +             lane-count =3D <1>;
>>> +     };
>>>
>>
>> I wish all new display component bindings would use the video
>> ports/endpoints to describe the connections. It will be very difficult=

>> to improve the display driver model later if we're missing such critic=
al
>> pieces from the DT bindings.
> Why do we need a complex graph when it can be handled using a simple ph=
andle?

Maybe in your case you can handle it with simple phandle. Can you
guarantee that it's enough for everyone, on all platforms?

The point of the ports/endpoint graph is to also support more
complicated scenarios. If you now create ps8622 bindings that do not
support those graphs, the no one else using ps8622 can use
ports/endpoint graphs either.

Btw, is there an example how the bridge with these bindings is used in a
board's .dts file? I couldn't find any example with a quick search. So
it's unclear to me what the "simple phandle" actually is.

 Tomi



--bj9opPDSCuirbbxlvEUQGsT3KSIt3rIxG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGbUtAAoJEPo9qoy8lh71rwgP/jHS3li105hVmsyA911FbbMo
uLCClXVJoPtH97SOw4VZHhX9TbWeprIinZLQqZ8SzLXzAHVfQ2vYziReb5K+N/pu
jr/bieh862KCAeAGRWmEm1dlp6r5StagVwv3ascXrnSLvn1YE/8eC9GsR+K9sCnE
vKL/OlxUCm8AunsN/JmE+237ZjUjFt4Saqb0s5AYUsFsJ68NafjwKzq1Hz4o87BD
mx1CnnUri8m0Dt2aGwxLp+T3jFmOEAHK23/eLfu96iISguM+bbVtXfArhX9jINWT
Iz+gYMk0O/LzkNOMDd2UtSaszqrBmWyp7Fvt4bSGCy9jUsWUZpdM0IaNNnaydCxP
xO0r7i0w1lkZfLKTdhseXnRUtG6XQSWqYL8AZE23t/aD6nTNm8hswdM/ic5wDCB0
PJ7rSqIoOe3QoUTDViT1r3oR9iMh/cAE03rNf8o04i5J7hE3CdySH41owp0K2qLA
g6W93hRwLLhgeaHTy9JaLTxR+5uAJOLSPz4OTqaaBUxyl/GNzm+bp/JSOXrSmMw8
0taj++9gr/84zqfGbsmEfdFg8KaNT58atUGq6ie+ZD/dY/FvPXkKAGNVn3YubyXA
DQJ+oypN9XFsipSVHjSfvLDPlg1dvKQVUPCrASGxNeVcExt2wH+BZtyCchvUAXkq
wRf4tFGFMUs0rky2J7AG
=VgET
-----END PGP SIGNATURE-----

--bj9opPDSCuirbbxlvEUQGsT3KSIt3rIxG--
