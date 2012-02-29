From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Wed, 29 Feb 2012 22:13:31 +0900
Message-ID: <000101ccf6e3$ef27bdf0$cd7739d0$%han@samsung.com>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
 <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org>
 <CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43613 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932610Ab2B2NNd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 08:13:33 -0500
In-reply-to: <CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk


Hi,
> -----Original Message-----
> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> Sent: Wednesday, February 29, 2012 10:02 PM
> To: Sangwook Lee
> Cc: linux-samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org; lin=
ux-arm-kernel@lists.infradead.org;
> ben-linux@fluff.org; gregkh@suse.de; kgene.kim@samsung.com; stern@row=
land.harvard.edu;
> jg1.han@samsung.com; jy0922.shim@samsung.com; patches@linaro.org; lin=
aro-dev@lists.linaro.org;
> linux@arm.linux.org.uk
> Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
>=20
> Hi Sangwook,
>=20
> On 29 February 2012 18:11, Sangwook Lee <sangwook.lee@linaro.org> wro=
te:
> > Enable burst transfer from AHB for EHCI.
> > This fixes data transfer of USB Ethernet with EHCI.
> > Without this patch, scp hardly works.
> >
> > Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> > ---
> > =A0arch/arm/mach-exynos/setup-usb-phy.c =A0 =A0 =A0| =A0 =A06 +++++=
+
> > =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 ++
> > =A0arch/arm/plat-samsung/include/plat/ehci.h | =A0 19 +++++++++++++=
++++++
> > =A03 files changed, 27 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-e=
xynos/setup-usb-phy.c
> > index 41743d2..5a20460 100644
> > --- a/arch/arm/mach-exynos/setup-usb-phy.c
> > +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> > @@ -18,6 +18,7 @@
> > =A0#include <mach/regs-usb-phy.h>
> > =A0#include <plat/cpu.h>
> > =A0#include <plat/usb-phy.h>
> > +#include <plat/ehci.h>
> >
> > =A0static atomic_t host_usage;
> >
> > @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pd=
ev, int type)
> >
> > =A0 =A0 =A0 =A0return -EINVAL;
> > =A0}
> > +
> > +void s5p_ehci_burst_enable(struct platform_device *pdev, void __io=
mem *base)
> > +{
> > + =A0 =A0 =A0 writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNR=
EG00);
> > +}
>=20
> This functionality can be added in ehci-s5p itself and avoid adding a
> new platform callback in platform data. If this is specific to exynos=
,
> driver data could be added in ehci-s5p to indicate platforms that nee=
d
> this to be enabled.

I agree with Thomas's opinion.
Sangwook, please don't call s5p_ehci_burst_enable using platform callba=
ck.
It can be added to ehci-s5p itself.

>=20
> Thanks,
> Thomas.
>=20
> [...]
