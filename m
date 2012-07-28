From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 4/8 v2] ARM: EXYNOS5: Add EHCI device from device tree
Date: Sun, 29 Jul 2012 01:41:57 +0900
Message-ID: <CAFp+6iFs3ErqoJLzvuDLQ_mS3RABvxa=aw9piVArRKUBPLiztw@mail.gmail.com>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com>
 <1342866729-30460-5-git-send-email-gautam.vivek@samsung.com>
 <201207261157.14441.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5000243542344392855=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201207261157.14441.arnd@arndb.de>
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

--===============5000243542344392855==
Content-Type: multipart/alternative; boundary=e89a8f234687c839f904c5e6819a

--e89a8f234687c839f904c5e6819a
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Thu, Jul 26, 2012 at 8:57 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Saturday 21 July 2012, Vivek Gautam wrote:
> > @@ -28,6 +29,11 @@ static struct exynos4_ohci_platdata
> smdk5250_ohci_pdata = {
> >         .phy_exit = s5p_usb_phy_exit,
> >  };
> >
> > +static struct s5p_ehci_platdata smdk5250_ehci_pdata = {
> > +       .phy_init = s5p_usb_phy_init,
> > +       .phy_exit = s5p_usb_phy_exit,
> > +};
> > +
> >  /*
> >   * The following lookup table is used to override device names when
> devices
> >   * are registered from device tree. This is temporarily added to enable
>
> I'm a bit confused of the purpose of setting the function pointers here
> when the pointers are always to the same s5p_usb_phy_init/s5p_usb_phy_exit
> identifiers, but you have different definitions of those functions
> depending on which platforms you are building for.
>
> What is the idea here? Are you going to unify the three definitions of
> s5p_usb_phy_init, or is that function going away eventually when we
> get to the point of building exynos/s5p/s3c64xx into the same kernel
> binary?
>
> Should we be differentiating here between the calls at runtime for
different SOCs.
In that case, yes i think we need a way here to have a solution here so
that the function call
goes differently for different soc while in runtime. I will work on this
and get back asap.

>         Arnd
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
Best regards
Vivek

--e89a8f234687c839f904c5e6819a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br><div class=3D"gmail_quote">On Thu, Jul 26, 2012 at 8:57 PM, Arnd=
 Bergmann <span dir=3D"ltr">&lt;<a href=3D"mailto:arnd@arndb.de" target=3D"=
_blank">arnd@arndb.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">

<div>On Saturday 21 July 2012, Vivek Gautam wrote:<br>
&gt; @@ -28,6 +29,11 @@ static struct exynos4_ohci_platdata smdk5250_ohci_p=
data =3D {<br>
&gt; =A0 =A0 =A0 =A0 .phy_exit =3D s5p_usb_phy_exit,<br>
&gt; =A0};<br>
&gt;<br>
&gt; +static struct s5p_ehci_platdata smdk5250_ehci_pdata =3D {<br>
&gt; + =A0 =A0 =A0 .phy_init =3D s5p_usb_phy_init,<br>
&gt; + =A0 =A0 =A0 .phy_exit =3D s5p_usb_phy_exit,<br>
&gt; +};<br>
&gt; +<br>
&gt; =A0/*<br>
&gt; =A0 * The following lookup table is used to override device names when=
 devices<br>
&gt; =A0 * are registered from device tree. This is temporarily added to en=
able<br>
<br>
</div>I&#39;m a bit confused of the purpose of setting the function pointer=
s here<br>
when the pointers are always to the same s5p_usb_phy_init/s5p_usb_phy_exit<=
br>
identifiers, but you have different definitions of those functions<br>
depending on which platforms you are building for.<br>
<br>
What is the idea here? Are you going to unify the three definitions of<br>
s5p_usb_phy_init, or is that function going away eventually when we<br>
get to the point of building exynos/s5p/s3c64xx into the same kernel<br>
binary?<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div>Should we=
 be differentiating here between the calls at runtime for different SOCs.</=
div><div>In that case, yes i think we need a way here to have a solution he=
re so that the function call</div>
<div>goes differently for different soc while in runtime. I will work on th=
is and get back asap.</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><font color=
=3D"#888888">=A0 =A0 =A0 =A0 Arnd<br>

</font></span><div><div><br>
_______________________________________________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss@lists.ozlabs.org" target=3D"_blank">de=
vicetree-discuss@lists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a></div></div=
></blockquote><div>Best regards</div><div>Vivek=A0</div></div><br>

--e89a8f234687c839f904c5e6819a--


--===============5000243542344392855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5000243542344392855==--
