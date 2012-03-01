From: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Thu, 1 Mar 2012 09:18:03 +0000
Message-ID: <CADPsn1a9TVmaEJMh2UB8GAu3tZhVvNe7RiaKG=ystnnxBf9JAg@mail.gmail.com>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
	<1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
	<CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
	<4F4EEC06.8010400@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4432777746238529237=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4F4EEC06.8010400-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============4432777746238529237==
Content-Type: multipart/alternative; boundary=bcaec50405d6f084bc04ba2aef3e

--bcaec50405d6f084bc04ba2aef3e
Content-Type: text/plain; charset=ISO-8859-1

On 1 March 2012 03:24, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On 02/29/2012 06:31 PM, Thomas Abraham wrote:
> > Hi Sangwook,
> >
> > On 29 February 2012 18:11, Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> Enable burst transfer from AHB for EHCI.
> >> This fixes data transfer of USB Ethernet with EHCI.
> >> Without this patch, scp hardly works.
> >>
> >> Signed-off-by: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  arch/arm/mach-exynos/setup-usb-phy.c      |    6 ++++++
> >>  arch/arm/plat-samsung/devs.c              |    2 ++
> >>  arch/arm/plat-samsung/include/plat/ehci.h |   19 +++++++++++++++++++
> >>  3 files changed, 27 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c
> b/arch/arm/mach-exynos/setup-usb-phy.c
> >> index 41743d2..5a20460 100644
> >> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> >> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> >> @@ -18,6 +18,7 @@
> >>  #include <mach/regs-usb-phy.h>
> >>  #include <plat/cpu.h>
> >>  #include <plat/usb-phy.h>
> >> +#include <plat/ehci.h>
> >>
> >>  static atomic_t host_usage;
> >>
> >> @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pdev,
> int type)
> >>
> >>        return -EINVAL;
> >>  }
> >> +
> >> +void s5p_ehci_burst_enable(struct platform_device *pdev, void __iomem
> *base)
> >> +{
> >> +       writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNREG00);
> >> +}
> >
> > This functionality can be added in ehci-s5p itself and avoid adding a
> > new platform callback in platform data. If this is specific to exynos,
> > driver data could be added in ehci-s5p to indicate platforms that need
> > this to be enabled.
> >
> Am I right in assuming that ehci-s5p driver can also be used for
> mach-s5pv210?
>
> The related bit-fields are reserved in S5PV210. So, won't it cause any
> side-effects?
>
>
do we use ehci-s5p.c in CPU 64xx series ?

>
> > Thanks,
> > Thomas.
> >
> > [...]
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --
> Tushar Behera
>

--bcaec50405d6f084bc04ba2aef3e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 1 March 2012 03:24, Tushar Behera <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">tushar.beher=
a@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On 02/29/2012 06:31 PM, Thomas Abra=
ham wrote:<br>
&gt; Hi Sangwook,<br>
&gt;<br>
&gt; On 29 February 2012 18:11, Sangwook Lee &lt;<a href=3D"mailto:sangwook=
.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt; Enable burst transfer from AHB for EHCI.<br>
&gt;&gt; This fixes data transfer of USB Ethernet with EHCI.<br>
&gt;&gt; Without this patch, scp hardly works.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Sangwook Lee &lt;<a href=3D"mailto:sangwook.lee@lin=
aro.org">sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0arch/arm/mach-exynos/setup-usb-phy.c =A0 =A0 =A0| =A0 =A06 ++++=
++<br>
&gt;&gt; =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 ++<br>
&gt;&gt; =A0arch/arm/plat-samsung/include/plat/ehci.h | =A0 19 ++++++++++++=
+++++++<br>
&gt;&gt; =A03 files changed, 27 insertions(+), 0 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-=
exynos/setup-usb-phy.c<br>
&gt;&gt; index 41743d2..5a20460 100644<br>
&gt;&gt; --- a/arch/arm/mach-exynos/setup-usb-phy.c<br>
&gt;&gt; +++ b/arch/arm/mach-exynos/setup-usb-phy.c<br>
&gt;&gt; @@ -18,6 +18,7 @@<br>
&gt;&gt; =A0#include &lt;mach/regs-usb-phy.h&gt;<br>
&gt;&gt; =A0#include &lt;plat/cpu.h&gt;<br>
&gt;&gt; =A0#include &lt;plat/usb-phy.h&gt;<br>
&gt;&gt; +#include &lt;plat/ehci.h&gt;<br>
&gt;&gt;<br>
&gt;&gt; =A0static atomic_t host_usage;<br>
&gt;&gt;<br>
&gt;&gt; @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *p=
dev, int type)<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0return -EINVAL;<br>
&gt;&gt; =A0}<br>
&gt;&gt; +<br>
&gt;&gt; +void s5p_ehci_burst_enable(struct platform_device *pdev, void __i=
omem *base)<br>
&gt;&gt; +{<br>
&gt;&gt; + =A0 =A0 =A0 writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSN=
REG00);<br>
&gt;&gt; +}<br>
&gt;<br>
&gt; This functionality can be added in ehci-s5p itself and avoid adding a<=
br>
&gt; new platform callback in platform data. If this is specific to exynos,=
<br>
&gt; driver data could be added in ehci-s5p to indicate platforms that need=
<br>
&gt; this to be enabled.<br>
&gt;<br>
</div></div>Am I right in assuming that ehci-s5p driver can also be used fo=
r<br>
mach-s5pv210?<br>
<br>
The related bit-fields are reserved in S5PV210. So, won&#39;t it cause any<=
br>
side-effects?<br>
<br></blockquote><div><br>do we use ehci-s5p.c in CPU 64xx series ?=A0 <br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Thanks,<br>
&gt; Thomas.<br>
&gt;<br>
&gt; [...]<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-s=
amsung-soc&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">=
majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
&gt; More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-=
info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a>=
<br>
<br>
<br>
--<br>
Tushar Behera<br>
</font></span></blockquote></div><br>

--bcaec50405d6f084bc04ba2aef3e--


--===============4432777746238529237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============4432777746238529237==--
