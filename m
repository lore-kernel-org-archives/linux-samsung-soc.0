From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Sat, 7 Jan 2012 16:16:37 +0530
Message-ID: <CAJuYYwQjQF_6qbPPCG68vcu=xgoj+jRXuTsHBA2VcSiUM95g-g@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
 <4F05F509.6020405@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F05F509.6020405@metafoo.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-samsung-soc@vger.kernel.org, kwangwoo.lee@gmail.com, patches@linaro.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, cbou@mail.ru, kyungmin.park@samsung.com, kgene.kim@samsung.com, rpurdie@rpsys.net, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, augulis.darius@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Lars,

On 6 January 2012 00:37, Lars-Peter Clausen <lars@metafoo.de> wrote:
>> [...]
>>
>> diff --git a/Documentation/devicetree/bindings/lcd/lcd-pwrctrl.txt b/Doc=
umentation/devicetree/bindings/lcd/lcd-pwrctrl.txt
[...]

>> +Optional properties:
>> +- lcd,pwrctrl-nreset-gpio-invert: When the nRESET line is asserted low,=
 the
>> + =A0lcd panel is reset and stays in reset mode as long as the nRESET li=
ne is
>> + =A0asserted low. This is the default behaviour of most lcd panels. If =
a lcd
>> + =A0panel requires the nRESET line to be asserted high for panel reset,=
 then
>> + =A0this property is used.
>
> Maybe use OF_GPIO_ACTIVE_LOW here instead. That would make active high the
> default but be a bit more consistent.

Thanks for pointing this out. But most of these panels have active low
RESET line. So OF_GPIO_ACTIVE_LOW will need to be added for every lcd
node in dts file. How about adding a new 'OF_GPIO_ACTIVE_HIGH' instead
and keeping active-low the default?

>
>> +- lcd,pwrctrl-min-uV: If a regulator controls the Vcc voltage of the lc=
d panel,
>> + =A0this property specifies the minimum voltage the regulator should su=
pply.
>> + =A0The value of this property should in in micro-volts.
>> +- lcd,pwrctrl-max-uV: If a regulator controls the Vcc voltage of the lc=
d panel,
>> + =A0this property specifies the maximum voltage the regulator should li=
mit to
>> + =A0on the Vcc line. The value of this property should in in micro-volt=
s.
>
> The min and max voltage should rather be specified through the regulator
> constraints.

The min and max voltage is a panel specific property which is used to
configure the regulator. The regulator might be capable of a larger
range but these value is used to setup the regulator to output a
voltage suitable for the panel.

>
>
>> +- vcc-lcd-supply: phandle of the regulator that controls the vcc supply=
 to
>> + =A0the lcd panel.
>> +
> [...]
>> diff --git a/drivers/video/backlight/lcd_pwrctrl.c b/drivers/video/backl=
ight/lcd_pwrctrl.c
>> new file mode 100644
>> index 0000000..6f3110b
>> --- /dev/null
>> +++ b/drivers/video/backlight/lcd_pwrctrl.c
>> @@ -0,0 +1,231 @@
>> [...]
>> +static int lcd_pwrctrl_set_power(struct lcd_device *lcd, int power)
>> +{
>> + =A0 =A0 struct lcd_pwrctrl *lp =3D lcd_get_data(lcd);
>> + =A0 =A0 struct lcd_pwrctrl_data *pd =3D lp->pdata;
>> + =A0 =A0 int lcd_enable, lcd_reset;
>> +
>> + =A0 =A0 lcd_enable =3D (power =3D=3D FB_BLANK_POWERDOWN || lp->suspend=
ed) ? 0 : 1;
>> + =A0 =A0 lcd_reset =3D (pd->invert) ? !lcd_enable : lcd_enable;
>> +
>> + =A0 =A0 if (IS_ERR(lp->regulator))
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto no_regulator;
>
> I wouldn't use a goto here.

Ok. I was not happy either while writing it. I will re-work this.

>
>> +
>> + =A0 =A0 if (lcd_enable) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if ((pd->min_uV || pd->max_uV) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_set_voltage(lp->regu=
lator,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 pd->min_uV, pd->max_uV))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(lp->d=
ev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 "regulator voltage set failed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (regulator_enable(lp->regulator))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(lp->dev, "failed to e=
nable regulator\n");
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 regulator_disable(lp->regulator);
>> + =A0 =A0 }
>
> I think you have to make sure that the regulator enable and disable calls=
 are
> balanced.

Ok. I was check on this and do required changes.

>
>> +
>> + no_regulator:
>> + =A0 =A0 gpio_direction_output(lp->pdata->gpio, lcd_reset);
>> + =A0 =A0 lp->power =3D power;
>> + =A0 =A0 return 0;
>> +}
>> +
> [...]
>> +
>> +#ifdef CONFIG_OF
>
> I think you can remove all the CONFIG_OF ifdefs, the of API should stub i=
tself out.

This #ifdef is to keep the OF code out in case of non-OF only compilation.

[...]

>> + =A0 =A0 err =3D gpio_request(pdata->gpio, "LCD-nRESET");
>> + =A0 =A0 if (err) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "gpio [%d] request failed\n", pda=
ta->gpio);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return err;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 lp =3D devm_kzalloc(dev, sizeof(struct lcd_pwrctrl), GFP_KERNE=
L);
>> + =A0 =A0 if (!lp) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "memory allocation failed for pri=
vate data\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>
> You are leaking the gpio here.

Ok. I will fix this.

>
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* If power to lcd and/or lcd interface is controlled using =
a regulator,
>> + =A0 =A0 =A0* get the handle to the regulator for later use during powe=
r switching.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 lp->regulator =3D regulator_get(dev, "vcc-lcd");
>> + =A0 =A0 if (IS_ERR(lp->regulator))
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_info(dev, "could not find regulator\n");
>> +
>> + =A0 =A0 lp->dev =3D dev;
>> + =A0 =A0 lp->pdata =3D pdata;
>> + =A0 =A0 lp->lcd =3D lcd_device_register(dev_name(dev), dev, lp, &lcd_p=
wrctrl_ops);
>> + =A0 =A0 if (IS_ERR(lp->lcd)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "cannot register lcd device\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 regulator_put(lp->regulator);
>
> And here.

Ok. I will fix this.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(lp->lcd);
>> + =A0 =A0 }
>> +
>> + =A0 =A0 platform_set_drvdata(pdev, lp);
>> + =A0 =A0 lcd_pwrctrl_set_power(lp->lcd, FB_BLANK_NORMAL);
>> + =A0 =A0 return 0;
>> +}
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id lcd_pwrctrl_match[] =3D {
>> + =A0 =A0 { .compatible =3D "lcd,powerctrl", },
>> + =A0 =A0 {},
>> +};
>
> MODULE_DEVICE_TABLE(...)

Right. I missed that.

>
>> +#endif
>
>
>> +static struct platform_driver lcd_pwrctrl_driver =3D {
>> + =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "lcd-pwrctrl",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(lcd_pwrctrl_m=
atch),
>> + =A0 =A0 },
>> + =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D lcd_pwrctrl_probe,
>> + =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D lcd_pwrctrl_remove,
>> + =A0 =A0 .suspend =A0 =A0 =A0 =A0=3D lcd_pwrctrl_suspend,
>> + =A0 =A0 .resume =A0 =A0 =A0 =A0 =3D lcd_pwrctrl_resume,
>
> please use dev_pm_ops instead of the legacy callbacks

Ok. I will use dev_pm_ops here.

[...]

Thanks for your review Lars.

Regards,
Thomas.
