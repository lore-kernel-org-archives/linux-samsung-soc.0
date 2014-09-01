From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: Do not calculate boot address twice
Date: Mon, 01 Sep 2014 10:39:14 +0200
Message-ID: <1409560754.26751.2.camel@AMDC1943>
References: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
 <032901cf9763$b7733150$265993f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <032901cf9763$b7733150$265993f0$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-07-04 at 17:41 +0900, Kukjin Kim wrote:
> Krzysztof Kozlowski wrote:
> >=20
> > Commit b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT
> > bindings") introduced local variable boot_reg where boot address fr=
om
> > cpu_boot_reg() call is stored. Re-use it instead calling cpu_boot_r=
eg()
> > again.
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  arch/arm/mach-exynos/platsmp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/=
platsmp.c
> > index 1c8d31e39520..55ed2e6729c5 100644
> > --- a/arch/arm/mach-exynos/platsmp.c
> > +++ b/arch/arm/mach-exynos/platsmp.c
> > @@ -155,7 +155,7 @@ static int exynos_boot_secondary(unsigned int c=
pu, struct task_struct *idle)
> >  				ret =3D PTR_ERR(boot_reg);
> >  				goto fail;
> >  			}
> > -			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
> > +			__raw_writel(boot_addr, boot_reg);
> >  		}
> >=20
> >  		call_firmware_op(cpu_boot, phys_cpu);
> > @@ -242,7 +242,7 @@ static void __init exynos_smp_prepare_cpus(unsi=
gned int max_cpus)
> >=20
> >  			if (IS_ERR(boot_reg))
> >  				break;
> > -			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
> > +			__raw_writel(boot_addr, boot_reg);
> >  		}
> >  	}
> >  }
> > --
> > 1.9.1
>=20
> Oh, good catch. will apply :-)

Hi Kukjin,

I cannot find this patch in your tree or in next. Did you applied this?=
=20

Best regards,
Krzysztof


> Thanks,
> Kukjin
