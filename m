From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: Move initialization code to subsys_initcall()
Date: Tue, 13 Jan 2015 14:13:51 +0200
Message-ID: <54B50BFF.7070101@ti.com>
References: <1421031182-18992-1-git-send-email-jy0922.shim@samsung.com> <20150112075019.GB22880@pengutronix.de> <54B38946.3020406@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="iI3MAAHggr3CCbDxlKcOkft5JgOFI0cjV"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B38946.3020406-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?windows-1252?Q?Uwe_Klei?= =?windows-1252?Q?ne-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--iI3MAAHggr3CCbDxlKcOkft5JgOFI0cjV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/01/15 10:43, Joonyoung Shim wrote:
> +Cc Tomi Valkeinen,
>=20
> Hi Uwe,
>=20
> On 01/12/2015 04:50 PM, Uwe Kleine-K=F6nig wrote:
>> Hello,
>>
>> On Mon, Jan 12, 2015 at 11:53:02AM +0900, Joonyoung Shim wrote:
>>> This is required in order to ensure that core system devices such as
>>> voltage regulators attached via I2C are available early in boot.
>> Deferred probing isn't an option? If so I suggest adding the reasoning=

>> in a comment to stop the next person converting it to that.
>> (And if not, please fix accordingly to use deferred probing.)
>>
>=20
> I couldn't get penguin logo since the commit 92b004d ("video/logo:
> prevent use of logos after they have been freed") and i just tried old
> way because i missed the flow to move to deferred probing.
>=20
> Fb driver probe seems to be ran between fb_logo_late_init late_initcall=

> and the freeing of the logos.
>=20
> Any ideas?

Thierry mentioned on IRC that he encountered the same issue. And I
encountered it also.

So... I'd rather not revert the fix, as it's quite a nasty one, and it
happens while console lock is held, so it looks like the machine just
froze. But I don't know how it could be improved with the current kernel.=


We could make the logos non-initdata, but I don't much like that option.
Or we could perhaps implement some new way to catch the freeing of initda=
ta.

Any other ideas?

 Tomi



--iI3MAAHggr3CCbDxlKcOkft5JgOFI0cjV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtQv/AAoJEPo9qoy8lh715hEP/2KxcNjGHYW9kbG+Y08qI0/Y
fefr77YGaEuXychbUvSJDI2RhGZB/TCmtCBdOHEoKM5/U8q8PsPEh1ZbA7R2Alko
6vBTY6LfnLfkhnDNioBw/ZcKn8Le/TyTufbb0D6oJ7QjDR5VQA9A7+SUA43PupsO
nvE8iuSb9FDat2eWRUus1Wzqe4uaSVeRUqXuXkJPZQkkmXNAmUg11yOkGOrinxaq
7a1+VQUM2Ae6duqGy34FVjgfFYRrdBqqjTDz3PlBfXhJfignK4zM7YUvSNDhCBr0
dFMIKw8kb4nRjsgnof4s3hFR7exQXIr8Y5Hn3frO8/qMIoiM6Pl6MUJK30BJu+w5
9FazY19c6+4ukk0VQ/yHsOxpbNZoLnUTdhN/E1U9j+Eu/Z6s6AavAom/Bk7zXVzw
FBIRjGgXFrNH8amnqI09YyJsasFpMd7zgqVVVFEmdTTfEVVDvqtBI6h41aEi5lVJ
BzikU0BXBhRLWFJDgZdO/DgvVGlvlrY49tyolwPexibTVZvpdVRhGPAY000N6VzS
tadEdEqpmX5xxSxOEWiQiDCJizbnbQV5F2GqlhK6RQrHzaj0KhPuHvSy02+wo1bq
AiVtD5pWZAcSW74vSS0GPRKyvDI/TFHuM+zz3RhhytwdcK+UYIZh8r8dLCHzGqJ9
7FIOKIc81kW+eVaXTB5J
=yEoM
-----END PGP SIGNATURE-----

--iI3MAAHggr3CCbDxlKcOkft5JgOFI0cjV--
