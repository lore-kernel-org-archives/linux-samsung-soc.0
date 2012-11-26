From: Kyuho Choi <chlrbgh0@gmail.com>
Subject: Re: [PATCH] ARM: dts: add initial dts file for ORIGEN4QUAD
Date: Mon, 26 Nov 2012 21:23:01 +0900
Message-ID: <CAP2JTQKTGL0qsQXgS5K55UFH1X47aKvxP0NG7SkZn2+XTJw7-g@mail.gmail.com>
References: <1353929538-24173-1-git-send-email-kh.choi@insignal.co.kr>
 <CAH9JG2VSnA3zJCP9OiBbrdaV1GqVKL0x4fn331D7YJxQs8VwMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1188902760167593952=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH9JG2VSnA3zJCP9OiBbrdaV1GqVKL0x4fn331D7YJxQs8VwMg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyuho Choi <kh.choi@insignal.co.kr>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1188902760167593952==
Content-Type: multipart/alternative; boundary=14dae93409bdc4ee3304cf64ff64

--14dae93409bdc4ee3304cf64ff64
Content-Type: text/plain; charset=UTF-8

Hi,

2012/11/26 Kyungmin Park <kmpark@infradead.org>

> Hi,
>
> On 11/26/12, chlrbgh0@gmail.com <chlrbgh0@gmail.com> wrote:
> > From: Kyuho Choi <kh.choi@insignal.co.kr>
> >
> > This patch adds initial dts file for ORIGEN4QUAD board.
> > ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.
> > More properties will be added later.
> >
> > Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> > ---
> >  arch/arm/boot/dts/exynos4412-origen4quad.dts |   45
> > ++++++++++++++++++++++++++
> >  1 files changed, 45 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad.dts
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > new file mode 100644
> > index 0000000..390a2ab
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > @@ -0,0 +1,45 @@
> > +/*
> > + * Samsung's Exynos4412 based Origen4Quad board device tree source
> > + *
> > + * Copyright (c) 2012-2013 Isnignal Co., Ltd.
> > + *           http://www.insignal.co.kr
> > + *
> > + * Device tree source file for Insignal's Origen4Quad board which is
> based
> > on
> > + * Samsung's Exynos4412 SoC.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +/dts-v1/;
> > +/include/ "exynos4412.dtsi"
> > +
> > +/ {
> > +     model = "Insignal Origen4Quad board based on Exynos4412";
> > +     compatible = "insignal,origen4quad", "samsung,exynos4412";
> > +
> > +     memory {
> > +             reg = <0x40000000 0x40000000>;
> > +     };
> does it test to boot with this dts file?
> does it support 1GiB memory section?
>
> Yes, I'd test this dts.
ORIGEN4QUAD board support 1GiB memory section.
But in current patch, only support 760MiB on boot.

> Thank you,
> Kyungmin Park
> > +
> > +     chosen {
> > +             bootargs ="root=/dev/ram0 rw ramdisk=32768
> initrd=0x41000000,32M
> > console=ttySAC2,115200 init=/linuxrc";
> > +     };
> > +
> > +     serial@13800000 {
> > +             status = "okay";
> > +     };
> > +
> > +     serial@13810000 {
> > +             status = "okay";
> > +     };
> > +
> > +     serial@13820000 {
> > +             status = "okay";
> > +     };
> > +
> > +     serial@13830000 {
> > +             status = "okay";
> > +     };
> > +};
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
>

--14dae93409bdc4ee3304cf64ff64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2012/11/26 Kyu=
ngmin Park <span dir=3D"ltr">&lt;<a href=3D"mailto:kmpark@infradead.org" ta=
rget=3D"_blank">kmpark@infradead.org</a>&gt;</span><br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

Hi,<br>
<div><div class=3D"h5"><br>
On 11/26/12, <a href=3D"mailto:chlrbgh0@gmail.com">chlrbgh0@gmail.com</a> &=
lt;<a href=3D"mailto:chlrbgh0@gmail.com">chlrbgh0@gmail.com</a>&gt; wrote:<=
br>
&gt; From: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr">kh.choi=
@insignal.co.kr</a>&gt;<br>
&gt;<br>
&gt; This patch adds initial dts file for ORIGEN4QUAD board.<br>
&gt; ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.<br>
&gt; More properties will be added later.<br>
&gt;<br>
&gt; Signed-off-by: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr=
">kh.choi@insignal.co.kr</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm/boot/dts/exynos4412-origen4quad.dts | =C2=A0 45<br>
&gt; ++++++++++++++++++++++++++<br>
&gt; =C2=A01 files changed, 45 insertions(+), 0 deletions(-)<br>
&gt; =C2=A0create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad.dts<=
br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; b/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..390a2ab<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +/*<br>
&gt; + * Samsung&#39;s Exynos4412 based Origen4Quad board device tree sourc=
e<br>
&gt; + *<br>
&gt; + * Copyright (c) 2012-2013 Isnignal Co., Ltd.<br>
&gt; + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.insignal.=
co.kr" target=3D"_blank">http://www.insignal.co.kr</a><br>
&gt; + *<br>
&gt; + * Device tree source file for Insignal&#39;s Origen4Quad board which=
 is based<br>
&gt; on<br>
&gt; + * Samsung&#39;s Exynos4412 SoC.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +/include/ &quot;exynos4412.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; + =C2=A0 =C2=A0 model =3D &quot;Insignal Origen4Quad board based on Ex=
ynos4412&quot;;<br>
&gt; + =C2=A0 =C2=A0 compatible =3D &quot;insignal,origen4quad&quot;, &quot=
;samsung,exynos4412&quot;;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 memory {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x40000000 0x4=
0000000&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
</div></div>does it test to boot with this dts file?<br>
does it support 1GiB memory section?<br>
<br></blockquote><div>Yes, I&#39;d test this dts.</div><div>ORIGEN4QUAD boa=
rd support 1GiB memory section.</div><div>But in current patch, only suppor=
t 760MiB on boot.</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex">


Thank you,<br>
Kyungmin Park<br>
<div class=3D"im">&gt; +<br>
&gt; + =C2=A0 =C2=A0 chosen {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bootargs =3D&quot;root=3D/=
dev/ram0 rw ramdisk=3D32768 initrd=3D0x41000000,32M<br>
&gt; console=3DttySAC2,115200 init=3D/linuxrc&quot;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 serial@13800000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot=
;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 serial@13810000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot=
;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 serial@13820000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot=
;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 serial@13830000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot=
;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; --<br>
&gt; 1.7.5.4<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kern=
el@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel</a><br>
&gt;<br>
</blockquote></div><br></div>

--14dae93409bdc4ee3304cf64ff64--


--===============1188902760167593952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1188902760167593952==--
