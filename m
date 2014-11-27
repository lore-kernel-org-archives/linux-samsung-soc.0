From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 11/19] clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
Date: Thu, 27 Nov 2014 15:02:26 +0100
Message-ID: <2120788.f3P3CC6nYQ@wuerfel>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com> <2232281.fbydzq3GMs@wuerfel> <CAGTfZH3KmwhJNFdmeWnujbbUbtLf5vSi6i2dbV62DeCtV7n4TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGTfZH3KmwhJNFdmeWnujbbUbtLf5vSi6i2dbV62DeCtV7n4TQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung@samsu>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 27 November 2014 22:41:49 Chanwoo Choi wrote:
> 2014=EB=85=84 11=EC=9B=94 27=EC=9D=BC =EB=AA=A9=EC=9A=94=EC=9D=BC, Ar=
nd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=ED=95=9C=
 =EB=A9=94=EC=8B=9C=EC=A7=80:
>=20
> > On Thursday 27 November 2014 21:58:53 Chanwoo Choi wrote:
> > > Dear Arnd,
> > >
> > > On 11/27/2014 09:35 PM, Arnd Bergmann wrote:
> > > > On Thursday 27 November 2014 13:12:08 Sylwester Nawrocki wrote:
> > > >> On 27/11/14 12:56, Chanwoo Choi wrote:
> > > >>> On 11/27/2014 08:41 PM, Arnd Bergmann wrote:
> > > >>>>> On Thursday 27 November 2014 16:35:08 Chanwoo Choi wrote:
> > > >>>>>>> +  - "samsung,exynos5433-cmu-bus0", "samsung,exynos5433-c=
mu-bus1"
> > > >>>>>>> +    and "samsung,exynos5433-cmu-bus2" - clock controller
> > compatible for CMU_BUS
> > > >>>>>>> +    which generates global data buses clock and global
> > peripheral buses clock.
> > > >>>>>>>
> > > >>>>>>>  - reg: physical base address of the controller and lengt=
h of
> > memory mapped
> > > >>>>>>>    region.
> > > >>>>>>>
> > > >>>>>
> > > >>>>> This looks like you are duplicating the bindings and the co=
de, but
> > > >>>>> it's really the same hardware multiple times with minor var=
iations
> > > >>>>> that you should be able to describe properly here. Why not =
make
> > > >>>>> three nodes with the same compatible string and have them h=
andled
> > > >>>>> by the same code?
> > > >>>
> > > >>> Each CMU_BUSx domain of Exynos5433 have different base addres=
s as
> > following:
> > > >>> - CMU_BUS0's base address and range : 0x1360_0000 ~ 0x1360_0b=
04
> > > >>> - CMU_BUS1's base address and range : 0x1480_0000 ~ 0x1480_0b=
04
> > > >>> - CMU_BUS2's base address and range : 0x1340_0000 ~ 0x1340_0b=
04
> > > >>>
> > > >>> So, I implement CMU_BUSx domain which has each compatible str=
ing.
> > > >
> > > > But the base address is in the reg property, not in the compati=
ble
> > > > property. What I mean is to have multiple nodes like
> > >
> > > The merged clock driver in mainline have different compatible str=
ing
> > > if base addresss of clock domain is different. So, I implemented =
each
> > CMU_BUSx domain
> > > with different compatible string.
> >
> > Why?
>=20
>=20
> As I explained on below, each clock domain have different clocks.
> So, clocks have unique clock name.
>=20
>  If clock driver use only one compatible for various clock domain, cl=
ock
> driver have to know the base address of each domain for distinction o=
f
> clock domain. I think It is stong dependency between device and drive=
r.

No, not at all. You can have lots of clock controllers with the same
compatible string defining different instances of the same IP block,
e.g. for compatible=3D"fixed-clock".

> >
> > > >     clock-controller@113600000 {
> > > >             reg =3D <0 0x113600000 0 0x1000>;
> > > >             compatible =3D "samsung,exynos5433-cmu";
> > > >             #clock-cells =3D <1>;
> > > >     };
> > > >
> > > >     clock-controller@114800000 {
> > > >             reg =3D <0 0x114800000 0 0x1000>;
> > > >             compatible =3D "samsung,exynos5433-cmu";
> > > >             #clock-cells =3D <1>;
> > > >     };
> > > >
> > > > The code will just map the local registers for each instance an=
d then
> > > > provide the clocks of the right instance when asked for it.
> > >
> > > Each clock domain has not the same mux/divider/clock. So, just on=
e
> > compatible
> > > string could not support all of clock domains.
> >
> > What are the specific differences?
>=20
>=20
>=20
> > I'm not sure that difference among clock domains because I think it=
 is
> dependent on the opinion of architect of SoC.
>=20
> cmu_bus0/1/2 are much similar. Just cmu_bus2 has one more mux/gate cl=
ock
> than cmu_bus0/1.

Yes, that's what I mean. You can simply model that extra mux/gate
in the driver, as long as nothing ever tries to access the clock.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
