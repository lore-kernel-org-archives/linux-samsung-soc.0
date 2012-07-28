From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 2/8 v2] ARM: EXYNOS5: Add machine data for USB 2.0
Date: Sun, 29 Jul 2012 01:05:11 +0900
Message-ID: <CAFp+6iH0c=LogUXnpg0pD05X+mMGP9XiWDDxiTyNQAxJq_srJg@mail.gmail.com>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com>
 <1342866729-30460-3-git-send-email-gautam.vivek@samsung.com>
 <201207261124.50141.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2262386042382380780=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201207261124.50141.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: yulgon.kim@samsung.com, kgene.kim@samsung.com, prashanth.g@samsung.com, olofj@google.com, devicetree-discuss@lists.ozlabs.org, l.majewski@samsung.com, joshi@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, a.kesavan@samsung.com, av.tikhomirov@samsung.com, boyko.lee@samsung.com, ajaykumar.rs@samsung.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============2262386042382380780==
Content-Type: multipart/alternative; boundary=f46d040890c74ebf3f04c5e5fe41

--f46d040890c74ebf3f04c5e5fe41
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 26, 2012 at 8:24 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Saturday 21 July 2012, Vivek Gautam wrote:
> > From: Ajay Kumar <ajaykumar.rs@samsung.com>
> >
> > This patch adds address mapping of USB 2.0 PHY for exynos5
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> > ---
> >  arch/arm/mach-exynos/common.c           |    5 +++++
> >  arch/arm/mach-exynos/include/mach/map.h |    2 ++
> >  2 files changed, 7 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/common.c
> b/arch/arm/mach-exynos/common.c
> > index 4eb39cd..92d5e61 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -275,6 +275,11 @@ static struct map_desc exynos5_iodesc[] __initdata
> = {
> >                 .pfn            = __phys_to_pfn(EXYNOS5_PA_GIC_DIST),
> >                 .length         = SZ_4K,
> >                 .type           = MT_DEVICE,
> > +       }, {
> > +               .virtual        = (unsigned long)S3C_VA_USB_HSPHY,
> > +               .pfn            = __phys_to_pfn(EXYNOS5_PA_USB_PHY),
> > +               .length         = SZ_4K,
> > +               .type           = MT_DEVICE,
> >         },
> >  };
>
> Can you pleae explain why this is done in the changelog?
>
> We try hard to do such mappings from the device driver instead,
> so I'm surprised that this is necessary fo rthe USB phy.
>

We are doing the mapping for device address in the driver, but this memory
mapping for USB PHY registers that need to be programmed by the software
is done here. This is similar to what we see for exynos4 also. Is it
something
that i can still change? Please suggest.

>
>         Arnd
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>

Best regards
Vivek

--f46d040890c74ebf3f04c5e5fe41
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Jul 26, 2012 at 8:24 PM, Arnd Be=
rgmann <span dir=3D"ltr">&lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_bl=
ank">arnd@arndb.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Saturday 21 July 2012, Vivek Gautam wrote:<br>
&gt; From: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.com">ajayk=
umar.rs@samsung.com</a>&gt;<br>
&gt;<br>
&gt; This patch adds address mapping of USB 2.0 PHY for exynos5<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Vivek Gautam &lt;<a href=3D"mailto:gautam.vivek@samsung=
.com">gautam.vivek@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0arch/arm/mach-exynos/common.c =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +++++<=
br>
&gt; =A0arch/arm/mach-exynos/include/mach/map.h | =A0 =A02 ++<br>
&gt; =A02 files changed, 7 insertions(+), 0 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/comm=
on.c<br>
&gt; index 4eb39cd..92d5e61 100644<br>
&gt; --- a/arch/arm/mach-exynos/common.c<br>
&gt; +++ b/arch/arm/mach-exynos/common.c<br>
&gt; @@ -275,6 +275,11 @@ static struct map_desc exynos5_iodesc[] __initdat=
a =3D {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(EXYNOS5_PA_GIC_DIST),<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,<br>
&gt; + =A0 =A0 =A0 }, {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lo=
ng)S3C_VA_USB_HSPHY,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(EXYNOS5_PA_USB_PHY),<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,=
<br>
&gt; =A0 =A0 =A0 =A0 },<br>
&gt; =A0};<br>
<br>
</div>Can you pleae explain why this is done in the changelog?<br>
<br>
We try hard to do such mappings from the device driver instead,<br>
so I&#39;m surprised that this is necessary fo rthe USB phy.<br></blockquot=
e><div><br></div><div>We are doing the mapping for device address in the dr=
iver, but this memory</div><div>mapping for USB PHY registers that need to =
be programmed by the software</div>
<div>is done here. This is similar to what we see for exynos4 also. Is it s=
omething</div><div>that i can still change? Please suggest.</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">

<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=A0 =A0 =A0 =A0 Arnd<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss@lists.ozlabs.org">devicetree-discuss@l=
ists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a></div></div=
></blockquote><div><br></div><div>Best regards</div><div>Vivek=A0</div></di=
v>
<br>

--f46d040890c74ebf3f04c5e5fe41--


--===============2262386042382380780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2262386042382380780==--
