From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 24 Sep 2014 11:27:55 +0300
Message-ID: <5422808B.1090505@ti.com>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo> <542140D3.8080806@samsung.com> <20140923101032.GU30514@ulmo> <54214CCE.7050102@samsung.com> <20140923144127.GE5982@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mRoMauvGAxRqAfb4RuQJaOGU9046OSDBK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:60991 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753196AbaIXI2I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 04:28:08 -0400
In-Reply-To: <20140923144127.GE5982@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

--mRoMauvGAxRqAfb4RuQJaOGU9046OSDBK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 17:41, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 12:34:54PM +0200, Andrzej Hajda wrote:
>> On 09/23/2014 12:10 PM, Thierry Reding wrote:
>>> On Tue, Sep 23, 2014 at 11:43:47AM +0200, Andrzej Hajda wrote:
>>>> On 09/23/2014 10:35 AM, Thierry Reding wrote:
>>> [...]
>>>>> But I agree that it would be nice to unify bridges and encoders mor=
e. It
>>>>> should be possible to make encoder always a bridge (or perhaps even=

>>>>> replace encoders with bridges altogether). Then once you're out of =
the
>>>>> DRM device everything would be a bridge until you get to a panel.
>>>> I agree that some sort of unification of bridges, (slave) encoders i=
s a good
>>>> thing, this way we stay only with bridges and panels as receivers.
>>>> But we will still have to deal with the code like:
>>>>     if (on the other end of the link is panel)
>>>>         do panel framework specific things
>>>>     else
>>>>         do bridge framework specific things
>>>>
>>>> The code in both branches usually does similar things but due to fra=
mework
>>>> differences it is difficult to merge.
>>> That's because they are inherently different entities. You can perfor=
m
>>> operations on a panel that don't make sense for a bridge and vice-ver=
sa.
>>>
>>>> Ideally it would be best to get rid of such constructs. For example =
by
>>>> trying to
>>>> make frameworks per interface type exposed by device (eg. video_sink=
) and
>>>> not by device type (drm_bridge, drm_panel).
>>> But then you loose all information about the real type of device.
>> Driver knows type of its device anyway. Why should it know device
>> type of devices it is connected to? It is enough it knows how to talk =
to
>> other device.
>> Like in real world, why desktop PC should know it is connected to DVI
>> monitor or to
>> DVI/HDMI converter which is connected to TV?
>=20
> TVs are much more standardized. There are things like DDC/CI which can
> be used to control the device. Or there's additional circuitry or
> control paths to change things like brightness. The same isn't true of
> panels.
>=20
>>>  Or you
>>> have to create a common base class. And then you're still back to
>>> dealing with the two specific cases in many places, so the gain seems=

>>> rather minimal.
>>
>> For example RGB panel and RGB/??? bridge have the same hardware input
>> interface.
>> Why shall they have different representation in kernel?
>=20
> Because panels have different requirements than bridges. Panels for
> example require the backlight to be adjustable, bridges don't.

I agree that panels and bridges are different, but not from the video
source's point of view. A bridge/encoder just streams video data to the
next entity in the chain, according to the given configuration. It does
not matter if the next one is a panel or another bridge. The source
bridge doesn't care if the next entity has a backlight or not.

I don't know if we need a different representation for bridges and
panels. Thinking about backlight, the driver can just register the
backlight device if it needs one. There's no need to differentiate
bridges and panels for that. But maybe there are other reasons that
warrant different representations.

However, my current feeling is that there's no need for different
representations.

 Tomi



--mRoMauvGAxRqAfb4RuQJaOGU9046OSDBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIoCLAAoJEPo9qoy8lh71XhUP/jN6/DA3db9P9qWeJRe/2/mz
XU4efdMcJZFWGq9O7dACbXSME0fAp764YAW+So/O5M1LcOL1DGv7VSxIXD+soxaS
rrS03oH+bxAjsMGV6v4EfV7tJxNWfI9kesnxx5E/GrY8AUXjOLI6OfNjZNIW3PHL
unWFkxl8fPR9ZfDgtxO24QUiSTz6PpqChA3EbJjNnFpCk+KY0WnTbNKqLWtCXtm1
XLLytE+Rif/rrWJ4tiMBo94eivYZuPACropWdQGRJ/nmOstgK6JEs/oY7hGWMduQ
cRdRBLSdLYKyLumYlJmJ167QgsyCF2VdDfi+pYM9PBbSYi0naMCcyUTWvggtSu5V
TCSZwQ1DiR/zQJ7uow2Py0IYT86Pk4nTBjq7+hD+PNILhbezaSQ3cAVFYZJ9KrUa
hYsxTmnhXrvE78QZGbJaBVTWHc2q28pIOCwkga5epeM5CqiGjqs6UafFGdjrJzMm
MVNlSpVjlXwKdYOVBMgZ7MZ/9w/CLwYleAZJOvEq8sy7TLw2oNubnaDRmt4tgOGC
SzN9qgrtiL4fDDllq5caRAbulU5Umd1vsLwqiasf2pD4Olz7BZ36J1LQPWB4qlhl
E8Yapd9lq7HsR18f86GEn1gzA3jR/PIXmLJqU8rfj0oMOyGpOl2eG1IsJXra7i/9
sUyAydazGvRpcZvN8MnO
=cEY9
-----END PGP SIGNATURE-----

--mRoMauvGAxRqAfb4RuQJaOGU9046OSDBK--
