From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 17:23:25 +0300
Message-ID: <542030DD.3060906@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gIIaFTWosuSPu2pxBD8ERLiOCxk1i7fDJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140922080629.GC1470@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--gIIaFTWosuSPu2pxBD8ERLiOCxk1i7fDJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/09/14 11:06, Thierry Reding wrote:

>>> Why do we need a complex graph when it can be handled using a simple =
phandle?
>>
>> Maybe in your case you can handle it with simple phandle. Can you
>> guarantee that it's enough for everyone, on all platforms?
>=20
> Nobody can guarantee that. An interesting effect that DT ABI stability
> has had is that people now try to come up with overly generic concepts
> to describe devices in an attempt to make them more future-proof. I
> don't think we're doing ourselves a favour with that approach.

I kind of agree. However, there are boards that need a more complex
approach than just a simple phandle. They are nothing new.

So while it may be true that this specific encoder has never been used
in such a complex way, and there's a chance that it never will, my
comments are not really about this particular encoder.

What I want is a standard way to describe the video components. If we
have a standard complex one (video graphs) and a standard simple one
(simple phandles), it's ok for me.

>> The point of the ports/endpoint graph is to also support more
>> complicated scenarios.
>=20
> But the scenario will always remain the same for this bridge. There wil=
l
> always be an input signal and a translation to some output signal along=

> with some parameters to control how that translation happens. More
> complicated scenarios will likely need to be represented differently at=

> a higher level than the bridge.

Yes, there's always one active input and one output for this bridge.
What the video graphs would bring is to have the possibility to have
multiple inputs and outputs, of which a single ones could be active at a
time. The different inputs and outputs could even have different
settings required (say, first output requires this bit set, but when
using second output that bit must be cleared).

>> If you now create ps8622 bindings that do not
>> support those graphs, the no one else using ps8622 can use
>> ports/endpoint graphs either.
>=20
> That's not true. The binding can easily be extended in a backwards-
> compatible way later on (should it really prove necessary).

I hope you are right =3D). As I said in my earlier mail, my experience so=

far has been different.

 Tomi



--gIIaFTWosuSPu2pxBD8ERLiOCxk1i7fDJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIDDdAAoJEPo9qoy8lh71epkP/1O5cCVDfl7p3SJwbZamTwhE
gm3raaUfyUnPwRaiH/MP8R1ROF0qwmbL+B47SVVi0SQeGbdzKrOcxIkgXDk9SpRF
AEWmgxf4Cekx6v8mFZqPLeY5dc34sCFwQBwnbxZhD5Z04BzHWJcSOOOltokuRyoZ
60FLEwdk2OPC2J7Sazxm/CuXBUCHm9684fhfQvjVZcx4UPWkiL+7m8EQyg1W1Xkc
DIN6Ay9e2xOkpeIptE+3lb1Y8cSavqHNgl+b1w2bOv/9mRrik2sKk1+FeNbas/7k
Yv91457CN15S1+4l8stEkjHDOTPB/G9N+xYpsonDLXxY2a4ZI+rhNWpFBAUtzwNV
KIZtcyf+dXGQO/ictqca1zdc2A1RRF6myKoFQ+XLySIXgsPdn9ITXe5NBUkyFt9Y
GQ0y6gaQyTDNNSoFEcFXbpGWC8t0epyCxOiXBnLIS4aaTKF1cF9jOEdEMDMyyAG8
FOrRiyUwedcEly+iOgV61iWYAx12ZXzf/8YaMKiKdKqQDh+kIY7I4LmBonzfoRf/
7PJdFn7FkNva9UtIzv25UCRTSBkmMW2vBsZONB2uc1a3pHQT6KDNcijaJskWDqcc
tSKri5+dcYIfMvOdJ8Tk/d3ucsxijJtV3ktRFx3hZ+RY6Q/JSpuj8rcPGiTN7xh/
DzW7hgBSr94iaKzMbxUL
=PIIg
-----END PGP SIGNATURE-----

--gIIaFTWosuSPu2pxBD8ERLiOCxk1i7fDJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
