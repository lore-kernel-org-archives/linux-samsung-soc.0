From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] gpio: samsung: add devicetree init for s3c24xx arches
Date: Mon, 27 Aug 2012 10:01:03 +0200
Message-ID: <201208271001.05026.heiko@sntech.de>
References: <201208252353.59345.heiko@sntech.de>
 <CAJuYYwQBOP7-D0fepDsCr+43ASKQ3CmMBMH-M79QH7r=xS85Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJuYYwQBOP7-D0fepDsCr+43ASKQ3CmMBMH-M79QH7r=xS85Eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thomas,

thanks for your review:

Am Montag, 27. August 2012, 06:20:49 schrieb Thomas Abraham:
> Hi Heiko,
> =

> On 26 August 2012 03:23, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> > Until now the Exynos-SoC was the only Samsung-SoC supporting the GPIOs
> > via the device tree. This patch implements dt-support for the
> > s3c24xx arches.
> > =

> > The controllers contain only 3 cells, as the underlying gpio controller
> > does not support controlling the drive strength on a gpio level.
> > =

> > Tested with the gpio-keys driver on a s3c2416 based machine.
> > =

> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> > =

> >  .../devicetree/bindings/gpio/gpio-samsung.txt      |   38 ++++++++++++
> >  drivers/gpio/gpio-samsung.c                        |   63
> >  ++++++++++++++++++++ 2 files changed, 101 insertions(+), 0 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> > b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt index
> > 5375625..ce6a7d4 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
> > =

> > @@ -39,3 +39,41 @@ Example:
> >                 #gpio-cells =3D <4>;
> >                 gpio-controller;
> >         =

> >         };
> > =

> > +
> > +
> > +Samsung S3C24XX GPIO Controller
> > +
> > +Required properties:
> > +- compatible: Compatible property value should be
> > "samsung,s3c24xx-gpio".
> =

> This is debatable, but I would choose to be specific here and use
> "samsing,s3c2416-gpio". For instance, SoC's in s3c24xx family have
> differing value for pull none/down/up.

Hmmm, but the logic to drive the gpio controller is the same for all arches=
. =

The only difference is the number to use for the different pull up/down =

settings. So I think the "samsung,s3c24xx-gpio" is ok but the documentation =

should simply reflect the different pull settings.


> > +
> > +- reg: Physical base address of the controller and length of memory
> > mapped +  region.
> > +
> > +- #gpio-cells: Should be 3. The syntax of the gpio specifier used by
> > client nodes +  should be the following with values derived from the SoC
> > user manual. +     <[phandle of the gpio controller node]
> > +      [pin number within the gpio controller]
> > +      [mux function]
> > +      [flags and pull up/down]
> > +
> > +  Values for gpio specifier:
> > +  - Pin number: depending on the controller a number from 0 up to 15.
> > +  - Flags and Pull Up/Down: 0 - Pull Up/Down Disabled.
> > +                            1 - Pull Down Enabled.
> > +                            3 - Pull Up Enabled.
> =

> As per s3c2416 user manual, 2 is used for Pull Up and 3 is listed as
> reserved value. Any particular reason to use 3 here for pull up and
> not 2 as per the user manual?

Sorry, copy and paste error :-)


> > +          Bit 16 (0x00010000) - Input is active low.
> > +
> > +- gpio-controller: Specifies that the node is a gpio controller.
> > +- #address-cells: should be 1.
> > +- #size-cells: should be 1.
> =

> It would be informative to add information about the 'mux function'
> cell here as well. Specifically, on how to handle the banks that have
> an extended GPxSEL register that allow additional pin function
> selection.

Will add a mux function description.

Until now I've never realised the existence of the GPxSEL registers, so tha=
nks =

for the pointer :-).

But is this used in the driver at all? All the setcfg/getcfg functions in =

gpio-samsung.c only handle the GPxCON registers - I haven't found code to =

handle the GPxSEL registers at all. So my guess is that this was never =

implemented - or that I'm blind ;-) .


> > +
> > +Example:
> > +
> > +       gpa: gpio-controller@56000000 {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               compatible =3D "samsung,s3c24xx-gpio";
> > +               reg =3D <0x56000000 0x10>;
> > +               #gpio-cells =3D <3>;
> > +               gpio-controller;
> > +       };
> > diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> > index a150d2e..80a2817 100644
> > --- a/drivers/gpio/gpio-samsung.c
> > +++ b/drivers/gpio/gpio-samsung.c
> > @@ -938,6 +938,67 @@ static void __init samsung_gpiolib_add(struct
> > samsung_gpio_chip *chip)
> > =

> >                 s3c_gpiolib_track(chip);
> >  =

> >  }
> > =

> > +#if defined(CONFIG_PLAT_S3C24XX) && defined(CONFIG_OF)
> > +static int s3c24xx_gpio_xlate(struct gpio_chip *gc,
> > +                       const struct of_phandle_args *gpiospec, u32
> > *flags) +{
> > +       unsigned int pin;
> > +
> > +       if (WARN_ON(gc->of_gpio_n_cells < 3))
> > +               return -EINVAL;
> > +
> > +       if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> > +               return -EINVAL;
> > +
> > +       if (gpiospec->args[0] > gc->ngpio)
> > +               return -EINVAL;
> > +
> > +       pin =3D gc->base + gpiospec->args[0];
> > +
> > +       if (s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(gpiospec->args[1])))
> > +               pr_warn("gpio_xlate: failed to set pin function\n");
> > +       if (s3c_gpio_setpull(pin, gpiospec->args[2] & 0xffff))
> > +               pr_warn("gpio_xlate: failed to set pin pull up/down\n");
> > +
> > +       if (flags)
> > +               *flags =3D gpiospec->args[2] >> 16;
> > +
> > +       return gpiospec->args[0];
> > +}
> > +
> > +static const struct of_device_id s3c24xx_gpio_dt_match[] __initdata =
=3D {
> > +       { .compatible =3D "samsung,s3c24xx-gpio", },
> > +       {}
> > +};
> > +
> > +static __init void s3c24xx_gpiolib_attach_ofnode(struct
> > samsung_gpio_chip *chip, +                                              =

> >  u64 base, u64 offset) +{
> > +       struct gpio_chip *gc =3D  &chip->chip;
> > +       u64 address;
> > +
> > +       if (!of_have_populated_dt())
> > +               return;
> > +
> > +       address =3D chip->base ? base + ((u32)chip->base & 0xfff) : bas=
e +
> > offset; +       gc->of_node =3D of_find_matching_node_by_address(NULL,
> > +                       s3c24xx_gpio_dt_match, address);
> > +       if (!gc->of_node) {
> > +               pr_info("gpio: device tree node not found for gpio
> > controller" +                       " with base address %08llx\n",
> > address); +               return;
> > +       }
> > +       gc->of_gpio_n_cells =3D 3;
> > +       gc->of_xlate =3D s3c24xx_gpio_xlate;
> > +}
> > +#elif defined(CONFIG_PLAT_S3C24XX)
> > +static __init void s3c24xx_gpiolib_attach_ofnode(struct
> > samsung_gpio_chip *chip, +                                              =

> >  u64 base, u64 offset) +{
> > +       return;
> > +}
> > +#endif /* defined(CONFIG_PLAT_S3C24XX) && defined(CONFIG_OF) */
> > +
> > =

> >  static void __init s3c24xx_gpiolib_add_chips(struct samsung_gpio_chip
> >  *chip,
> >  =

> >                                              int nr_chips, void __iomem
> >                                              *base)
> >  =

> >  {
> > =

> > @@ -962,6 +1023,8 @@ static void __init s3c24xx_gpiolib_add_chips(struct
> > samsung_gpio_chip *chip,
> > =

> >                         gc->direction_output =3D
> >                         samsung_gpiolib_2bit_output;
> >                 =

> >                 samsung_gpiolib_add(chip);
> > =

> > +
> > +               s3c24xx_gpiolib_attach_ofnode(chip, S3C24XX_PA_GPIO, i *
> > 0x10);
> > =

> >         }
> >  =

> >  }
> > =

> > --
> > 1.7.2.3
> =

> Overall, this is patch looks fine.
> =

> Reviewed-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


Heiko
