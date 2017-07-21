From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 13:27:41 +0300
Message-ID: <87shhq3x0i.fsf@linux.intel.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com> <87zic0b8hi.fsf@linux.intel.com> <20170721075616.ma57ixucid7233bm@vis.informatik.uni-osnabrueck.de> <87vamm43dc.fsf@linux.intel.com> <20170721090909.z5eol2v3bxlz7opr@vis.informatik.uni-osnabrueck.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721090909.z5eol2v3bxlz7opr-VZh7rsYCTBgXOLVLeuLo0irg3XacrlPoG0RXR9nTYlE@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org> writes:
> * Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [2017-07-21 11:10]:
>> Hi,
>>=20
>> Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org> writes:
>> > Hi,
>> >
>> > I've send a patch for this some time ago here:
>> >
>> > http://marc.info/?l=3Dlinux-usb&m=3D149945465112440&w=3D2
>> >
>> > This goes along with the patch in this thread:
>> >
>> > http://marc.info/?l=3Dlinux-usb&m=3D149983203023058&w=3D2
>> >
>> > Would be great if you could give it a try and report back.
>> >
>> > @Felipe can I do anything more to get it accepted upstream?
>>=20
>> you got rid of *all* context. I have no idea what you're replying
>> to. Looking at the patch, though, I think this may be caused by the
>> regression on the order of when to get the PHY. That was fixed by TI,
>> patch is already on next and greg's queue for next -rc. Please check if
>> commit 541768b08a400d9d292cfd9c898401b8178856ac helps you guys.
>
> No, as I wrote In my patch, it's on top of 541768b08a400d9d292cfd9c898401=
b8178856ac:
>
> | This needs and is supposed to be applied on top of
> | https://patchwork.kernel.org/patch/9815981/
>
> So we still need it.

no we do not. And that patch of yours would actually regress many
things. For one, you're moving dwc3_setup_phy() before we even *get* a
reference to the PHY. Not to mention that dwc3_core_is_valid() only
checks the revision register to verify that we're dealing with a *real*
Synopsys IP.

Your patch is not only unnecessary, it's also wrong.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAllx1x0ACgkQzL64meEa
mQak/xAAqRKYmApsDRB8qitaH8BG0nqubZKcd7wDwc8pcdJxQk/HmfvWZ8eB2QcO
Jtn0FmL3ySQSRIJcvRZ5CP5JTg9/TM+VV+Y6Vi1T6JU/B2wxlp/6/f9HkEilBlXY
mNLfsY3VT+96qzwREQHbZFm1N6ahymhqW79nncVgtXP25/cfEI/tzhJaSYP4xPR7
X+rRCsPPlPm9jsvtF2h3Zfc9U1BMb5zyTuSl8oz6mp4Rebh1cW30k6YseQNLMjaQ
tLsAtso78QdTQ40G6MfjTF7igKsaWBrfc4jqh57yDmfzN2tOduHiQC2ZGhVQaaOP
+vr9EyX34RGgJbHdDyV3O3Fj9PdF/kkrc5oLrrBLZKg+lR9+j3OkwhPJcNqu+XFt
ZiQo64vW1Q+u3kPnRT7dFHNDSWwVU5usiqzsBxnTnsrrS1SvK+MOJRrgizVCS0CF
vtQHSfQBy7nYEwrs+f1aluUidXJht0tUHyD75KlgCXj37lcnJE5JSnmbi2KyBIXY
QJLEO9o+qhLbOKjWTPM4PENnGYnLwun2VhH2s4ObHOaEPskgy10/2LT1zxxrJ02t
dP1WkNw2ZrtttkPVCcnKQ2DpkBjvwfzak0plJkqPY3d0IVjnd1q8ww91tIT9UBH3
b2/lYgMIBEk7lLRXeVWnvYGmf1Z37+6w5HWNm3xXL9f6yEyvnxs=
=g/Rx
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
