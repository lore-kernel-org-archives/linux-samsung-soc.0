From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 18:33:56 +0300
Message-ID: <542192E4.70007@ti.com>
References: <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo> <54214008.4040105@ti.com> <20140923100139.GT30514@ulmo> <54216308.2050500@ti.com> <20140923143854.GD5982@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Vmdnb98vIaeNujKO45Rdwubr57Umr90wh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:46035 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755301AbaIWPeX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 11:34:23 -0400
In-Reply-To: <20140923143854.GD5982@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

--Vmdnb98vIaeNujKO45Rdwubr57Umr90wh
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 17:38, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 03:09:44PM +0300, Tomi Valkeinen wrote:
>> On 23/09/14 13:01, Thierry Reding wrote:
>>> On Tue, Sep 23, 2014 at 12:40:24PM +0300, Tomi Valkeinen wrote:
> [...]
>>>> What exactly is a bridge and what is an encoder? Those are DRM
>>>> constructs, aren't they?
>>>
>>> Yes. I think bridges are mostly a superset of encoders.
>>
>> Superset in what way? If I have a SiI9022 RGB-to-HDMI encoder embedded=

>> into my SoC (i.e. a DRM encoder), or I have a board with a SiI9022
>> encoder on the board (i.e. a DRM bridge), what is different?
>=20
> Superset in what they represent from a software point of view. As in:
> an encoder /is a/ bridge. Though they aren't currently implemented that=

> way.

So they are equal, not superset? Or what does an encoder do that a
bridge doesn't?

>>>> As I see it, a video pipeline consist of a video source (display
>>>> controller usually), a chain of encoders (all of which may not be
>>>> strictly "encoders", they could be level shifters, muxes, ESD protec=
tion
>>>> devices or such), and either a display device like a panel or a
>>>> connector to outside world.
>>>
>>> Well, the panel itself is attached to a connector. The connector is
>>> really what userspace uses to control the output and indirectly the
>>> panel.
>>
>> Yep. That's also something that should be fixed. A connector SW entity=

>> is fine when connecting an external monitor, but a panel directly
>> connected to the SoC does not have a connector, and it's the panel tha=
t
>> should be controlled from the userspace.
>=20
> I disagree. A panel is usually also attached using some sort of
> connector. Maybe not an HDMI, VGA or DP connector, but still some sort
> of connector where often it can even be removed.

Yes, but a normal panel connector is really just an extension of wires.
There is no difference if you wire the panel directly to the video
source, or if there's a connector.

I think usually connectors to the external world are not quite as
simple, as there may be some protection components or such, but even if
there's nothing extra, they are still a clear component visible to
outside world. For HDMI you (sometimes) even need properties for the
connector, like source for +5V, i2c bus, hotplug pin.

But even if there are no extra properties like that, I still think it's
good to have a connector entity for a connector to outside world.
Whereas I don't see any need for such when the connector is internal.
That said, I don't see any reason to prevent that either.

> Panels are theoretically hot-pluggable, too, much in the same way that
> monitors are.

So are encoders, in the same way. I have a main board, with a video
connector. That goes to an encoder on display board, and that again has
a connector, to which the panel is connected.

I also have a panel that can be conneted directly to the main board's
video output.

>> But again, the legacy...
>=20
> You've got to make the abstraction somewhere, and I'm quite surprised
> actually how well the DRM abstractions are working out. I mean we can
> support anything from HDMI to DP to eDP, DSI and LVDS with just the
> connector abstraction and it all just works. That makes it a pretty
> good abstraction in my book.

Yes, I agree it's good in the sense that it works. And much better than
fbdev, which has nothing. But it's not good in the sense that it's not
what I'd design if I could start from scratch.

 Tomi



--Vmdnb98vIaeNujKO45Rdwubr57Umr90wh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIZLkAAoJEPo9qoy8lh71GZ8QALHkbERHVUntoY56uoQqpTPz
0vM5X1IYHw7UwYqgjbsEKwGL1jm/uHJkmH6rKgyx63GBKvE1N4TbqBlwp7zsrmQo
hhQefPyWlWhO4dDjurhhXVk58K01mplJEp1gEzWsj4O76omJLLUGQ6yHCZ+b9MUu
Q25XlVN5YXT7dYWCLOd3+IY65lNAduS6dUfHkAERvmTj4ec45bwXbGwPErsMZ7Gk
1OwO7MJvo8YMKi8pcTXzOk15Ezmp5ZwBnKRgO0FwW83aVeatjE3v9dqR7w7s2BOv
1eeSCWYg7BfmXREGNA7AKxklrZBOk9HKyHHTnO/BmDiKqgkI8aGejh3kXjNn34oj
0e6jJRAppNWZYPcxxqAahtB5eASE7QAyAJ9BvqcNqlPlSQNaaVmGKJA9z7kujsGF
6kOw6YjX/natCtzB5LAKwcLT8w0URMtM9/GWr0WUZDuZVjdcmgjaC3BqrcbNw0OJ
FEXH6cmt3RFnYT+ALjF+8U1eLFPKfj4IaT7kzMbUOsORB5MIU19eWuzUJhuQhuan
OM0KOCQQ9VhAqNhLB7j/Y6pB3w+rtViJrF5nORvrHQiGzc4Giiy0Vi6YCUCbVhOa
Gqz6o790Imdk8yB6sLiLWTNwkJQrlmCnVYJ9nMDAMNG9bhZTaCPyevsu0blGu34v
gcRmohpCHXJ91lMmHfMU
=B9JS
-----END PGP SIGNATURE-----

--Vmdnb98vIaeNujKO45Rdwubr57Umr90wh--
