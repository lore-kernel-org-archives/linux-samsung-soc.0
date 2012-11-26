From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC 1/2] ARM: S3C24XX: add devicetree support for interrupts
Date: Mon, 26 Nov 2012 16:33:22 +0530
Message-ID: <CAJuYYwR=4_bRvXqFxT56Bsv27A09xLR3Ps3D5kTdHf0G=Jj_Rg@mail.gmail.com>
References: <201211250145.21226.heiko@sntech.de>
	<201211250147.42164.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:35778 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754361Ab2KZLDX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 06:03:23 -0500
Received: by mail-ie0-f174.google.com with SMTP id k11so6061745iea.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Nov 2012 03:03:22 -0800 (PST)
In-Reply-To: <201211250147.42164.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Heiko,

On 25 November 2012 06:17, Heiko St=FCbner <heiko@sntech.de> wrote:
> This adds devicetree parsing of the controller-data for the
> interrupt controllers on S3C24XX architectures.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../interrupt-controller/samsung,s3c24xx-irq.txt   |   57 ++++++
>  arch/arm/mach-s3c24xx/common.h                     |    1 +
>  arch/arm/plat-s3c24xx/irq.c                        |  197 ++++++++++=
++++++++++
>  3 files changed, 255 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/samsung,s3c24xx-irq.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/s=
amsung,s3c24xx-irq.txt b/Documentation/devicetree/bindings/interrupt-co=
ntroller/samsung,s3c24xx-irq.txt
> new file mode 100644
> index 0000000..c637637
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/samsung,=
s3c24xx-irq.txt
> @@ -0,0 +1,57 @@
> +Samsung S3C24XX Interrupt Controllers
> +
> +The S3C24XX SoCs contain custom set of interrupt controllers providi=
ng a
> +varying number of interrupt sources.
> +
> +The set consists of a main- and a sub-controller as well as a contro=
ller
> +for the external interrupts and on newer SoCs even a second main con=
troller.
> +
> +The bit-to-interrupt and parent mapping of the controllers is not fi=
xed
> +over all SoCs and therefore must be defined in the controller descri=
ption.
> +
> +Required properties:
> +- compatible: Compatible property value should be "samsung,s3c24xx-i=
rq".
> +
> +- reg: Physical base address of the controller and length of memory =
mapped
> +  region.
> +
> +- interrupt-controller : Identifies the node as an interrupt control=
ler
> +- #interrupt-cells : Specifies the number of cells needed to encode =
an
> +  interrupt source. The value shall be 2.
> +
> +- s3c24xx,irqlist : List of irqtypes found on this controller as
> +  two-value pairs consisting of irqtype and parent-irq
> +
> +  parent-irq is always the list position of the irq in the irqlist
> +  of the parent controller (0..31)
> +
> +  irqtypes are:
> +  - 0 .. none
> +  - 1 .. external interrupts in the main register (GPF0 .. GPF3)
> +  - 2 .. edge irq in the main register
> +  - 3 .. for parent-irqs, that have sub-irqs in child controllers
> +  - 4 .. level irqs in the sub-register
> +  - 5 .. edge irqs in the sub-register
> +  - 6 .. external irqs in the external irq register (starting with G=
PF4)
> +  - 7 .. irq in the second base irq controller of S3C2416/S3C2450 So=
Cs

Instead of defining the type of interrupt controller as above, is it
possible to create multiple device nodes, with each node representing
a type of interrupt controller with a unique compatible string and
corresponding properties. There will be a init function for each type
of interrupt controller. There should be a irq-domain for each of
these different types of interrupt controller. And then, in the device
tree source file, a proper tree like hierarchy of interrupt
controllers can defined (using the interrupt-parent property for each
controller node). The client nodes that generate the interrupt can
specify the parent node and the interrupt number within the parent to
which they generate the interrupt.

Thanks,
Thomas.

> +
> +Optional properties:
> +- interrupt_parent : The parent interrupt controller
> +
> +Example:
> +
> +       intc2:interrupt-controller@4a000040 {
> +               compatible =3D "samsung,s3c24xx-irq";
> +               reg =3D <0x4a000040 0x18>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +
> +               s3c24xx,irqlist =3D <7 0 /* 2D */
> +                                  7 0 /* IIC1 */
> +                                  0 0 /* reserved */
> +                                  0 0 /* reserved */
> +                                  7 0 /* PCM0 */
> +                                  7 0 /* PCM1 */
> +                                  7 0 /* I2S0 */
> +                                  7 0>; /* I2S1 */
> +       };
> diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/c=
ommon.h
> index ed6276f..7a7b770 100644
> --- a/arch/arm/mach-s3c24xx/common.h
> +++ b/arch/arm/mach-s3c24xx/common.h
> @@ -16,5 +16,6 @@ void s3c2410_restart(char mode, const char *cmd);
>  void s3c244x_restart(char mode, const char *cmd);
>
>  extern struct syscore_ops s3c24xx_irq_syscore_ops;
> +extern void s3c24xx_init_irq_of(void);
>
>  #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.=
c
> index 0510627..4f8fe4a 100644
> --- a/arch/arm/plat-s3c24xx/irq.c
> +++ b/arch/arm/plat-s3c24xx/irq.c
> @@ -25,6 +25,9 @@
>  #include <linux/slab.h>
>
>  #include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
>
>  #include <asm/irq.h>
>  #include <asm/mach/irq.h>
> @@ -956,3 +959,197 @@ void __init s3c2443_init_irq(void)
>         s3c24xx_init_irq();
>  }
>  #endif
> +
> +#ifdef CONFIG_OF
> +static int __init s3c24xx_init_intc_of(struct device_node *np,
> +                                      struct device_node *interrupt_=
parent)
> +{
> +       struct s3c_irq_intc *intc;
> +       struct s3c_irq_intc *parent;
> +       struct s3c_irq_data *irq_data;
> +       struct property *intc_prop;
> +       int irq_num =3D 0, irq_start =3D 0, irq_offset =3D 0;
> +       int ret, i, cnt;
> +       const __be32 *p;
> +       u32 val;
> +
> +       intc =3D kzalloc(sizeof(struct s3c_irq_intc), GFP_KERNEL);
> +       if (!intc)
> +               return -ENOMEM;
> +
> +       p =3D of_get_address(np, 0, NULL, NULL);
> +       if (!p) {
> +               pr_err("irq: register address missing\n");
> +               ret =3D -EINVAL;
> +               goto err_addr;
> +       }
> +
> +       /* select the correct data for the controller.
> +        * Need to hard code the irq num start and offset
> +        * to preserve the static mapping for now
> +        */
> +       switch (of_translate_address(np, p)) {
> +       case 0x4a000000:
> +               pr_debug("irq: found main intc\n");
> +               intc->reg_pending =3D S3C2410_SRCPND;
> +               intc->reg_intpnd =3D S3C2410_INTPND;
> +               intc->reg_mask =3D S3C2410_INTMSK;
> +               irq_num =3D 32;
> +               irq_start =3D S3C2410_IRQ(0);
> +               irq_offset =3D 0;
> +               break;
> +       case 0x560000a4:
> +               pr_debug("irq: found extintc\n");
> +               intc->reg_pending =3D S3C2410_EINTPEND;
> +               intc->reg_mask =3D S3C2410_EINTMASK;
> +               irq_num =3D 20;
> +               irq_start =3D S3C2410_IRQ(32);
> +               irq_offset =3D 4;
> +               break;
> +       case 0x4a000018:
> +               pr_debug("irq: found subintc\n");
> +               intc->reg_pending =3D S3C2410_SUBSRCPND;
> +               intc->reg_mask =3D S3C2410_INTSUBMSK;
> +               irq_num =3D 29;
> +               irq_start =3D S3C2410_IRQSUB(0);
> +               irq_offset =3D 0;
> +               break;
> +       case 0x4a000040:
> +               pr_debug("irq: found intc2\n");
> +               intc->reg_pending =3D S3C2416_SRCPND2;
> +               intc->reg_intpnd =3D S3C2416_INTPND2;
> +               intc->reg_mask =3D S3C2416_INTMSK2;
> +               irq_num =3D 8;
> +               irq_start =3D S3C2416_IRQ(0);
> +               irq_offset =3D 0;
> +               break;
> +       case 0:
> +               pr_err("irq: couldn't translate address\n");
> +               ret =3D -EINVAL;
> +               goto err_addr;
> +       default:
> +               pr_err("irq: unsupported controller address\n");
> +               ret =3D -EINVAL;
> +               goto err_addr;
> +       }
> +
> +       irq_data =3D kzalloc(sizeof(struct s3c_irq_data) * 32, GFP_KE=
RNEL);
> +       if (!irq_data) {
> +               ret =3D -ENOMEM;
> +               goto err_addr;
> +       }
> +
> +       cnt =3D 0;
> +       intc_prop =3D of_find_property(np, "s3c24xx,irqlist", NULL);
> +       if (!intc_prop) {
> +               pr_err("irq: irqlist not found\n");
> +               ret =3D -EINVAL;
> +               goto err_data;
> +       }
> +
> +       /* build the irq_data list */
> +       p =3D NULL;
> +       for (i =3D 0; i < 32; i++) {
> +               p =3D of_prop_next_u32(intc_prop, p, &val);
> +
> +               /* when we hit the first non-valid element, assume it=
's
> +                * the end of the list. The rest of the fields are
> +                * already of type S3C_IRQTYPE_NONE (value 0)
> +                */
> +               if (!p)
> +                       break;
> +
> +               irq_data[i].type =3D val;
> +
> +               p =3D of_prop_next_u32(intc_prop, p, &val);
> +               if (!p) {
> +                       pr_warn("irq: uneven number of elements in ir=
qlist, last value will be dropped\n");
> +                       irq_data[i].type =3D 0;
> +                       break;
> +               }
> +
> +               irq_data[i].parent_irq =3D val;
> +
> +               pr_debug("irq: found hwirq %d with type %d and parent=
 %lu\n",
> +                        i, irq_data[i].type, irq_data[i].parent_irq)=
;
> +               cnt++;
> +       }
> +
> +       /* if we haven't found any irq definition at all,
> +        * something is very wrong.
> +        */
> +       if (!cnt) {
> +               pr_err("irq: empty irq definition\n");
> +               ret =3D -EINVAL;
> +               goto err_data;
> +       }
> +
> +       intc->irqs =3D irq_data;
> +
> +       /* put the intc into the dt as property, so we can access it =
from
> +        * as the interrupt_parent later
> +        */
> +
> +       intc_prop =3D kzalloc(sizeof(struct property), GFP_KERNEL);
> +       if (!intc_prop) {
> +               ret =3D -ENOMEM;
> +               goto err_data;
> +       }
> +
> +       intc_prop->name =3D kstrdup("s3c-irq-intc", GFP_KERNEL);
> +       intc_prop->value =3D intc;
> +       intc_prop->length =3D sizeof(struct s3c_irq_intc);
> +
> +       ret =3D prom_add_property(np, intc_prop);
> +       if (ret) {
> +               pr_err("irq: failed to add dt property\n");
> +               goto err_prop;
> +       }
> +
> +       /* set the parent relationship */
> +       if (interrupt_parent) {
> +               parent =3D (struct s3c_irq_intc *)of_get_property(
> +                                     interrupt_parent, "s3c-irq-intc=
", NULL);
> +               if (!parent) {
> +                       pr_err("irq: no parent for non-root controlle=
r found\n");
> +                       goto err_domain;
> +               }
> +
> +               intc->parent =3D parent;
> +       }
> +
> +       /* now that all the data is complete, init the irq-domain */
> +       s3c24xx_clear_intc(intc);
> +       intc->domain =3D irq_domain_add_legacy(np, irq_num, irq_start=
,
> +                                            irq_offset, &s3c24xx_irq=
_ops,
> +                                            intc);
> +       if (!intc->domain) {
> +               pr_err("irq: could not create irq-domain\n");
> +               ret =3D -EINVAL;
> +               goto err_domain;
> +       }
> +
> +       return 0;
> +
> +err_domain:
> +       prom_remove_property(np, intc_prop);
> +err_prop:
> +       kfree(intc_prop);
> +err_data:
> +       kfree(irq_data);
> +err_addr:
> +       kfree(intc);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id s3c24xx_irq_match[] __initconst =3D=
 {
> +       { .compatible =3D "samsung,s3c24xx-irq", .data =3D s3c24xx_in=
it_intc_of, },
> +       { /* sentinel */ }
> +};
> +
> +void __init s3c24xx_init_irq_of(void)
> +{
> +       of_irq_init(s3c24xx_irq_match);
> +}
> +#endif
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
