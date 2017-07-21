From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 14:21:42 +0300
Message-ID: <87mv7y3uih.fsf@linux.intel.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com> <87zic0b8hi.fsf@linux.intel.com> <20170721075616.ma57ixucid7233bm@vis.informatik.uni-osnabrueck.de> <CGME20170721081040epcas5p463abb05b4b663fc20cbf9ebb06cdacb1@epcas5p4.samsung.com> <87vamm43dc.fsf@linux.intel.com> <c43153ef-bdcd-df59-4fa7-4fe4f0af3ae1@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c43153ef-bdcd-df59-4fa7-4fe4f0af3ae1-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jochen Sprickerhof <jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> writes:
> Hi,
>
> On 07/21/2017 10:10 AM, Felipe Balbi wrote:
>> Jochen Sprickerhof<jochen-bAcQkQxx4gKrcAepLLbpDQ@public.gmane.org>  writes:
>
>>> I've send a patch for this some time ago here:
>>> http://marc.info/?l=3Dlinux-usb&m=3D149945465112440&w=3D2
>>>
>>> This goes along with the patch in this thread:
>>> http://marc.info/?l=3Dlinux-usb&m=3D149983203023058&w=3D2
>>>
>>> Would be great if you could give it a try and report back.
>>>
>>> @Felipe can I do anything more to get it accepted upstream?
>> you got rid of*all*  context. I have no idea what you're replying
>> to. Looking at the patch, though, I think this may be caused by the
>> regression on the order of when to get the PHY. That was fixed by TI,
>> patch is already on next and greg's queue for next -rc. Please check if
>> commit 541768b08a400d9d292cfd9c898401b8178856ac helps you guys.
>
> I tested with that commit on top of v4.13-rc1 and USB seems to
> be working properly on Odroid XU4, the mouse is working.

Thanks a lot ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAllx48YACgkQzL64meEa
mQZYwRAAxmA4t6ChvJ38zlGmtCX5UTfWb0SAGrz2fEzjY4rUIdYScIXucJOFU0RL
sqG1cw9XOdZ6FdJY/l4BmIyaW44EAfAh7Bsi3WSWXKGM1JF5lAObw56hfsa5f0jk
RNI1zcCeTCnCHmQis1lXbh6wLSURr0gTT8YuG/FN6sWV1W8U8PtKrcLv3H9bLAyx
ijExm0dy1Vz6Vs1/MCAoU0Qr4EWS+a1aTIusm+JS+fJPTtLOTgE/s43KCCQSaP55
4GG1cXRoXV3hyazX2Pzi/Mr9w7vXkjA5OgTm8pQof0fIR26Ybpmnmk/WYAgPZSu/
5WRtf3+EYd+z4fElbm6H8p1EQ+rhfVVEfU9OiKmJN8VnlTDhypCTztYUG0ynKJoQ
5o5+dU20h8/fcVeqL6ajcJqXn2V0QSdvNv6C8mwx3/VNVlYgYo4Vx5e1r0Vo3O42
zgI/WHtfnPUw8JHNM4Vftm6sIFmdw6bL/kILjsG/2p2QnDHDUnl5dxE31EPmLZGT
srIsDNnFm98aqB/ahoE0naWuTVuV6LmAk5oSQbdPz0zQcWOB8hiohh6tiSjCw2Sx
WK3b/LbDT3HF3sJXi5DhFSzCrhIkg+olN4LpcexwrSqia+hcgFR3lm4rvMIhKK2O
YonQB7Kgo2Cvgr66i+V9yc5bd32KEPCVeC1ht1r2JLLKfOaNdmI=
=GTOx
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
