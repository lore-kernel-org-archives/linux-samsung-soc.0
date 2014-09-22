From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 17:04:54 +0300
Message-ID: <54202C86.3040808@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ouoOF6nDtBTlAdS2skRcwT5LTd5qbflLc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:51163 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753486AbaIVOFK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 10:05:10 -0400
In-Reply-To: <20140922075424.GB1470@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--ouoOF6nDtBTlAdS2skRcwT5LTd5qbflLc
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/09/14 10:54, Thierry Reding wrote:

>> I wish all new display component bindings would use the video
>> ports/endpoints to describe the connections. It will be very difficult=

>> to improve the display driver model later if we're missing such critic=
al
>> pieces from the DT bindings.
>=20
> I disagree. Why would we want to burden all devices with a bloated

I agree that the .dts becomes more bloated with video graph.

> binding and drivers with parsing a complex graph when it's not even

Hopefully not all drivers will need to do the parsing themselves. If
it's common stuff, I don't see why we can't have helpers to do the work.

> known that it will be necessary? Evidently this device works fine
> using the current binding. Just because there are bindings to describe

Well, I can write almost any kind of bindings, and then evidently my
device would work. For me, on my board.

> ports in a generic way doesn't mean it has to be applied everywhere.
> After all the concept of ports/endpoints applies to non-video devices
> too, yet we don't require the bindings for those devices to add ports
> or endpoints nodes.

I guess non-video devices haven't had need for those. I have had lots of
boards with video setup that cannot be represented with simple phandles.
I'm not sure if I have just been unlucky or what, but my understand is
that other people have encountered such boards also. Usually the
problems encountered there have been circumvented with some hacky video
driver for that specific board, or maybe a static configuration handled
by the boot loader.

> Also it won't be very difficult to extend the binding in a backwards
> compatible way if that becomes necessary.

I don't know about that. More or less all the cases I've encountered
where a binding has not been good from the start have been all but "not
very difficult".

Do we have a standard way of representing the video pipeline with simple
phandles? Or does everyone just do their own version? If there's no
standard way, it sounds it'll be a mess to support in the future.

If there's much objection to the bloatiness of video graphs, maybe we
could come up with an simpler alternative (like the phandles here), and
"standardize" it. Then, if common display framework or some such ever
realizes, we could say that if your driver uses CDF, you need to support
these video graph bindings and these simpler bindings to be compatible.

However, I do have a slight recollection that alternative
simplifications to the video graph were discussed at some point, and,
while I may remember wrong, I think it was not accepted. At least I had
one method to simplify the ports/endpoints, but that was removed from
the patches I had.

 Tomi



--ouoOF6nDtBTlAdS2skRcwT5LTd5qbflLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUICyGAAoJEPo9qoy8lh71tWgP/28Y3SRoNHXnFODozFhgQKsk
jCQk0OtQuBfxJn/M1vHvRk87y1IYRyr3HbeA0wSOpKuTTNAt4NxfQFAQEP8WgQ1v
JbEJR0c3vSTF3evSXydzyQizKQQElPundrG0xvc6xmbi3sBGSKbnfdhOLJa8CLAW
eJ4VfLR1zn4MIZncJ6FNLsPlKpgbJOcdjlBqDu9u71RivL3T7eTTzH5yhvFIzYlA
e17nV5yvjwi1VbG9rBLPZziWLyconwMqiY9pVWFLLf2NpSkKUd4rCO2AJOq8szvu
/Q6T8KVzqTjIhRbo/O/687DHI4HcSFyXKGPP+x7rqVBiPJrnjPLYDnZgtsjZr3tV
Rd36NqV+KiClJkoKX2fGy1FWyF7OGvWZmmC0Mg6RRmq/wGcefLSGtdLe7L/UJStM
8YuT3W+bzB2toYFvThyoWzQaxj+ku5dOd1ByucDbDQLkfKkERpfdTLmtlxoHFz5O
2unh5GS5rkqBuetQls4PVrYxj+YrQK19dDDdEKuzXUrhif41G8r/VieOmCwhA2k9
zd72uVXekwKZdiqJw6HVo+SuR9sAp0gD5l1u4utirHd8HG/PAer0jYM92AQySRe5
AMfStUZTus27B4HZxQcSDORh7h2WUTlbAeqq6UcS0hW24BJ3AaXDoQKNdDx/pgZf
KDGZ7deRQ4C28gvqPthm
=zv0g
-----END PGP SIGNATURE-----

--ouoOF6nDtBTlAdS2skRcwT5LTd5qbflLc--
