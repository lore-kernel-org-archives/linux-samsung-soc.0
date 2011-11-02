From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2] gpio/samsung: Add device tree support for Exynos4
Date: Wed, 2 Nov 2011 18:35:05 +0530
Message-ID: <CAJuYYwSfjg04gaJUgNkUzFNgs5d_7PL9nio-1RwrPizyShTxGQ@mail.gmail.com>
References: <1320108227-2693-1-git-send-email-thomas.abraham@linaro.org>
	<4EAFAC42.5080607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:34573 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375Ab1KBNFI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 09:05:08 -0400
Received: by ggnb2 with SMTP id b2so98840ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2011 06:05:07 -0700 (PDT)
In-Reply-To: <4EAFAC42.5080607@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Sylwester,

On 1 November 2011 13:52, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hi Thomas,
>
> thanks for your work on this.
>
> On 11/01/2011 01:43 AM, Thomas Abraham wrote:
>> As gpio chips get registered, a device tree node which represents th=
e
>> gpio chip is searched and attached to it. A translate function is al=
so
>> provided to convert the gpio specifier into actual platform settings
>> for pin function selection, pull up/down and driver strength setting=
s.
>>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> Acked-by: Grant Likely<grant.likely@secretlab.ca>
>> ---
>> Changes since v1:
>> - As suggested by Rob and Grant, the gpio controller node lookup is =
based
>> =A0 =A0on the base address of the gpio controller instead of the uni=
que
>> =A0 =A0per-controller compatible property value.
>>
>> This patch is based on the following tree and branch.
>> git://git.linaro.org/git/people/arnd/arm-soc.git =A0branch: for-next
>>
>> =A0 .../devicetree/bindings/gpio/gpio-samsung.txt =A0 =A0 =A0| =A0 4=
0 ++++++++++++
>> =A0 drivers/gpio/gpio-samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 66 ++++++++++++++++++++
>> =A0 2 files changed, 106 insertions(+), 0 deletions(-)
>> =A0 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-s=
amsung.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt=
 b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> new file mode 100644
>> index 0000000..c143058
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> @@ -0,0 +1,40 @@
>> +Samsung Exynos4 GPIO Controller
>> +
>> +Required properties:
>> +- compatible: Compatible property value should be "samsung,exynos4-=
gpio>".
>> +
>> +- reg: Physical base address of the controller and length of memory=
 mapped
>> + =A0region.
>> +
>> +- #gpio-cells: Should be 4. The syntax of the gpio specifier used b=
y client nodes
>> + =A0should be the following with values derived from the SoC user m=
anual.
>> +<[phandle of the gpio controller node]
>> + =A0 =A0 =A0[pin number within the gpio controller]
>> + =A0 =A0 =A0[mux function]
>> + =A0 =A0 =A0[pull up/down]
>> + =A0 =A0 =A0[drive strength]>
>> +
>> + =A0Values for gpio specifier:
>> + =A0- Pin number: is a value between 0 to 7.
>> + =A0- Pull Up/Down: 0 - Pull Up/Down Disabled.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 - Pull Down Enabled.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03 - Pull Up Enabled.
>> + =A0- Drive Strength: 0 - 1x,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 - 3x,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02 - 2x,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03 - 4x
>
> I wonder whether it's worth to have more regular mapping, i.e.
> *) =A0 =A0 =A00 - 1x,
> =A0 =A0 =A0 =A01 - 2x,
> =A0 =A0 =A0 =A02 - 3x,
> =A0 =A0 =A0 =A03 - 4x
>
> It doesn't give as much advantage, and introduces an overhead of doin=
g
> an additional remapping. However I find current mapping of the DT spe=
cifier
> values to real driver strength slightly confusing.
> Perhaps unlikely, the future SoCs could have different meaning of the
> register values.

The dts file describes the hardware and the drive strength values
listed above are as per the Exynos4 SoC user manual. I would prefer to
do it the way you suggested, but that would mean dts is not exactly
matching the hardware manual.

[...]

>> + =A0 =A0 };
>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung=
=2Ec
>> index 8662518..0140756 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c

[...]

>> + =A0 =A0 if (gc->of_gpio_n_cells< =A04) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 WARN_ON(1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>
> nit: Could be simplified to:
>
> =A0 =A0 =A0 =A0if (WARN_ON(gc->of_gpio_n_cells < 4))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;

Ok.

>
>> +
>> + =A0 =A0 if (n> =A0gc->ngpio)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 s3c_gpio_cfgpin(pin, S3C_GPIO_SFN(be32_to_cpu(gpio[1])));
>> + =A0 =A0 s3c_gpio_setpull(pin, be32_to_cpu(gpio[2]));
>> + =A0 =A0 s5p_gpio_set_drvstr(pin, be32_to_cpu(gpio[3]));
>
> The above functions can fail and IMHO ignoring the return value here
> makes the system harder to debug.

Ok.

>
> Assuming GPIO drive strength specifier mapping *) the following code =
could
> do the remapping (not tested):
>
> =A0 =A0 =A0 =A0unsigned int tmp =3D be32_to_cpu(gpio[3]);
> =A0 =A0 =A0 =A0u32 drvstr =3D ((tmp >> 1) ^ tmp) & 1 ? ~tmp & 3 : tmp=
;
>
> =A0 =A0 =A0 =A0s5p_gpio_set_drvstr(pin, drvstr);
>
>> + =A0 =A0 return n;
>> +}
>> +
>> +static const struct of_device_id exynos4_gpio_dt_match[] __initdata=
 =3D {
>> + =A0 =A0 { .compatible =3D "samsung,exynos4-gpio", },
>> + =A0 =A0 {}
>> +};
>> +
>> +static __init void exynos4_gpiolib_attach_ofnode(struct samsung_gpi=
o_chip *chip,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 u64 base, u64 offset)
>> +{
>> + =A0 =A0 struct gpio_chip *gc =3D&chip->chip;
>> + =A0 =A0 u64 address;
>> +
>> + =A0 =A0 if (!of_have_populated_dt())
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> +
>> + =A0 =A0 address =3D (chip->base) ? (base + ((u32)chip->base& =A00x=
fff)) :
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (base + offset);
>
> Could the extra parentheses be dropped ?

Can I postpone these changes for now so that this patch gets merged in
next-samsung-dt branch. I believe these are required changes but could
be done a little later.

Thanks for your review and comments on this patch.

Regards,
Thomas.

>
> --
> Regards,
> Sylwester
>
