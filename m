From: Kyuho Choi <chlrbgh0@gmail.com>
Subject: Re: [PATCH] ARM: dts: add initial dts file for ORIGEN4QUAD
Date: Tue, 27 Nov 2012 01:58:37 +0900
Message-ID: <CAP2JTQ+OjLwPboQpO5zO92-p_wa1iOuaAgRdAMS7YhnYTcBEPQ@mail.gmail.com>
References: <1353929538-24173-1-git-send-email-kh.choi@insignal.co.kr>
 <CAH9JG2VSnA3zJCP9OiBbrdaV1GqVKL0x4fn331D7YJxQs8VwMg@mail.gmail.com>
 <1361143.TuLvfqvMr1@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2799507603637002130=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1361143.TuLvfqvMr1@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyuho Choi <kh.choi@insignal.co.kr>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============2799507603637002130==
Content-Type: multipart/alternative; boundary=14dae93409bd674a6c04cf68d9c2

--14dae93409bd674a6c04cf68d9c2
Content-Type: text/plain; charset=UTF-8

Hi Tomasz,

2012/11/26 Tomasz Figa <t.figa@samsung.com>

> Hi Kyungmin, Kyuho,
>
> On Monday 26 of November 2012 20:52:12 Kyungmin Park wrote:
> > Hi,
> >
> > On 11/26/12, chlrbgh0@gmail.com <chlrbgh0@gmail.com> wrote:
> > > From: Kyuho Choi <kh.choi@insignal.co.kr>
> > >
> > > This patch adds initial dts file for ORIGEN4QUAD board.
> > > ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.
> > > More properties will be added later.
> > >
> > > Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> > > ---
> > >
> > >  arch/arm/boot/dts/exynos4412-origen4quad.dts |   45
> > >
> > > ++++++++++++++++++++++++++
> > >
> > >  1 files changed, 45 insertions(+), 0 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad.dts
> > >
> > > diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > > b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > > new file mode 100644
> > > index 0000000..390a2ab
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> > > @@ -0,0 +1,45 @@
> > > +/*
> > > + * Samsung's Exynos4412 based Origen4Quad board device tree source
> > > + *
> > > + * Copyright (c) 2012-2013 Isnignal Co., Ltd.
> > > + *         http://www.insignal.co.kr
> > > + *
> > > + * Device tree source file for Insignal's Origen4Quad board which is
> > > based on
> > > + * Samsung's Exynos4412 SoC.
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > modify + * it under the terms of the GNU General Public License
> > > version 2 as + * published by the Free Software Foundation.
> > > +*/
> > > +
> > > +/dts-v1/;
> > > +/include/ "exynos4412.dtsi"
> > > +
> > > +/ {
> > > +   model = "Insignal Origen4Quad board based on Exynos4412";
> > > +   compatible = "insignal,origen4quad", "samsung,exynos4412";
> > > +
> > > +   memory {
> > > +           reg = <0x40000000 0x40000000>;
> > > +   };
> >
> > does it test to boot with this dts file?
> > does it support 1GiB memory section?
>
> It will most likely fail to boot with u-boot versions that do not support
> replacing memory configuration in device tree and without
> CONFIG_ARM_ATAG_DTB_COMPAT enabled.
>
> In other words, the memory setup from dts is used only if both of the
> following are true:
>  - CONFIG_ARM_ATAG_DTB_COMPAT is disabled
>  - u-boot does not modify memory setup in device tree passed to the kernel
>
> You're right. I'd working based on `exynos4_defconfig`.
It's default disabled `CONFIG_ARM_ATAG_DTB_COMPAT`.
And my u-boot version is 2012.10.

> Best regards,
> --
> Tomasz Figa
> Samsung Poland R&D Center
> SW Solution Development, Linux Platform
>

--14dae93409bd674a6c04cf68d9c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2012/11=
/26 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:t.figa@samsung.com"=
 target=3D"_blank">t.figa@samsung.com</a>&gt;</span><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">



Hi Kyungmin, Kyuho,<br>
<div><div><br>
On Monday 26 of November 2012 20:52:12 Kyungmin Park wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 11/26/12, <a href=3D"mailto:chlrbgh0@gmail.com" target=3D"_blank">c=
hlrbgh0@gmail.com</a> &lt;<a href=3D"mailto:chlrbgh0@gmail.com" target=3D"_=
blank">chlrbgh0@gmail.com</a>&gt; wrote:<br>
&gt; &gt; From: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.co.kr" ta=
rget=3D"_blank">kh.choi@insignal.co.kr</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This patch adds initial dts file for ORIGEN4QUAD board.<br>
&gt; &gt; ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.<br>
&gt; &gt; More properties will be added later.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Kyuho Choi &lt;<a href=3D"mailto:kh.choi@insignal.=
co.kr" target=3D"_blank">kh.choi@insignal.co.kr</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0arch/arm/boot/dts/exynos4412-origen4quad.dts | =C2=A0 45<br=
>
&gt; &gt;<br>
&gt; &gt; ++++++++++++++++++++++++++<br>
&gt; &gt;<br>
&gt; &gt; =C2=A01 files changed, 45 insertions(+), 0 deletions(-)<br>
&gt; &gt; =C2=A0create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad=
.dts<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; &gt; b/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..390a2ab<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts<br>
&gt; &gt; @@ -0,0 +1,45 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Samsung&#39;s Exynos4412 based Origen4Quad board device tree =
source<br>
&gt; &gt; + *<br>
&gt; &gt; + * Copyright (c) 2012-2013 Isnignal Co., Ltd.<br>
&gt; &gt; + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.insignal.co=
.kr" target=3D"_blank">http://www.insignal.co.kr</a><br>
&gt; &gt; + *<br>
&gt; &gt; + * Device tree source file for Insignal&#39;s Origen4Quad board =
which is<br>
&gt; &gt; based on<br>
&gt; &gt; + * Samsung&#39;s Exynos4412 SoC.<br>
&gt; &gt; + *<br>
&gt; &gt; + * This program is free software; you can redistribute it and/or=
<br>
&gt; &gt; modify + * it under the terms of the GNU General Public License<b=
r>
&gt; &gt; version 2 as + * published by the Free Software Foundation.<br>
&gt; &gt; +*/<br>
&gt; &gt; +<br>
&gt; &gt; +/dts-v1/;<br>
&gt; &gt; +/include/ &quot;exynos4412.dtsi&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +/ {<br>
&gt; &gt; + =C2=A0 model =3D &quot;Insignal Origen4Quad board based on Exyn=
os4412&quot;;<br>
&gt; &gt; + =C2=A0 compatible =3D &quot;insignal,origen4quad&quot;, &quot;s=
amsung,exynos4412&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 memory {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x40000000 0x400=
00000&gt;;<br>
&gt; &gt; + =C2=A0 };<br>
&gt;<br>
&gt; does it test to boot with this dts file?<br>
&gt; does it support 1GiB memory section?<br>
<br>
</div></div>It will most likely fail to boot with u-boot versions that do n=
ot support<br>
replacing memory configuration in device tree and without<br>
CONFIG_ARM_ATAG_DTB_COMPAT enabled.<br>
<br>
In other words, the memory setup from dts is used only if both of the<br>
following are true:<br>
=C2=A0- CONFIG_ARM_ATAG_DTB_COMPAT is disabled<br>
=C2=A0- u-boot does not modify memory setup in device tree passed to the ke=
rnel<br>
<br></blockquote><div>You&#39;re right.=C2=A0I&#39;d working based on `exyn=
os4_defconfig`.</div><div>It&#39;s default disabled `CONFIG_ARM_ATAG_DTB_CO=
MPAT`.</div><div>And my u-boot version is 2012.10.</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">




Best regards,<br>
<span><font color=3D"#888888">--<br>
Tomasz Figa<br>
Samsung Poland R&amp;D Center<br>
SW Solution Development, Linux Platform<br></font></span></blockquote></div=
></div>

--14dae93409bd674a6c04cf68d9c2--


--===============2799507603637002130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2799507603637002130==--
