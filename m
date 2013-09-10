From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/6] spi: spi-s3c64xx: Add coherent buffers for DMA
 transfers
Date: Tue, 10 Sep 2013 13:02:28 +0100
Message-ID: <20130910120228.GF29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
 <20130909144509.GB29403@sirena.org.uk>
 <522F0141.1000905@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9PPZznLxL9KC9NUk"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40795 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3IJMCz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 08:02:55 -0400
Content-Disposition: inline
In-Reply-To: <522F0141.1000905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz_Czerwi=C5=84ski?= <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--9PPZznLxL9KC9NUk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 01:23:45PM +0200, =C5=81ukasz Czerwi=C5=84ski wrote:
> On 09/09/2013 04:45 PM, Mark Brown wrote:

> >This seems like a very low limit to have, consider things like firmware
> >downloads for example.  It seems reasonable to have a preallocated small
> >buffer but there should be some fallback for larger transfer sizes.

> I have tested my modification with different buffer sizes with
> S5C73M3 driver (355560 B upload). I obtained following upload times:

> 16kB buffer:
> 	- 83.972 ms
> 	- 79.196 ms
> 	- 79.432 ms
> 128kB buffer:
> 	- 74.449 ms
> 	- 80.719 ms
> 	- 75.599 ms

> For 256kB I obtained similar results as in 128kB case. Normally
> non-interrupted SPI transfer should take 56ms (50MHz). Performance
> loss is approximately about 6% between 16kB and 128KB buffer. I my
> opinion there are no need to use bigger buffers.

You're missing the point here.  This requires the client driver to know
the maximum transfer size that the controller supports and split the
transfer up for it.  This isn't something that the SPI API supports now
and while it would be useful to add for controllers that are genuinely
limited in transfer size it doesn't seem sane to just randomly impose a
limit to make life easier for software.  Not all applications will be
able to split their transfers up in the first place and it seems like
the wrong place to put that knowledge.

What I would expect to see the driver doing here is either allocating
a larger buffer on demand or (probably more reliably given the need for
contiguous physical memory) transparently splitting larger transfers.
A super smart implementation would overlap the copy of blocks with the
transfers of preceeding blocks, and there should be something we can do
to avoid having to copy data that's already in suitable memory.

Ideally this would all be factored out into the core based on limit
information but that's probably not required immediately.  Though now I
write that I'm wondering how many other devices should be doing this but
aren't.  The DMA mapping of transfer buffers doesn't seem terribly
device specific...

> I propose add extra module parameter which allows to change buffer size.

No, module parameters are not sensible for modern code.  If you wanted
runtime configuration a sysfs tunable would be better though I do think
that should be tuning optimisation, not a hard limit on the transfer
size.

--9PPZznLxL9KC9NUk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLwpRAAoJELSic+t+oim93VQP+gLfeEr14g84Q4FTLe5fQnHc
E2+PSFGCPUrm1XM4aikpeZFobQgPbEi9zYxIQ1lXJPJYNMObXUDQMHSrPh03oCxD
Jls3gThu4sZLSycDac5dnZk1v5XKc7BdXjD3oRgbSSDlZgGBOJogHfZwU0ULWWlu
a6R+8kPyUblGaX9g6mE75ZHM5zpYwqNqHMP6CQ8E3oK3KY19i+36MU2Vft8OAR+s
84W4lo7jjiJaLCzuJagC5pbSWEw7LUFz4zlRcHXt0SFHASaiAlyuA+4zGJniaw8/
jQnlK5EWCjrfGFtq5lFYBId1VeVJTUMAt7wngXjeIobQFofN6kLjIjcUC4/t9N7u
FUq4pV3SskCt8luAqvJz925eUHqsg78feXnwtoQw6QPfEG98rpQy/VU+hIYIdmw0
DcawgpDeuqbQ7VZnqhc5isIExNs3c9YF+DuRTtCyldPUc7ZkxYGgxN/1yC0ehfQ8
JFk5ixDOyCP1CulqutuKFoYDH2f3FHoREnOpzZiJQYdm8GLlKLOKdm/WLlkH38Xn
UpY7/iMM/fJZOEpo6jbIxE/DTG4DhAdj1xIyifYwrJMHHuEIQNwpflkJcAKbqmMe
4Sc6HrrsThZjqe7/ANzYHHMyOCtP4LFp3FUeBBUJ90o+mkN5CLcPP1/F1Q6p/Mc4
l8IZLoQMc5pLLsc+jcwp
=ae99
-----END PGP SIGNATURE-----

--9PPZznLxL9KC9NUk--
