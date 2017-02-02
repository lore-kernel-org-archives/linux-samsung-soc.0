From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Thu, 2 Feb 2017 18:58:17 +0100
Message-ID: <20170202175817.GC9055@ulmo.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com>
 <20170131085449.GA19348@ulmo.ba.sec>
 <e72546f1-bd3c-ac0b-9e94-352942293ff9@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35582 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752115AbdBBR6W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 12:58:22 -0500
Content-Disposition: inline
In-Reply-To: <e72546f1-bd3c-ac0b-9e94-352942293ff9@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 01:05:20PM +0100, Andrzej Hajda wrote:
> On 31.01.2017 09:54, Thierry Reding wrote:
> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> >>
> >> 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >>> Dear Thierry,
> >>>
> >>> Could you please review this patch?
> >> Thierry, I think this patch has been reviewed enough but no comment
> >> from you. Seems you are busy. I will pick up this.
> > Sorry, but that's not how it works. This patch has gone through 8
> > revisions within 4 weeks, and I tend to ignore patches like that until
> > the dust settles.
> >
> > Other than that, this continues the same madness that I've repeatedly
> > complained about in the past. The whole mechanism of running through a
> > series of writes and not caring about errors until the very end is
> > something we've discussed at length in the past.=20
>=20
> Yes, we have discussed the pattern, but without any conclusion. The
> pattern is correct, used in different places in kernel (see below for
> examples) and significantly decreases source code size. Disallowing it
> in panels subsystem just because of personal preferences of the
> maintainer does not seem to be proper.
>=20
> > It also in large parts
> > duplicates a bunch of functions from other Samsung panel drivers that I
> > already said should eventually be moved to something saner.
>=20
> Currently there are two Samsung panel drivers, one is on SPI bus,
> another one is on DSI.
> I am (co-)author of both drivers, they have some similarities but I did
> not see any gain in making additional abstractions over transport layer
> just to make one or two small functions common.
> Could you be more precise what are you talking about, or could you give
> a link to the mail where you said it. Anything I remember was a
> discussion about ugly magic initialization sequences due to poor
> documentation.
>=20
> And below promised examples of the error pattern, it was time consuming
> to find them, so please at least read them :)

I've done better, below is what I hope a list of good arguments why the
pattern is a bad idea, and why in some cases it can be justified.

> Almost exactly the same patterns for the same purpose:
>=20
> 1. http://lxr.free-electrons.com/source/drivers/net/ieee802154/atusb.c#L63
>     Citation from the code:
>     To reduce the number of error checks in the code, we record the
> first error
>     in atusb->err and reject all subsequent requests until the error is
> cleared.

That's about the worst example you could've used. Have you even looked
at the code that uses this? It's completely crazy. So here we have the
atusb_control_msg() function that stores this error, but then also
propagates it to its caller. One of these callers is atusb_read_reg(),
which also propagates the error or returns the register value if the
read was successful.

Now the really insane part is how this is then used in something like
atusb_write_subreg():

	orig =3D atusb_read_reg(atusb, reg);
	tmp =3D orig & ~mask;
	tmp |=3D (value << shift) & mask;
=09
	if (tmp !=3D orig)
		ret =3D atusb_write_reg(atusb, reg, tmp);

So let's assume that atusb_control_msg() fails in the call to
atusb_read_reg(). You'll be returning an error code, mask out some bits,
OR in new ones and write the result to the register. So not only does
the code not bother to check for errors, but it will also happily go and
corrupt registers when an error has occurred while reading.

> 2. http://lxr.free-electrons.com/source/drivers/md/dm-thin.c?v=3D4.4#L917

This is completely different from the panel driver because it's used to
store a value from within callbacks that can't return one.

> 3. http://lxr.free-electrons.com/source/net/9p/trans_fd.c?v=3D3.18#L297

Essentially the same thing.

> 4.
> http://lxr.free-electrons.com/source/drivers/media/v4l2-core/v4l2-ctrls.c=
#L2234

Looks like this could be replaced by the more idiomatic use of ERR_PTR()
encoding error codes. But the most significant difference here is that
each use of the handler_set_err() function is followed by a return. So
instead of ignoring errors like you do in the panel drivers, this does
recognize them and aborts early, rather than trying to go through the
remainder of the code, irrespective of how small the chances are of it
succeeding. Or ignoring that /even if/ the remainder didn't fail, the
one operation that fail might have been essential to the operation of
the device.

> 5. http://lxr.free-electrons.com/source/drivers/media/i2c/s5k5baf.c#L451

That's a particularly good example of why you shouldn't be doing this
kind of thing. Consider what would happen in these cases if for example
there was a problem with the I2C interface. There's a bunch of read and
write sequences in that driver that go completely without checking for
errors. Imagine how that will look to a user when the communication to a
chip doesn't work. They'll get a load of error messages all saying that
communication timed out, or that the slave isn't responding or what not.
And worse still, for timeouts you're also going to introduce a bunch of
error messages interleaved with potentially other useful messages from
other drivers or the core. Depending on the number of access you have it
might take seconds for all of the error messages to drain before you
notice somewhere at the end of the code that something went wrong and
decide to abort whatever you were trying to do.

>     This is my driver, I mention it here just to show it was not a
> problem to merge it to media subsystem.

That just shows what everybody knows: that maintainers care about
different things at different levels.

> Similar patterns:
>=20
> 6. http://lxr.free-electrons.com/source/fs/seq_file.c#L398
>     Do not process object if buffer is full, it allows to do not check
> buffer size after every write, for example:
> >     seq_printf(m, " hardirq-safe locks:            %11lu\n",
> >             nr_hardirq_safe);
> >     seq_printf(m, " hardirq-unsafe locks:          %11lu\n",
> >             nr_hardirq_unsafe);
> >     seq_printf(m, " softirq-safe locks:            %11lu\n",
> >             nr_softirq_safe);
> >     seq_printf(m, " softirq-unsafe locks:          %11lu\n",
> >             nr_softirq_unsafe);
> >     seq_printf(m, " irq-safe locks:                %11lu\n",
> >             nr_irq_safe);
> >     seq_printf(m, " irq-unsafe locks:              %11lu\n",
> >             nr_irq_unsafe);
> >
> >     seq_printf(m, " hardirq-read-safe locks:       %11lu\n",
> >             nr_hardirq_read_safe);
> >     seq_printf(m, " hardirq-read-unsafe locks:     %11lu\n",
> >             nr_hardirq_read_unsafe);
> >     seq_printf(m, " softirq-read-safe locks:       %11lu\n",
> >             nr_softirq_read_safe);
> >     seq_printf(m, " softirq-read-unsafe locks:     %11lu\n",
> >             nr_softirq_read_unsafe);
> >     seq_printf(m, " irq-read-safe locks:           %11lu\n",
> >             nr_irq_read_safe);
> >     seq_printf(m, " irq-read-unsafe locks:         %11lu\n",
> >             nr_irq_read_unsafe);
> >
> >     seq_printf(m, " uncategorized locks:           %11lu\n",
> >             nr_uncategorized);
> >     seq_printf(m, " unused locks:                  %11lu\n",
> >             nr_unused);
> >     seq_printf(m, " max locking depth:             %11u\n",
> >             max_lockdep_depth);
>=20
> Now try to imagine how it would look like if you add error checking
> after each call.

I think that's a fairly sane use-case for this kind of pattern. The big
difference is that this condition is checked in subsequent accesses to
shortcut failure paths. It's also very different in that it performs
writes to memory and those aren't going to fail. The root cause of this
overflow would be static in nature and likely found doing basic testing
and fixed by making the buffer larger.

That's contrary to a driver doing I/O (I2C, SPI, DSI, ...) that can fail
unexpectedly for any number of reasons.

>=20
> 7. http://lxr.free-electrons.com/source/lib/devres.c#L129
>     Postponed error check:
> > */res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);/*
> > /*b*/*/ase =3D devm_ioremap_resource(&pdev->dev, res);/*
> > */if (IS_ERR(base))/*
> > /**/*/return PTR_ERR(base);/*

Heh, I wrote that =3D)

This is also quite different from your usage in the panel driver. We do
not simply ignore failure from platform_get_resource(), instead we leave
it up to devm_ioremap_resource() to turn it into a meaningful error code
and message. The function does this very early on, so the error
condition is not ignored, as it is in the panel driver.

Also doing this helps with providing unified error codes and messages
across all callers, and removing a lot of boiler plate from drivers that
previously used to come up with all sorts of meaningless error codes and
completely inconsistent messages.

I hope this somewhat clarifies my opposition to your usage of the
pattern.

Thierry

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliTczcACgkQ3SOs138+
s6EV+g//RV1uZ3i2bzZpFLXYupdixLBDfy3ykLF0BQQ52Z34G9tM1BLRKs6RcXTX
KVyRhzcbCiX7xjCVIklc6X0VhgBQoBdPNzQkcADhFJXJ5DX6L6Jj22pDKiLQtOzl
5TaqZoPUfQnda4SZ0DMYYupWxmWs9CnWF6WAOgaLpo2KDQUOT9POOtfiiH4+aH68
+p77hWq72zSflHuih/BLCotAWCaRkhJ9bI/mTF0X9T4aDOKHRaLdYAJvNhHXZ13g
GuX85Keb+hXAQqWC7kATmqXRCeGft2yJLlXUr4RwxWE9UE4TVMKBE4XrqDDIhU3H
8MIEyZbYQ1Hs1MfYSJ6KZuPkyUz5eyOvTR+S2bH8WkuqgtAtT0Awq2MODAtk2FkR
SN3Y3r3xjkZWljRkYzsV3onRZEiPhRqbi94t1uoZyIp8o+HF0qG1yGvgGcIWuZVB
pNP6DGOG+ClsneqT6iPl6EhSWl58n6qs/G/pAKtJ5owK8qp6Kq0JsgyhZpIR33y8
WfzsVY1tdEzgQbHQuDf9BvJf1ks//+FWKL9AZyhbGG1LC9lO7WrgjCNhfBGs58Iw
wjt7bMWToICKAqMFUAYLxhfYwAj6699gh1vpjDvmmd26mVl29mYELf/Tj5wywq9e
taMfZRYPiHWeDD6+eqI5QsyWcfcfjoILdUxJLGRaiSFfCNXqht8=
=Wdbn
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
