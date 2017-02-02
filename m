From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Thu, 2 Feb 2017 17:48:51 +0100
Message-ID: <20170202164851.GA9055@ulmo.ba.sec>
References: <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com>
 <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
 <20170131213132.GC872@mithrandir.ba.sec>
 <871svgzk2t.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <871svgzk2t.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Donghwa Lee <dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 05:30:34PM +0200, Jani Nikula wrote:
> On Tue, 31 Jan 2017, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
> >> I would love for drm-panel to be moved under -misc.
> >
> > Like that's going to magically motivate people to spend their time
> > reviewing other patches. The only thing that group maintainership adds
> > is redundancy.
>=20
> Adding redundancy is not an insignificant thing. I think it can be quite
> liberating to not have everything and everybody depend on you. You can
> defer to others when you're busy, tired, sick, whatever. Things still
> move on.

Oh, I certainly see the advantages in sharing maintainership. However, I
think it really only works well if you've got active developers working
together on the code already. Then it's very natural to let all of them
manage a tree.

But for drm-panel, I've rarely seen anyone review patches. Sometimes the
easy patches (i.e. panel-simple) get reviewed by parties that have some
interest in seeing the patches merged. However, there's usually no
review at all for the more complicated patches.

Given that, I doubt that group maintainership is going to have the
desired effect. Just because the tree is group maintained doesn't mean
that all of a sudden people are going to care about the patches. So I
suspect that even if panel drivers were managed in drm-misc, I'd still
be the only person reviewing the patches. And really, managing a tree
is peanuts compared to the amount of work it takes to properly review
code.

With group maintainership, for this type of tree in particular, I think
it's likely for the quality bar to be lowered. There aren't any best
practices yet for anything beyond panel-simple, and therefore little to
no review is likely going to make people still pick up patches. This is
quite different to the DRM/KMS core bits and drivers because there are
established best practices and people can usually spot when new code is
not living up to expectations.

> And I don't think redundancy is the only thing that group maintainership
> adds. You'll have maintainers that complement each other, with different
> skill sets and abilities and experience. They don't all look at the same
> things. As maintainers tend to be more senior folks, I find sharing the
> load of the more mundane tasks of maintainership free up their time to
> contribute more of their technical skills to the project, for example
> review.

I don't understand why group maintainership would be necessary for this.
Surely people will review code irrespective of who finally applies their
patch. If they don't in a single maintainer project, why would they
suddenly start reviewing code in group maintained projects?

> It's just my personal view on i915, but I think people take more
> responsibility of their own work, instead of just sending patches and
> waiting for stuff to happen, when they have commit access. But you have
> to trust the people.

That's not something that we're discussing here. Surely giving the world
access to the maintainer trees is not a goal that we're pursuing here.
It will still only be a handful of selected people that will have commit
access, so how's that going to change things for contributors that don't
have commit access?

The bottom line still is that we have a requirement to have patches
reviewed before they get applied. So even if everybody had commit access
we'd still need someone to review a patch before it gets applied. Like I
said, reviewing is really the difficult part of a maintainer's job.
Applying a patch is trivial, build-testing is equally trivial and so is
sending out a pull request. All of the above can be easily automated to
a point where it's completely painless.

> I didn't intend for this to become a kind of sales pitch, but I do think
> drm-panel would be a good fit for drm-misc. Personally I think it's your
> call, but I think you should think about it. (And that decision should,
> obviously, be made calmly, independent of any particular patch series.)

You know what? I completely agree with you that drm-panel would be a
good fit for drm-misc. It's effectively part of the DRM/KMS core and
used by most drivers. But it's never been treated that way. Maybe it
is because it's been maintained in a separate tree from the very
beginning, perhaps that was a mistake in the first place. Then again,
back when drm-panel was started we didn't have group maintainership,
so none of the existing trees would've been a good fit.

In the end, I keep getting back to the question that everybody except
me seems to know the answer to: why would there be a difference in how
contributors behave depending on the number of maintainers?

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliTYvEACgkQ3SOs138+
s6F4vw/+IeVfhz8Vw+G7fiPPf+Xp9XsP/iy2rg3EEbBw1EYgNfv3bIhqXAhG9kc9
pqLdnH/RG7ZU2v8hkmYFfcmEDyxuq+bIHtpUkmybowRe5n8uke1BsOukjSxz7iAO
5SBszj4lBTdl3cz8112WdN1IgrSx7YJL0M1tUSUczqROB8iL2DCpSg0xxhhZwu68
T3FrP+X8JHfyi39bzj35f2bKCsMhuEXuXXuual3mrGn89MtkvQ0Ge57dJOmH8/8j
6cklgVMrm9ZgHinv/gmMEJ+du0AnAe2XgR1Zio1JwMN72S58Ez/3bewOl/s/pc0Y
JuCBCd54S0gjtmNf06TwsnzIumYLqojcRyncP5ltYfJZYWK9q1QIzjnc49GRLEYd
4vK/D0rsk3sIQ4IEH95v/dni1zsDSW4/rp4Ugw0XIuATQyQx+0KXWuxdXEyp4ErU
D3c0RO5lVQSQcCbWoXT/MaRudGAlvY7FxN5krNyS4/uz6Q9GvI2cz0z4E3wfYF1G
3Q9KPXuvsjt9xtRPcznbV00iMgyicC2oZPbycuVJtZalrWpyrgzDZ5YRaibEARQM
OaHujhykBRojKLvKW61waBfg8KD5GUEcQ+mFg3UogW+XXEOEMSFwbKoLlAwtTzoB
8lL47EFEbKfMmsd+k9UQRjWwt8m1vnwVcJi9AjR8O7dU4LeoWe8=
=6j20
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
