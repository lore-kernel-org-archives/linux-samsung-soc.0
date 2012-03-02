From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Add USB HOST register definitions
Date: Fri, 2 Mar 2012 07:31:16 +0530
Message-ID: <CAJuYYwSiKAbMz68GQWCnD9po-cf6=xpWj-wQRcvj4kwneG0sMg@mail.gmail.com>
References: <000701ccf76d$8316b0a0$894411e0$%han@samsung.com>
	<201203011624.04551.heiko@sntech.de>
	<CADPsn1ZfXqmOVtw5OdfbXv=xZ3EREbPqCRnpnsYHbhkvx=nb5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <CADPsn1ZfXqmOVtw5OdfbXv=xZ3EREbPqCRnpnsYHbhkvx=nb5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 1 March 2012 21:40, Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
[...]

> =A0I found out some code related to this burst function.
>
> =A0the snip from ehci-s5pv210.c, 2.6.35 kernel
>
> =A0=A0=A0=A0=A0=A0=A0 /* Mark hardware accessible again as we are out of =
D3 state by now
> */
> =A0=A0=A0=A0=A0=A0=A0 set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> #if defined(CONFIG_ARCH_S5PV210) || defined(CONFIG_ARCH_S5P6450)
> =A0=A0=A0=A0=A0=A0=A0 ehci_writel(ehci, 0x000F0000, (void __iomem *)ehci-=
>caps + 0x90);
> #endif
>
> #if defined(CONFIG_ARCH_S5PV310)
> =A0=A0=A0=A0=A0=A0=A0 ehci_writel(ehci, 0x03C00000, (void __iomem *)ehci-=
>caps + 0x90);
> #endif
> =A0=A0=A0=A0=A0=A0=A0 if (ehci_readl(ehci, &ehci->regs->configured_flag) =
=3D=3D FLAG_CF) {
>
> From this code, this burst function seems to be depending on CPUs,
> The driver by itself is not good idea because echi-s5p.c will have define=
d.
>
> Which is the better place to pus this CPU specific definition either
> drivers/usb/host/ehci-s5p.h is
> or mach/xx.h or=A0 include/linux/usb/xxx.h ?=A0 I am not clear about this.

Any configuration that is controller specific should be in the driver.
If that configuration has a SoC specific behavior, a id_table can be
provided to the platform_driver which can provide any SoC specific
information. The samsung keypad driver is an example of how this can
be handled (drivers/input/keyboard/samsung.c).

Thanks,
Thomas.
