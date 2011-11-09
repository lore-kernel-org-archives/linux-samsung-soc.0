From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv4 07/13] ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
Date: Wed, 9 Nov 2011 11:54:06 +0000
Message-ID: <20111109115406.GB4253@totoro>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
 <1320369010-23428-8-git-send-email-jamie@jamieiles.com>
 <CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:65377 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378Ab1KILyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Nov 2011 06:54:12 -0500
Received: by wwh12 with SMTP id 12so562814wwh.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 03:54:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org, viresh.kumar@st.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, rubini@unipv.it, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wed, Nov 09, 2011 at 04:55:06PM +0530, Thomas Abraham wrote:
> Hi Jamie,
>=20
> On 4 November 2011 06:40, Jamie Iles <jamie@jamieiles.com> wrote:
> > Now that there is a generic IRQ handler for multiple VIC devices us=
e it
> > for s3c64xx to help building multi platform kernels.
> >
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> > ---
> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 =A01 +
> > =A0arch/arm/mach-s3c64xx/include/mach/entry-macro.S | =A0 =A07 ++++=
---
> > =A0arch/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-smartq5.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-smdk6400.c =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 ++
> > =A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 ++
> > =A012 files changed, 25 insertions(+), 3 deletions(-)
> >
>=20
> I have tested this patch series on smdk6410 board (s3c64xx) using the
> following repositorty and branch
>=20
> https://github.com/jamieiles/linux-2.6-ji.git  branch: vic-dt
>=20
> There is a crash while booting. Am I using the right tree and branch?
> The following is the boot log. Is there any other config option to be
> enabled?

Hmm, could you please try with the patch below applied?

Rob, I'm not sure if this is the best fix.  The alternatives I can thin=
k=20
of would be to always export irq_domain_simple_ops even if=20
!CONFIG_OF_IRQ but not set .dt_translate or provide a generic=20
irq_domain_null_ops.

Jamie

8<----

diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
index 8c5f4b0..9a5fb9e 100644
--- a/arch/arm/common/vic.c
+++ b/arch/arm/common/vic.c
@@ -163,6 +163,10 @@ static int __init vic_pm_init(void)
 late_initcall(vic_pm_init);
 #endif /* CONFIG_PM */
=20
+#ifndef CONFIG_OF_IRQ
+static const struct irq_domain_ops vic_domain_null_ops;
+#endif /* !CONFIG_OF_IRQ */
+
 /**
  * vic_register() - Register a VIC.
  * @base: The base address of the VIC.
@@ -197,6 +201,8 @@ static void __init vic_register(void __iomem *base,=
 unsigned int irq,
 #ifdef CONFIG_OF_IRQ
 	v->domain.of_node =3D of_node_get(node);
 	v->domain.ops =3D &irq_domain_simple_ops;
+#else /* CONFIG_OF_IRQ */
+	v->domain.ops =3D &vic_domain_null_ops;
 #endif /* CONFIG_OF */
 	irq_domain_add(&v->domain);
 }
