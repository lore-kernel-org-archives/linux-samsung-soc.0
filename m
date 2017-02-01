From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Wed, 1 Feb 2017 15:44:05 +0100
Message-ID: <20170201144405.GA17698@ulmo.ba.sec>
References: <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
 <20170131213132.GC872@mithrandir.ba.sec>
 <5891224E.5010402@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2061818188=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5891224E.5010402@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============2061818188==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2017 at 08:48:30AM +0900, Inki Dae wrote:
>=20
>=20
> 2017=EB=85=84 02=EC=9B=94 01=EC=9D=BC 06:31=EC=97=90 Thierry Reding =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
> >> Thierry Reding <thierry.reding@gmail.com> writes:
> >>
> >>> [ Unknown signature status ]
> >>> On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
> >>>> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
> >>>>> On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
> >>>>>>
> >>>>>>
> >>>>>> 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >>>>>>> Dear Thierry,
> >>>>>>>
> >>>>>>> Could you please review this patch?
> >>>>>>
> >>>>>> Thierry, I think this patch has been reviewed enough but no comment
> >>>>>> from you. Seems you are busy. I will pick up this.
> >>>>>
> >>>>> Sorry, but that's not how it works. This patch has gone through 8
> >>>>> revisions within 4 weeks, and I tend to ignore patches like that un=
til
> >>>>> the dust settles.
> >>>>>
> >>>>
> >>>> Seems like the dust was pretty settled. It was posted on 1/11, pinge=
d on 1/24,
> >>>> and picked up on 1/31. I don't think it's unreasonable to take it th=
rough
> >>>> another tree after that.
> >>>>
> >>>> I wonder if drm_panel would benefit from the -misc group maintainers=
hip model
> >>>> as drm_bridge does. By spreading out the workload, the high-maintena=
nce
> >>>> patches would hopefully find someone to shepherd them through.
> >>>
> >>> Except that nobody except me really cares. If we let people take patc=
hes
> >>> through separate trees or group-maintained trees they'll likely go in
> >>> without too much thought. DRM panel is somewhat different from core D=
RM
> >>> in this regard because its infrastructure is minimal and there's litt=
le
> >>> outside the panel-simple driver. So we're still at a stage where we n=
eed
> >>> to fine-tune what drivers should look like and how we can improve.
> >>
> >> I would love to care and participate in review, but with the structure
> >> of your tree you're the only one whose review counts, so I don't
> >> participate.
> >=20
> > Really? What exactly do you think is special about the structure of my
> > tree? I require patches to be on dri-devel (I pick them up from the
> > patchwork instance at freedesktop.org), the tree is publicly available
> > and reviewed-by tags get picked up automatically by patchwork.
> >=20
> > The panel tree works exactly like any other maintainer tree. And my
> > review is *not* the only one that counts. I appreciate every Reviewed-by
> > tag I see on panel patches because it means that I don't have to look as
> > closely as I have to otherwise.
>=20
> I don't think the panel tree works exactly like other maintainer tree.
>=20
> I'd like to recommend you to read below Greg's blog. This blog says
> about *Role of a Linux Kernel Maintainer*.
> http://www.kroah.com/log/linux/maintainer_pledge.html

Okay, now you're being unfair. You can't compare people to Greg. He
is beyond human.

> Especially, I'd like to emphasize below things,
> - I will review your patch within 1-2 weeks.
> - I will offer semi-constructive criticism of your patches.
> - I will let you know the status of your patch if it is rejected, or
> if it is accepted, what tree it has gone into, where you can find it,
> and when you can expect to see it merged into Linus's tree.

First, this is a pledge by Greg, and you can hardly hold me to this if
it isn't coming from me. I agree that the above is ideal, but I'm also
much less efficient as a maintainer as Greg. So are many others. There
simply isn't enough bandwidth to be able to do the above in every case
in addition to the day job and real life.

That said, when I do get around to review patches I think I'm pretty
good at the second and third points, though.

Secondly, it's very convenient how you focus on the maintainers' duties
and completely leave out what maintainers expect from contributors. If
you go and read some of the references linked to by Greg's post, maybe
you'll understand my position a little better as well.

> Why do you ignore contributor's patch? Even though the patch is ugly,
> I think you need to point it out and give your feedback to
> contributers as a maintainer.
> There was some cases I often missed to review with busy work but I
> don't ignore contributor's patch.

I will admit that ignoring the patch in this instance may not have been
the best course of action. But this particular instance was making it
exceptionally difficult for me, which is why I was going to shunt this
until the next cycle so that I could focus on getting the less tiresome
patches in.

And interestingly nobody seems to care about this current discussion
either. So yesterday somebody requested another change to the DT binding
after this discussion had started, and after I had NAK'ed the patch, but
then I see that today there's yet another revision with no attempt to do
anything about the concerns that I had raised.

> That was why I tried to pick this patch up to my tree to induce your
> feedback.
>=20
> You mentioned like below,
> "This patch has gone through 8 revisions within 4 weeks, and I tend to
> ignore patches like that until the dust settles."

Yes, two or three of those weeks were during a Christmas break and while
the merge window was open. Sometimes maintainers do need time to
recharge.

> Yes, it's been over a month since contributor sent this patch, and
> even he requested ping~~~ but there was no comment from you.
> You say "I tend to ignore patches like that until the dust settles."

And I did look at the patch after seeing the ping, but I immediately got
frustrated because it repeats the same mistakes that I had been
complaining about, and evidently had been too lax about, when the other
two Samsung drivers got merged. And I do remember some of the names that
were involved previously, so I think it's fair to assume that you knew I
wasn't happy about it, and yet you keep sending the same crappy code.

> I'd like to say *maintainer is really not a place for power*, and
> maintainer would implicitly have a role to encourage in contribution
> activity of contributer.

Those are two orthogonal issues. Of course maintainership is about
power, because otherwise how is a maintainer different from a regular
contributor?

And I do encourage contributions, as long as they are worthy. I did go
through the trouble of explaining the last few times why I think these
drivers aren't good enough, but I'm not very motivated to do it once
more because I did try and be encouraging in the past, and did accept
patches because I thought somebody would eventually come around and do
things better with the next submission. But I was proven wrong. If you
don't care about addressing the issues I bring up during review, I can
not be expected to care about your patch submissions any longer.

> And you are continuing reply to other maintainer's comments but no
> comment to the contributor. This guy would still be ping~. :)

I fully expect contributors to read all of the comments that are made in
response to their submission. If they can't be bothered to follow the
discussion that ensues from their contributions, why should I bother
looking at their patches?

> You said you've repeatedly complained but how new contributors know this?
>=20
> And you also said,
> "DRM panel is somewhat different from core DRM in this regard because
> its infrastructure is minimal and there's little outside the
> panel-simple driver. So we're still at a stage where we need to
> fine-tune what drivers should look like and how we can improve"
>=20
> Please, move panel directory to drivers/staging so that other
> contributors aren't confused. I think drm-panel should be stayed in
> staging yet until the things you mentioned will be improved because
> while being discussed and improved, other contributors will continue
> their contributions.

You're twisting my words. I'm not saying that the DRM panel framework
should be in staging. What I am saying is that we have only a handful of
drivers, and most people find that panel-simple is a suitable one. And I
think it works great for those cases.

But the other more complicated drivers are a new thing, so we don't have
anything like best practices yet. But when I look at the current patches
as well as the existing Samsung panel drivers that it no doubt was
inspired by, I realize this is not at all something I consider a good
example of how such drivers should be written. So we're going to have to
find ways to improve this before I'm going to accept this patch.

Thierry

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliR9DMACgkQ3SOs138+
s6GtkhAAj41sSStLHeOmO5wqgVmeQxRW+zsHf7Y+VX6bV0xjKhLw8pwTdZPMtdiT
jlt2bYnmRMXkOIP2C1R5JfI147QzkyhrVlxWkqKq57wTDl6sOtymhy53MC7J3FmK
KaOIY1N+GAPyswwr3aIxSyuMhI9O6yQ/EIF7v4RNJDrl7r8OdoNDMb0/vd84YVPc
kVwHmofSP4PRW+XtdMa/lAMru8rD4DkJq4IjwKQtG4+JaLx3OvBEbJl4l16/mu1g
Ez53/l/DuGcpi/n/VyXl9dU7g4vGr2BIwUGXl0+QZcF3MpxM8fqpqwKUmQW439rG
mbSPJihzI6p/pUmDP2NqUAzOu3ht+6qu5jWgD8IXilwcj1r3vSULfEwG0CBY8kQI
29xuYX3BUiJdW/7td6u851X5wOpxrROOuMP+laFgQrPnNbE42qOVr8AbFnm43pGy
SBLF7XkwtMY4lMPB+xcn++1JJznOaSo/+HrDQ+Wqiib1R0KHkaSmJ2EaUsEE1qST
lbDM51jExJXXuAaxyVtqvVvmyRLFaVgYFnV0OEREMWtfSzrFjGFlfcjxb6ANh8fs
YDV4zYilNuelper3u3YO90ziYRtGcn1vReVgvzQyy3BK28cNUSHM+o/sRm/I/SF4
PuEifQCBN0E64Be/S33uolS1debcn7NYmB9KfJdHYVCLv/seZgY=
=BKBa
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

--===============2061818188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2061818188==--
