From: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Thu, 1 Mar 2012 16:10:52 +0000
Message-ID: <CADPsn1ZfXqmOVtw5OdfbXv=xZ3EREbPqCRnpnsYHbhkvx=nb5Q@mail.gmail.com>
References: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
	<201203011624.04551.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5217693389904283696=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <201203011624.04551.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============5217693389904283696==
Content-Type: multipart/alternative; boundary=20cf30780c5c46300d04ba30b483

--20cf30780c5c46300d04ba30b483
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 1 March 2012 15:24, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:

> Am Donnerstag, 1. M=E4rz 2012, 06:38:20 schrieb Jingoo Han:
> > This patch adds USB HOST register definitions. The definition for
> > EHCI INSNREG00 regiser and corresponding bit field definitions are
> > added.
> >
> > Signed-off-by: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> > v2: change the definition name from EHCI_ENA_xxx to
> EHCI_INSNREG00_ENA_xxx.
> >
> > arch/arm/mach-exynos/include/mach/regs-usb-host.h |   24
> > +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.h
> Isn't the general idea to depopulate the mach directories and make driver=
s
> buildable across architectures?
>
> The definitions are only used in drivers/usb/host/ehci-s5p.c [in the seco=
nd
> patch], so there should be no need to add another arch-header and they
> could
> simply be included in the driver itself or if necessary a
> drivers/usb/host/ehci-s5p.h .
>

 I found out some code related to this burst function.

 the snip from ehci-s5pv210.c, 2.6.35 kernel

        /* Mark hardware accessible again as we are out of D3 state by now
*/
        set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
#if defined(CONFIG_ARCH_S5PV210) || defined(CONFIG_ARCH_S5P6450)
        ehci_writel(ehci, 0x000F0000, (void __iomem *)ehci->caps + 0x90);
#endif

#if defined(CONFIG_ARCH_S5PV310)
        ehci_writel(ehci, 0x03C00000, (void __iomem *)ehci->caps + 0x90);
#endif
        if (ehci_readl(ehci, &ehci->regs->configured_flag) =3D=3D FLAG_CF) =
{

>From this code, this burst function seems to be depending on CPUs,
The driver by itself is not good idea because echi-s5p.c will have defined.

Which is the better place to pus this CPU specific definition either
drivers/usb/host/ehci-s5p.h is
or mach/xx.h or  include/linux/usb/xxx.h ?  I am not clear about this.


Heiko
>
> > diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > b/arch/arm/mach-exynos/include/mach/regs-usb-host.h new file mode 10064=
4
> > index 0000000..572b7d4
> > --- /dev/null
> > +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> > + *           http://www.samsung.com
> > + *
> > + * EXYNOS - USB HOST register definitions
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef __REGS_USB_HOST_H
> > +#define __REGS_USB_HOST_H __FILE__
> > +
> > +#define EHCI_INSNREG00(base)                 (base + 0x90)
> > +#define EHCI_INSNREG00_ENA_INCR16            (0x1 << 25)
> > +#define EHCI_INSNREG00_ENA_INCR8             (0x1 << 24)
> > +#define EHCI_INSNREG00_ENA_INCR4             (0x1 << 23)
> > +#define EHCI_INSNREG00_ENA_INCRX_ALIGN               (0x1 << 22)
> > +#define EHCI_INSNREG00_ENABLE_DMA_BURST      \
> > +     (EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 | \
> > +      EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
> > +
> > +#endif /* __REGS_USB_HOST_H */
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--20cf30780c5c46300d04ba30b483
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 1 March 2012 15:24, Heiko St=FCbner <=
span dir=3D"ltr">&lt;<a href=3D"mailto:heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org">heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Am Donnerstag, 1. M=E4rz 2012, 06:38:20 schrieb Jingoo Han:<br>
<div class=3D"im">&gt; This patch adds USB HOST register definitions. The d=
efinition for<br>
&gt; EHCI INSNREG00 regiser and corresponding bit field definitions are<br>
&gt; added.<br>
&gt;<br>
&gt; Signed-off-by: Sangwook Lee &lt;<a href=3D"mailto:sangwook.lee@linaro.=
org">sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; Signed-off-by: Jingoo Han &lt;<a href=3D"mailto:jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">j=
g1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; v2: change the definition name from EHCI_ENA_xxx to EHCI_INSNREG00_ENA=
_xxx.<br>
&gt;<br>
&gt; arch/arm/mach-exynos/include/mach/regs-usb-host.h | =A0 24<br>
&gt; +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletions(-=
)<br>
&gt; =A0create mode 100644 arch/arm/mach-exynos/include/mach/regs-usb-host.=
h<br>
</div>Isn&#39;t the general idea to depopulate the mach directories and mak=
e drivers<br>
buildable across architectures?<br>
<br>
The definitions are only used in drivers/usb/host/ehci-s5p.c [in the second=
<br>
patch], so there should be no need to add another arch-header and they coul=
d<br>
simply be included in the driver itself or if necessary a<br>
drivers/usb/host/ehci-s5p.h .<br></blockquote><div><br>=A0I found out some =
code related to this burst function.<br><br>=A0the snip from ehci-s5pv210.c=
, 2.6.35 kernel<br><br>=A0=A0=A0=A0=A0=A0=A0 /* Mark hardware accessible ag=
ain as we are out of D3 state by now */<br>
=A0=A0=A0=A0=A0=A0=A0 set_bit(HCD_FLAG_HW_ACCESSIBLE, &amp;hcd-&gt;flags);<=
br>#if defined(CONFIG_ARCH_S5PV210) || defined(CONFIG_ARCH_S5P6450)<br>=A0=
=A0=A0=A0=A0=A0=A0 ehci_writel(ehci, 0x000F0000, (void __iomem *)ehci-&gt;c=
aps + 0x90);<br>#endif<br>
<br>#if defined(CONFIG_ARCH_S5PV310)<br>=A0=A0=A0=A0=A0=A0=A0 ehci_writel(e=
hci, 0x03C00000, (void __iomem *)ehci-&gt;caps + 0x90);<br>#endif<br>=A0=A0=
=A0=A0=A0=A0=A0 if (ehci_readl(ehci, &amp;ehci-&gt;regs-&gt;configured_flag=
) =3D=3D FLAG_CF) {<br><br>From this code, this burst function seems to be =
depending on CPUs, <br>
The driver by itself is not good idea because echi-s5p.c will have defined.=
<br><br>Which is the better place to pus this CPU specific definition eithe=
r=A0 drivers/usb/host/ehci-s5p.h is <br>or mach/xx.h or=A0 include/linux/us=
b/xxx.h ?=A0 I am not clear about this.<br>
<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Heiko<br>
<div><div class=3D"h5"><br>
&gt; diff --git a/arch/arm/mach-exynos/include/mach/regs-usb-host.h<br>
&gt; b/arch/arm/mach-exynos/include/mach/regs-usb-host.h new file mode 1006=
44<br>
&gt; index 0000000..572b7d4<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/mach-exynos/include/mach/regs-usb-host.h<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2012 Samsung Electronics Co.Ltd<br>
&gt; + * =A0 =A0 =A0 =A0 =A0 <a href=3D"http://www.samsung.com" target=3D"_=
blank">http://www.samsung.com</a><br>
&gt; + *<br>
&gt; + * EXYNOS - USB HOST register definitions<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __REGS_USB_HOST_H<br>
&gt; +#define __REGS_USB_HOST_H __FILE__<br>
&gt; +<br>
&gt; +#define EHCI_INSNREG00(base) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (base + =
0x90)<br>
&gt; +#define EHCI_INSNREG00_ENA_INCR16 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt=
; 25)<br>
&gt; +#define EHCI_INSNREG00_ENA_INCR8 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt=
; 24)<br>
&gt; +#define EHCI_INSNREG00_ENA_INCR4 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt=
; 23)<br>
&gt; +#define EHCI_INSNREG00_ENA_INCRX_ALIGN =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
x1 &lt;&lt; 22)<br>
&gt; +#define EHCI_INSNREG00_ENABLE_DMA_BURST =A0 =A0 =A0\<br>
&gt; + =A0 =A0 (EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 | \<br=
>
&gt; + =A0 =A0 =A0EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN=
)<br>
&gt; +<br>
&gt; +#endif /* __REGS_USB_HOST_H */<br>
<br>
--<br>
</div></div>To unsubscribe from this list: send the line &quot;unsubscribe =
linux-samsung-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</blockquote></div><br>

--20cf30780c5c46300d04ba30b483--


--===============5217693389904283696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============5217693389904283696==--
