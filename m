From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Mon, 6 Feb 2017 11:39:16 +0100
Message-ID: <20170206103916.GG27607@ulmo.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com>
 <20170131085449.GA19348@ulmo.ba.sec>
 <e72546f1-bd3c-ac0b-9e94-352942293ff9@samsung.com>
 <20170202175817.GC9055@ulmo.ba.sec>
 <74940581-911f-ecdb-e503-6ec2ef8a5177@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74940581-911f-ecdb-e503-6ec2ef8a5177-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 09:54:42AM +0100, Andrzej Hajda wrote:
> Hi Thierry,
>=20
> Finally something technical :)
>=20
> On 02.02.2017 18:58, Thierry Reding wrote:
> > On Tue, Jan 31, 2017 at 01:05:20PM +0100, Andrzej Hajda wrote:
> >> On 31.01.2017 09:54, Thierry Reding wrote:
> >>> On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> >>>> 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >>>>> Dear Thierry,
> >>>>>
> >>>>> Could you please review this patch?
> >>>> Thierry, I think this patch has been reviewed enough but no comment
> >>>> from you. Seems you are busy. I will pick up this.
> >>> Sorry, but that's not how it works. This patch has gone through 8
> >>> revisions within 4 weeks, and I tend to ignore patches like that until
> >>> the dust settles.
> >>>
> >>> Other than that, this continues the same madness that I've repeatedly
> >>> complained about in the past. The whole mechanism of running through a
> >>> series of writes and not caring about errors until the very end is
> >>> something we've discussed at length in the past.=20
> >> Yes, we have discussed the pattern, but without any conclusion. The
> >> pattern is correct, used in different places in kernel (see below for
> >> examples) and significantly decreases source code size. Disallowing it
> >> in panels subsystem just because of personal preferences of the
> >> maintainer does not seem to be proper.
> >>
> >>> It also in large parts
> >>> duplicates a bunch of functions from other Samsung panel drivers that=
 I
> >>> already said should eventually be moved to something saner.
> >> Currently there are two Samsung panel drivers, one is on SPI bus,
> >> another one is on DSI.
> >> I am (co-)author of both drivers, they have some similarities but I did
> >> not see any gain in making additional abstractions over transport layer
> >> just to make one or two small functions common.
> >> Could you be more precise what are you talking about, or could you give
> >> a link to the mail where you said it. Anything I remember was a
> >> discussion about ugly magic initialization sequences due to poor
> >> documentation.
> >>
> >> And below promised examples of the error pattern, it was time consuming
> >> to find them, so please at least read them :)
> > I've done better, below is what I hope a list of good arguments why the
> > pattern is a bad idea, and why in some cases it can be justified.
> >
> >> Almost exactly the same patterns for the same purpose:
> >>
> >> 1. http://lxr.free-electrons.com/source/drivers/net/ieee802154/atusb.c=
#L63
> >>     Citation from the code:
> >>     To reduce the number of error checks in the code, we record the
> >> first error
> >>     in atusb->err and reject all subsequent requests until the error is
> >> cleared.
> > That's about the worst example you could've used. Have you even looked
> > at the code that uses this? It's completely crazy. So here we have the
> > atusb_control_msg() function that stores this error, but then also
> > propagates it to its caller. One of these callers is atusb_read_reg(),
> > which also propagates the error or returns the register value if the
> > read was successful.
> >
> > Now the really insane part is how this is then used in something like
> > atusb_write_subreg():
> >
> > 	orig =3D atusb_read_reg(atusb, reg);
> > 	tmp =3D orig & ~mask;
> > 	tmp |=3D (value << shift) & mask;
> > =09
> > 	if (tmp !=3D orig)
> > 		ret =3D atusb_write_reg(atusb, reg, tmp);
> >
> > So let's assume that atusb_control_msg() fails in the call to
> > atusb_read_reg(). You'll be returning an error code, mask out some bits,
> > OR in new ones and write the result to the register. So not only does
> > the code not bother to check for errors, but it will also happily go and
> > corrupt registers when an error has occurred while reading.
>=20
> Not true, in case of error in atusb_read_reg atusb_write_reg will do
> nothing because atusb->err is set !
> And this is strong point of the idiom - you will not be able to perform
> transfer until the error is explicitly cleared.

Yes, I see now that there's an additional check before further accesses
can be made. So I have to apologize to the author and it turns out that
the code isn't crazy. I suppose it's me that's too stupid to understand
how this works.

I wouldn't have been confused if this was using a more idiomatic way of
doing things. The mere fact that code will read/modify/write registers
unconditionally suggests that there's no error checking going on. Even
if the code doesn't actually corrupt registers, it does have the effect
of executing a bunch of instructions completely unnecessarily.

To add to the confusion there are other parts in the driver that don't
seem comfortable using the idiom and you'll actually see things like:

	ret =3D atusb_write_subreg(...);
	if (ret)
		return ret;

If you ask me, that's bound to lead to mistakes at some point.

> With this idiom it is enough to put guards only in one/two/few places,
> in traditional error handling you just need to put checks after every
> function call and it is quite common situation that developers forgot to
> do that, for example look at mipi calls here [1] :)
> [1]:
> http://lxr.free-electrons.com/source/drivers/gpu/drm/i915/intel_dsi_panel=
_vbt.c#L160
>=20
> So the function is correct, but to avoid fooling unaware readers I would
> add error checking after read:
>=20
>     orig =3D atusb_read_reg(atusb, reg);
>     if (atusb->err)
>         return err;

But then what's the point of storing the error somewhere in the first
place?

> >> 2. http://lxr.free-electrons.com/source/drivers/md/dm-thin.c?v=3D4.4#L=
917
> > This is completely different from the panel driver because it's used to
> > store a value from within callbacks that can't return one.
>=20
> This is internal framework of the driver, so nothing prevents developer
> from implementing callbacks that return value.
> Apparently storing error in the object(struct dm_thin_new_mapping) is
> good and convenient  :)

No, I think this comes from the fact that the device mapper and block
I/O frameworks have infrastructure that doesn't allow the error code to
be directly propagated (see the copy_complete() and overwrite_endio()
callbacks).

> >> 3. http://lxr.free-electrons.com/source/net/9p/trans_fd.c?v=3D3.18#L297
> > Essentially the same thing.
>=20
> The same here.

Yes, this seems like it could easily be done using propagated error
codes.

> >> 4.
> >> http://lxr.free-electrons.com/source/drivers/media/v4l2-core/v4l2-ctrl=
s.c#L2234
> > Looks like this could be replaced by the more idiomatic use of ERR_PTR()
> > encoding error codes. But the most significant difference here is that
> > each use of the handler_set_err() function is followed by a return. So
> > instead of ignoring errors like you do in the panel drivers, this does
> > recognize them and aborts early, rather than trying to go through the
> > remainder of the code, irrespective of how small the chances are of it
> > succeeding. Or ignoring that /even if/ the remainder didn't fail, the
> > one operation that fail might have been essential to the operation of
> > the device.
>=20
> I have an impression that you do not understand the idiom. It does not
> allow to ignore error - as soon as the error is detected, guard is set
> and no further harm can be done.
> Going back to V4L2, look at the usage of the idiom [2]:
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_gen, NULL);
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_vid, NULL);
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_aud, NULL);
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_streaming, NULL);
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_sdtv_cap, NULL);
>                  v4l2_ctrl_add_handler(hdl_vid_cap, hdl_loop_cap, NULL);
>                  if (hdl_vid_cap->error)
>                          return hdl_vid_cap->error;
>=20
> Again, the point is you do not need to use old construct, which enlarges
> the code about three times:
>     err =3D func(obj,...);
>     if (err < 0)
>         return err;
>=20
> Instead you just call func(obj,...), and the burden of error checking is
> put into the function, but for this err must be stored in object.
>=20
> [2]:
> http://lxr.free-electrons.com/source/drivers/media/platform/vivid/vivid-c=
trls.c#L1630

There are a couple of pitfalls here: for example what do you do if the
first two calls fail, but the third succeeds. The end result will be
that the whole operation fails. What do you do if one of the operations
has side-effects that you need to undo? If you don't know which one it
was, how will you know?

And yes, this does allow you to ignore errors. The function calls before
the actual error handling will be executed regardless of errors that are
stored. While in many cases the code seems to correctly shortcut if the
guard is set, it also encodes many assumptions, not all of which may be
understood by morons like me.

The end result is that the code becomes more vulnerable to accidental
mistakes. These will be hard to spot during review. Keeping code linear
and simple makes it much more difficult to introduce bugs.

> >> 5. http://lxr.free-electrons.com/source/drivers/media/i2c/s5k5baf.c#L4=
51
> > That's a particularly good example of why you shouldn't be doing this
> > kind of thing. Consider what would happen in these cases if for example
> > there was a problem with the I2C interface. There's a bunch of read and
> > write sequences in that driver that go completely without checking for
> > errors.=20
>=20
> Not true, no further transfer will be performed.

Indeed. Clearly I wasn't looking closely enough. How about knowing
whether or not reads or writes succeed? To do so you would have to
explicitly check the error code again.

> > Imagine how that will look to a user when the communication to a
> > chip doesn't work. They'll get a load of error messages all saying that
> > communication timed out, or that the slave isn't responding or what not.
> > And worse still, for timeouts you're also going to introduce a bunch of
> > error messages interleaved with potentially other useful messages from
> > other drivers or the core. Depending on the number of access you have it
> > might take seconds for all of the error messages to drain before you
> > notice somewhere at the end of the code that something went wrong and
> > decide to abort whatever you were trying to do.
>=20
> Again, not true at all.

So after looking at this is more detail, I'll grant you that it gives
you a way to avoid checking for errors at every step of the way. There
is a disadvantage because you keep executing a lot of code
unnecessarily, and you make the code susceptible to mistakes because
it contains a non-obvious assumption that contributors to your code may
not be aware of.

> >>     This is my driver, I mention it here just to show it was not a
> >> problem to merge it to media subsystem.
> > That just shows what everybody knows: that maintainers care about
> > different things at different levels.
> >
> >> Similar patterns:
> >>
> >> 6. http://lxr.free-electrons.com/source/fs/seq_file.c#L398
> >>     Do not process object if buffer is full, it allows to do not check
> >> buffer size after every write, for example:
> >>>     seq_printf(m, " hardirq-safe locks:            %11lu\n",
> >>>             nr_hardirq_safe);
> >>>     seq_printf(m, " hardirq-unsafe locks:          %11lu\n",
> >>>             nr_hardirq_unsafe);
> >>>     seq_printf(m, " softirq-safe locks:            %11lu\n",
> >>>             nr_softirq_safe);
> >>>     seq_printf(m, " softirq-unsafe locks:          %11lu\n",
> >>>             nr_softirq_unsafe);
> >>>     seq_printf(m, " irq-safe locks:                %11lu\n",
> >>>             nr_irq_safe);
> >>>     seq_printf(m, " irq-unsafe locks:              %11lu\n",
> >>>             nr_irq_unsafe);
> >>>
> >>>     seq_printf(m, " hardirq-read-safe locks:       %11lu\n",
> >>>             nr_hardirq_read_safe);
> >>>     seq_printf(m, " hardirq-read-unsafe locks:     %11lu\n",
> >>>             nr_hardirq_read_unsafe);
> >>>     seq_printf(m, " softirq-read-safe locks:       %11lu\n",
> >>>             nr_softirq_read_safe);
> >>>     seq_printf(m, " softirq-read-unsafe locks:     %11lu\n",
> >>>             nr_softirq_read_unsafe);
> >>>     seq_printf(m, " irq-read-safe locks:           %11lu\n",
> >>>             nr_irq_read_safe);
> >>>     seq_printf(m, " irq-read-unsafe locks:         %11lu\n",
> >>>             nr_irq_read_unsafe);
> >>>
> >>>     seq_printf(m, " uncategorized locks:           %11lu\n",
> >>>             nr_uncategorized);
> >>>     seq_printf(m, " unused locks:                  %11lu\n",
> >>>             nr_unused);
> >>>     seq_printf(m, " max locking depth:             %11u\n",
> >>>             max_lockdep_depth);
> >> Now try to imagine how it would look like if you add error checking
> >> after each call.
> > I think that's a fairly sane use-case for this kind of pattern. The big
> > difference is that this condition is checked in subsequent accesses to
> > shortcut failure paths. It's also very different in that it performs
> > writes to memory and those aren't going to fail. The root cause of this
> > overflow would be static in nature and likely found doing basic testing
> > and fixed by making the buffer larger.
> >
> > That's contrary to a driver doing I/O (I2C, SPI, DSI, ...) that can fail
> > unexpectedly for any number of reasons.
>=20
> The idiom is still the same - storing error state in the object allows
> to move error checking inside called functions, removing much of
> redundant code from caller.

Yes, the idiom is the same, but the use-case is also completely
different, so I don't think you can apply the same rules. If you've got
communication with an external peripheral, like in the case of SPI, I2C
or DSI, I think the best thing to do is abort as early as possible on
failure. The most likely reason for failure would be a persistent cause
on the bus, in which case none of your accesses will succeed. If so I
think it makes sense to let the user know what exactly went wrong and
leave it at that. Continuing to execute code, even if no physical access
to the hardware happens anymore, is a waste of time.

Failures on such busses can happen for any number of reasons, and they
can happen sporadically, so it's important to catch errors. For seq_buf
in particular you have a static failure case, which is if somebody were
trying to add more characters to the buffer than would fit. But callers
will, most of the time, put exactly the same number of characters into
that buffer. So if there was a failure once they'd notice quickly and
the issue would get fixed, at which point it becomes very unlikely to
ever happen again.

So seq_buf is not expected to fail, whereas with peripheral busses you
can't make that assumption.

> >> 7. http://lxr.free-electrons.com/source/lib/devres.c#L129
> >>     Postponed error check:
> >>> */res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);/*
> >>> /*b*/*/ase =3D devm_ioremap_resource(&pdev->dev, res);/*
> >>> */if (IS_ERR(base))/*
> >>> /**/*/return PTR_ERR(base);/*
> > Heh, I wrote that =3D)
> >
> > This is also quite different from your usage in the panel driver. We do
> > not simply ignore failure from platform_get_resource(), instead we leave
> > it up to devm_ioremap_resource() to turn it into a meaningful error code
> > and message. The function does this very early on, so the error
> > condition is not ignored, as it is in the panel driver.
>=20
> Claims about the panel again not true, reasons described above.
>=20
> The similarity here is that you do not perform error checking in the
> caller, you just blindly pass the 'object' to the next function, and
> still everything is handled correctly.

But we're not passing any object to the next function. We're passing the
return value from an earlier call, one line above. We're not hiding an
error code in some driver-specific structure. So the code is completely
explicit.

Maybe I should say a few words about why this is important to me because
you may think this to be somewhat pedantic. This is fundamentally caused
by the fact that once I merge code into a tree that I maintain, then the
responsibility for that code becomes mine. That means I will not only be
held accountable if it doesn't work, breaks or upsets build farms all
over the world. It also means that I am the one that will need to make
changes to it along the way. If the code is difficult for me to
understand because it doesn't behave the way I'm used to, then that
makes my life harder.

Sometimes authors do stick around and care about their drivers, but
often they'll just disappear, or ignore patches and bug reports about
their drivers. So if worst comes to worst people will look to me to fix
their problems. That's why I want it to be easy to read and modify the
code that I maintain, because that way when users show up and complain
about drivers I don't have to spend hours trying to understand what the
original author was trying to achieve.

The above is a variant of what others have termed "obviously correct".
One good way to make code obviously correct is to make it simple.

Thierry

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYUlAACgkQ3SOs138+
s6F6yhAAj0ghU6KoweOGKF07mQQHuJXN9nwhWiUL671mJbbkHD7j1rSpY12UNLjR
0n2MxFsJS5XNNmyLaH5tTZb3H81aVXfMGK0mzMrMDp4Hdcs20rN2VkamiRF9jrv/
QI5mlpY813uE0UrttCwN4+kw8S6gtfpSrQnq1dUGq5ykLnZewVtwn+CAxviZoPEy
KaETw7z/Cfny5AEQE5hZ5GmYEqsMVqO0BJo7f3sibJNgJxmoyW+k7PkaZTSuKfMM
079wcIdbCpoJr9KlB0NVJk3XRTaZIRd2bzdwFBaqyJUhi52uizcLLKKTVVVMADBJ
fc7B8nQUZete0XYBKiAzqDH//dT6KfhoV9XeitkLZ1WHEKQRUuLAWA583CZkItna
+EzSShxxe3x4tZBLXUogyK0eS4JCjpkHeds97kZUImJY+2NCtFSO5wXrCYhgC7vp
gXkBTF8VGCsvuYNaKtAHMqbgFI33NZPctf7v0BbmawoT8olrrX3e0W4aBJSKun3f
dw7Mt9EAMj2OX9rpS88OLVjsbOxjr+JUJKcSZgF45kMEvJ7WqwxDA+XTUNKL0yzd
Kvm4VG9yoyKOEmRryJaJ52VkvM5wC3KOARRFr7j6vDnlTWQxDOA/EcgJAT10rNQt
mSoEV//cVfdr1Yayv1a9IzMvRwn+Oy34BmgpRWC/IYBth0S+cdk=
=Ssfw
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
