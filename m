From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 11:10:23 +0300
Message-ID: <87vamm43dc.fsf@linux.intel.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com> <87zic0b8hi.fsf@linux.intel.com> <20170721075616.ma57ixucid7233bm@vis.informatik.uni-osnabrueck.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721075616.ma57ixucid7233bm-VZh7rsYCTBgXOLVLeuLo0irg3XacrlPoG0RXR9nTYlE@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org> writes:
> Hi,
>
> I've send a patch for this some time ago here:
>
> http://marc.info/?l=3Dlinux-usb&m=3D149945465112440&w=3D2
>
> This goes along with the patch in this thread:
>
> http://marc.info/?l=3Dlinux-usb&m=3D149983203023058&w=3D2
>
> Would be great if you could give it a try and report back.
>
> @Felipe can I do anything more to get it accepted upstream?

you got rid of *all* context. I have no idea what you're replying
to. Looking at the patch, though, I think this may be caused by the
regression on the order of when to get the PHY. That was fixed by TI,
patch is already on next and greg's queue for next -rc. Please check if
commit 541768b08a400d9d292cfd9c898401b8178856ac helps you guys.

ps: leave context on your replies next time, man. We get a TON of emails
every day; it's difficult to keep track of everything without context.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAllxtu8ACgkQzL64meEa
mQa3cxAAzFoLhIW84rg2azCmrVilHjSZsWs5zFA4UtkV6hoOH+dC5wfD28+u1LH5
hLcwAGogQh/jLvElVuzbSu+TIe59kX8yMGX8LTj/K4/oPquZSfK7rLqHwzEv7A+X
0NknVzXgHBWBBqab/3FS+qMoiuoXlV4GZqPFYxNlZ+6d5CgE895ALR7WceO9Tn4C
N5IrUgovPRwNe1XTy00uyH5nH+0TYSFVyEx2PlcUq9FYdS4wo8Ze2u1kjrp1bTAE
vJ2LH7a+B+pTcmLq4TuQRLLJAedLBhswXbn1wGLMM34CZ3RVbJrkGUWekPIlApPv
3q0/y04UTy5KfF5GFpB2f69537xAQrK0RtHqDP1Tcevkp/Pb/2hpWdA1z5m4M88j
TFGAUVTPCSxhZUXaQzlSmM7szWgVNnMvr7K0gXyD9vxM06XU7HqaGqPjwwo9ifkl
OKiOi1cfhTcyF7mxf5jaeow20lOpixCLgFIx2TnaVT5LFb1bfRPVdExdNbBe71Oe
OrxEIiVsqjIwpD2N5mw/lbovIATG810NS+NK/4j/a5fNTwGKxu7taPixt2hWf4gA
+/vC5Pr9mkhgYne9qtiLd5EU4yMFPdoLUmR5Bm8/WHI7wy44vpiJ8+UqpyUZ9s+S
pghbXRyysQFSad0XJuiroau8w7++PfcoXgMK+ZU+g+moeqoQ/UA=
=bKp4
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
