From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCHv4 07/13] ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
Date: Wed, 9 Nov 2011 18:00:20 +0530
Message-ID: <CAJuYYwQK-V0AYcayUdXy+SCAyTYbH6vJrn=+m5LGy6PSxP0Vzg@mail.gmail.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
	<1320369010-23428-8-git-send-email-jamie@jamieiles.com>
	<CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com>
	<20111109115406.GB4253@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:61405 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051Ab1KIMaW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Nov 2011 07:30:22 -0500
Received: by ggnb2 with SMTP id b2so1659833ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 04:30:21 -0800 (PST)
In-Reply-To: <20111109115406.GB4253@totoro>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Rob Herring <robherring2@gmail.com>, linux-arm-kernel@lists.infradead.org, viresh.kumar@st.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, rubini@unipv.it, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 9 November 2011 17:24, Jamie Iles <jamie@jamieiles.com> wrote:
> On Wed, Nov 09, 2011 at 04:55:06PM +0530, Thomas Abraham wrote:
>> Hi Jamie,
>>
>> On 4 November 2011 06:40, Jamie Iles <jamie@jamieiles.com> wrote:
>> > Now that there is a generic IRQ handler for multiple VIC devices u=
se it
>> > for s3c64xx to help building multi platform kernels.
>> >
>> > Cc: Ben Dooks <ben-linux@fluff.org>
>> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
>> > ---
>> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> > =A0arch/arm/mach-s3c64xx/include/mach/entry-macro.S | =A0 =A07 +++=
+---
>> > =A0arch/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-smartq5.c =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-smdk6400.c =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 ++
>> > =A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 ++
>> > =A012 files changed, 25 insertions(+), 3 deletions(-)
>> >
>>
>> I have tested this patch series on smdk6410 board (s3c64xx) using th=
e
>> following repositorty and branch
>>
>> https://github.com/jamieiles/linux-2.6-ji.git =A0branch: vic-dt
>>
>> There is a crash while booting. Am I using the right tree and branch=
?
>> The following is the boot log. Is there any other config option to b=
e
>> enabled?
>
> Hmm, could you please try with the patch below applied?
>
> Rob, I'm not sure if this is the best fix. =A0The alternatives I can =
think
> of would be to always export irq_domain_simple_ops even if
> !CONFIG_OF_IRQ but not set .dt_translate or provide a generic
> irq_domain_null_ops.
>
> Jamie
>
> 8<----
>
> diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
> index 8c5f4b0..9a5fb9e 100644
> --- a/arch/arm/common/vic.c
> +++ b/arch/arm/common/vic.c
> @@ -163,6 +163,10 @@ static int __init vic_pm_init(void)
> =A0late_initcall(vic_pm_init);
> =A0#endif /* CONFIG_PM */
>
> +#ifndef CONFIG_OF_IRQ
> +static const struct irq_domain_ops vic_domain_null_ops;
> +#endif /* !CONFIG_OF_IRQ */
> +
> =A0/**
> =A0* vic_register() - Register a VIC.
> =A0* @base: The base address of the VIC.
> @@ -197,6 +201,8 @@ static void __init vic_register(void __iomem *bas=
e, unsigned int irq,
> =A0#ifdef CONFIG_OF_IRQ
> =A0 =A0 =A0 =A0v->domain.of_node =3D of_node_get(node);
> =A0 =A0 =A0 =A0v->domain.ops =3D &irq_domain_simple_ops;
> +#else /* CONFIG_OF_IRQ */
> + =A0 =A0 =A0 v->domain.ops =3D &vic_domain_null_ops;
> =A0#endif /* CONFIG_OF */
> =A0 =A0 =A0 =A0irq_domain_add(&v->domain);
> =A0}
>

This patch solves the issue and both smdk6410 and smdkv210 works fine.

Thanks,
Thomas.
