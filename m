From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 15:00:31 +0300
Message-ID: <542160DF.2040008@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo> <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo> <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8g8KxkO9nEpJlQKqpI9XUup3ixrwMlcV4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923095314.GS30514@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--8g8KxkO9nEpJlQKqpI9XUup3ixrwMlcV4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 12:53, Thierry Reding wrote:

>> Yes, but in this case we know of existing boards that have complex
>> setups. It's not theoretical.
>=20
> Complex setups involving /this particular/ bridge and binding are
> theoretical at this point, however.

Right, but this discussion, at least from my part, has not so much been
about this particular bridge, but bridges in general.

So I don't have any requirements for this bridge driver/bindings to
support complex use cases at the time being.

But I do want us to have an option to use the bridge in the future in
such complex case. And yes, we can't guarantee that we'd hit the
bindings right whatever we do, but we should think about it and at least
try.

>>> phandles should simply point to the next element in the pipeline and =
the
>>> OS abstractions should be good enough to handle the details about how=
 to
>>> chain the elements.
>>
>> I, on the other hand, would rather see the links the other way around.=

>> Panel having a link to the video source, etc.
>=20
> Why? It seems much more natural to describe this using the natural flow=

> of data. The device furthest away from the CPU should be the target of
> the phandle. That way the DT can be used to trace the flow of data down=

> the pipeline.

Because I see video components "using" their video sources. A panel uses
an encoder to produce video data for the panel. An encoder uses its
video source to produce video data. A bit like a device uses a gpio, or
a pwm.

Especially with more complex encoders/panels having the panel/encoder in
control of its video source is often the easiest (only?) way to manage
the job. This has worked well on OMAP, whereas the earlier model where
the video source controlled the video sink was full of problems. Not
that that exactly proves anything, but that's my experience, and I
didn't find any easy solutions when the video source was in control.

So while the video data flows from SoC to the panel, the control goes
the other way. Whether the DT links should model the video data or
control, I don't know. Both feel natural to me.

But if a panel driver controls its video source, it makes sense for the
panel driver to get its video source in its probe, and that happens
easiest if the panel has a link to the video source.

 Tomi



--8g8KxkO9nEpJlQKqpI9XUup3ixrwMlcV4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIWDfAAoJEPo9qoy8lh71YmQP/0n5nhLfhfJG4ZV8cnH8hTdi
rjdodYtJd53OkN0curP2C6TD8YxQymJLIBntXnHOic6l3UsJcyNR+5Jsby9Ux2Ck
kH/mvF57qdBt7T203fU+UWY58GNz6JAwCm3TD41y3QMF6vgM1lAY5JdYbhCqIUfq
Q/R9WARmLQ3vscsTA+ieTqLzWVMKltcTKqULe5Z2XlqyERRJ4HKfyFzZ3NKF08sg
bjXASHgf9U6ETL6Cd4eu1vr+UylF2D7GiyePFnLUeBVWvLU8nIZKDn8l7Htn/Yw+
OrfrKE8xQG2dW9kuIMW6JtNqVtcKo2PHyTtCOO9QY+Lqmr17jmyj2QtV1hBx8G2M
VI2VIdN/6d+k/bU1s4I01NyCT5H9Bo4UJpl1IkzbjBBV2V2xtwPtdFkJTJdy8iU3
BoYoVLzM9JMdHexImw4slILr+moP6UAE6NG9dAK5hbw2CVdMv5PnyReHobeybAen
KjSsPl9szKiAkTNdBM7MktHMk+/7kIWwkluv/f1II7bu7wtLzVekn8WuRbd8Pfcx
fRnf0Cwt7IUbV2eZA2S6RXvfBtEQWBSQmhxnzT3m4aYJdNJNWMu6OyNj0Zwoj+Mv
tBl5Qg+Jd59Vj/y10mWnONDDJ2fSAPzGf7LtiRdlw5txe+X05Q14tHsaRwFScRD5
vp46lubvXydtbnQ/Wh1k
=XGtU
-----END PGP SIGNATURE-----

--8g8KxkO9nEpJlQKqpI9XUup3ixrwMlcV4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
