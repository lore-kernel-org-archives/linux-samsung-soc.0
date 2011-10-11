From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] gpio: exynos4: Add device tree support
Date: Tue, 11 Oct 2011 20:49:35 +0530
Message-ID: <CAJuYYwRwBxkAo2fMfVV9wtQ40XeROAnc-cGJK+cssjuh9px=qQ@mail.gmail.com>
References: <1318320974-9879-1-git-send-email-thomas.abraham@linaro.org>
	<4E945C90.1050601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:55788 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754089Ab1JKPTh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 11:19:37 -0400
Received: by ywb5 with SMTP id 5so6668341ywb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2011 08:19:36 -0700 (PDT)
In-Reply-To: <4E945C90.1050601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Rob,

On 11 October 2011 20:41, Rob Herring <robherring2@gmail.com> wrote:
> Thomas,
>
> On 10/11/2011 03:16 AM, Thomas Abraham wrote:
>> As gpio chips get registered, a device tree node which represents th=
e
>> gpio chip is searched and attached to it. A translate function is al=
so
>> provided to convert the gpio specifier into actual platform settings
>> for pin function selection, pull up/down and driver strength setting=
s.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> This patch is based on the latest consolidated Samsung GPIO driver a=
vailable
>> in the following tree:
>> =A0 https://github.com/kgene/linux-samsung.git =A0branch: for-next
>>
>> =A0.../devicetree/bindings/gpio/gpio-samsung.txt =A0 =A0 =A0| =A0 30=
 +++++++++++
>> =A0drivers/gpio/gpio-samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 53 ++++++++++++++++++++
>> =A02 files changed, 83 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sa=
msung.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt=
 b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> new file mode 100644
>> index 0000000..883faeb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> @@ -0,0 +1,30 @@
>> +Samsung Exynos4 GPIO Controller
>> +
>> +Required properties:
>> +- compatible: Format of compatible property value should be
>> + =A0"samsung,exynos4-gpio-<controller_name>". Example: For GPA0 con=
troller, the
>> + =A0compatible property value should be "samsung,exynos4-gpio-gpa0"=
=2E
>
> Isn't gpa0 an instance of the h/w, not a version?

GPA0 is a instance of the gpio controller. There are several such
instances and there could be differences in those instances such as
the number of GPIO lines managed by that gpio controller instance.

>
>> +
>> +- reg: Physical base address of the controller and length of memory=
 mapped region.
>> +
>> +- #gpio-cells: Should be 4. The syntax of the gpio specifier used b=
y client nodes
>> + =A0should be the following with values derived from the SoC user m=
anual.
>> + =A0 =A0 <[phandle of the gpio controller node] <pin number within =
the gpio controller]
>> + =A0 =A0 =A0[mux function] [pull up/down] [drive strength]>
>
> It would be better to list out the values here.

Ok. I will do that in the next version of the patch.

>
>> +
>> +- gpio-controller: Specifies that the node is a gpio controller.
>> +
>> +- #address-cells: should be 1.
>> +
>> +- #size-cells: should be 1.
>> +
>> +Example:
>> +
>> + =A0 =A0 gpa0: gpio-controller@11400000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-gpio-gpa0"=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x11400000 0x20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
>> + =A0 =A0 };
>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung=
=2Ec
>> index b6be77a..037d3bb 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c
>> @@ -24,6 +24,10 @@
>> =A0#include <linux/interrupt.h>
>> =A0#include <linux/sysdev.h>
>> =A0#include <linux/ioport.h>
>> +#ifdef CONFIG_OF
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +#endif
>
> Don't need the ifdef here.

Ok. I will remove it.

>
>>
>> =A0#include <asm/irq.h>
>>
>> @@ -2353,6 +2357,52 @@ static struct samsung_gpio_chip exynos4_gpios=
_3[] =3D {
>> =A0#endif
>> =A0};
>>
>> +#if defined(CONFIG_ARCH_EXYNOS4) && defined(CONFIG_OF)
>> +int exynos4_gpio_xlate(struct gpio_chip *gc, struct device_node *np=
,
>
> static

Ok. I will add it.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const void *gpio_spec, =
u32 *flags)
>> +{
>> + =A0 =A0 const __be32 *gpio =3D gpio_spec;
>> + =A0 =A0 const u32 n =3D be32_to_cpup(gpio);
>> + =A0 =A0 unsigned int pin =3D gc->base + be32_to_cpu(gpio[0]);
>> +
>> + =A0 =A0 if (gc->of_gpio_n_cells < 4) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 WARN_ON(1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (n > gc->ngpio)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(be32_to_cpu(gpio[1])));
>> + =A0 =A0 s3c_gpio_setpull(pin, be32_to_cpu(gpio[2]));
>> + =A0 =A0 s5p_gpio_set_drvstr(pin, be32_to_cpu(gpio[3]));
>> + =A0 =A0 return n;
>> +}
>> +
>> +static __init void exynos4_gpiolib_attach_ofnode(struct gpio_chip *=
gc)
>> +{
>> + =A0 =A0 const char exynos4_gpio_compat_base[] =3D "samsung,exynos4=
-gpio-";
>> + =A0 =A0 char *exynos4_gpio_compat;
>> +
>> + =A0 =A0 exynos4_gpio_compat =3D kzalloc(strlen(exynos4_gpio_compat=
_base) +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlen(gc-=
>label), GFP_KERNEL);
>> + =A0 =A0 if (!exynos4_gpio_compat)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> +
>> + =A0 =A0 strcpy(exynos4_gpio_compat, exynos4_gpio_compat_base);
>> + =A0 =A0 strcat(exynos4_gpio_compat, gc->label);
>> + =A0 =A0 gc->of_node =3D of_find_compatible_node(NULL, NULL, exynos=
4_gpio_compat);
>> + =A0 =A0 gc->of_gpio_n_cells =3D 4;
>> + =A0 =A0 gc->of_xlate =3D exynos4_gpio_xlate;
>> + =A0 =A0 kfree(exynos4_gpio_compat);
>> +}
>> +#else
>> +static __init void exynos4_gpiolib_attach_ofnode(struct gpio_chip *=
chip)
>> +{
>> + =A0 =A0 return;
>> +}
>> +#endif /* defined(CONFIG_ARCH_EXYNOS4) && defined(CONFIG_OF) */
>> +
>> =A0/* TODO: cleanup soc_is_* */
>> =A0static __init int samsung_gpiolib_init(void)
>> =A0{
>> @@ -2434,6 +2484,7 @@ static __init int samsung_gpiolib_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->co=
nfig =3D &exynos4_gpio_cfg;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->gr=
oup =3D group++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_gpiolib_attach_ofn=
ode(&chip->chip);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(exynos4_g=
pios_1, nr_chips, S5P_VA_GPIO1);
>>
>> @@ -2446,6 +2497,7 @@ static __init int samsung_gpiolib_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->co=
nfig =3D &exynos4_gpio_cfg;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->gr=
oup =3D group++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_gpiolib_attach_ofn=
ode(&chip->chip);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(exynos4_g=
pios_2, nr_chips, S5P_VA_GPIO2);
>>
>> @@ -2458,6 +2510,7 @@ static __init int samsung_gpiolib_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->co=
nfig =3D &exynos4_gpio_cfg;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->gr=
oup =3D group++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_gpiolib_attach_ofn=
ode(&chip->chip);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung_gpiolib_add_4bit_chips(exynos4_g=
pios_3, nr_chips, S5P_VA_GPIO3);
>>
>
> This code is really ugly, but I guess you inherited it. Converting to=
 a
> platform driver and using id table would be much cleaner.

Ok. I wanted to get the initial dt support for gpio controller on
Exynos started because dt support for other controllers depend on
this. I will revisit this as per your suggestion during the 3.2 cycle.

Thanks for reviewing this patch.

Regards,
Thomas

>
> Rob
>
