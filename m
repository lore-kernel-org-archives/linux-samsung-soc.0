From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 2/2] regulator: add device tree support for max8997
Date: Tue, 13 Mar 2012 12:14:42 +0530
Message-ID: <CAJuYYwRAXyU7d7qhGUX-=qWUJ0M1KB3XCGPOnUxToP=0XOhzqg@mail.gmail.com>
References: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org>
	<1330000688-11226-3-git-send-email-thomas.abraham@linaro.org>
	<20120313034306.16CF73E07E4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:60630 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751245Ab2CMGoo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 02:44:44 -0400
Received: by wibhj6 with SMTP id hj6so4879192wib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 23:44:43 -0700 (PDT)
In-Reply-To: <20120313034306.16CF73E07E4@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rajendra Nayak <rnayak@ti.com>

On 13 March 2012 09:13, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, 23 Feb 2012 18:08:08 +0530, Thomas Abraham <thomas.abraham@li=
naro.org> wrote:
>> Add device tree based discovery support for max8997.
>>
>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Cc: Rajendra Nayak <rnayak@ti.com>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0.../devicetree/bindings/regulator/max8997-pmic.txt | =A0134 +++++=
++++++++++++++
>> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 72 ++++++++++-
>> =A0drivers/regulator/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0139 +++++++++++++++++++-
>> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A01 +
>> =A04 files changed, 344 insertions(+), 2 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/regulator/ma=
x8997-pmic.txt
>>

[...]

>> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
>> index 20ecad3..13180be 100644
>> --- a/drivers/mfd/max8997.c
>> +++ b/drivers/mfd/max8997.c
>> @@ -23,6 +23,7 @@
>>
>> =A0#include <linux/slab.h>
>> =A0#include <linux/i2c.h>
>> +#include <linux/of_irq.h>
>> =A0#include <linux/interrupt.h>
>> =A0#include <linux/pm_runtime.h>
>> =A0#include <linux/module.h>
>> @@ -123,6 +124,60 @@ int max8997_update_reg(struct i2c_client *i2c, =
u8 reg, u8 val, u8 mask)
>> =A0}
>> =A0EXPORT_SYMBOL_GPL(max8997_update_reg);
>>
>> +#ifdef CONFIG_OF
>> +/*
>> + * Only the common platform data elements for max8997 are parsed he=
re from the
>> + * device tree. Other sub-modules of max8997 such as pmic, rtc and =
others have
>> + * to parse their own platform data elements from device tree.
>> + *
>> + * The max8997 platform data structure is instantiated here and the=
 drivers for
>> + * the sub-modules need not instantiate another instance while pars=
ing their
>> + * platform data.
>> + */
>> +static int max8997_i2c_parse_dt_pdata(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct max8997_platform_data **pdata)
>> +{
>> + =A0 =A0 struct max8997_platform_data *pd;
>> +
>> + =A0 =A0 pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>> + =A0 =A0 if (!pd) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "could not allocate memory fo=
r pdata\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 pd->ono =3D irq_of_parse_and_map(dev->of_node, 1);
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* ToDo: the 'wakeup' member in the platform data is mor=
e of a linux
>> + =A0 =A0 =A0* specfic information. Hence, there is no binding for t=
hat yet and
>> + =A0 =A0 =A0* not parsed here.
>> + =A0 =A0 =A0*/
>> +
>> + =A0 =A0 *pdata =3D pd;
>> + =A0 =A0 return 0;
>> +}
>> +#else
>> +static int max8997_i2c_parse_dt_pdata(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct max8997_platform_data **pdata)
>> +{
>> + =A0 =A0 return 0;
>> +}
>> +#endif
>> +
>> +static struct of_device_id __devinitdata max8997_pmic_dt_match[];
>
> Move the actual definition of this structure up to here so that a for=
ward
> declaration becomes unnecessary.
>

Ok.

>> +static inline int max8997_i2c_get_driver_data(struct i2c_client *i2=
c,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 const struct i2c_device_id *id)
>> +{
>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (i2c->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;
>> + =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(max8997_pmic_dt_ma=
tch, i2c->dev.of_node);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return (int)match->data;
>> + =A0 =A0 }
>> +#endif
>> + =A0 =A0 return (int)id->driver_data;
>> +}
>> +
>> =A0static int max8997_i2c_probe(struct i2c_client *i2c,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct i2c=
_device_id *id)
>> =A0{
>> @@ -137,9 +192,16 @@ static int max8997_i2c_probe(struct i2c_client =
*i2c,
>> =A0 =A0 =A0 i2c_set_clientdata(i2c, max8997);
>> =A0 =A0 =A0 max8997->dev =3D &i2c->dev;
>> =A0 =A0 =A0 max8997->i2c =3D i2c;
>> - =A0 =A0 max8997->type =3D id->driver_data;
>> + =A0 =A0 max8997->type =3D max8997_i2c_get_driver_data(i2c, id);
>> =A0 =A0 =A0 max8997->irq =3D i2c->irq;
>>
>> + =A0 =A0 if (max8997->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D max8997_i2c_parse_dt_pdata(max8997=
->dev, &pdata);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c->dev.platform_data =3D pdata;
>
> This line is illegal. =A0Drivers must *not* change the value of dev->=
platform_data.
> instead the valid pdata pointer needs to be stored in the max8997 pri=
vate data
> structure.

The intention here was to let the max8897 driver's mfd portion create
an 'common' instance of max8897 platform data and allow the max8997
sub-drivers such as the pmic driver and charger driver use that
'common' instance to populate their respective platform data portions
from dt. But, assigning that allocated pdata pointer to
i2c->dev.platform_data was not correct, I agree.

Instead, a new pointer to 'struct max8997_platform_data' will be added
to 'struct max8997_dev', assign the pdata in the mfd driver to this
new member and let the sub-drivers use the pdata pointer in 'struct
max8997_dev'. I will do this change and repost this patch.

>
>> + =A0 =A0 }
>> +
>
> If you tweak the definition of max8997_i2c_parse_dt_pdata() then this=
 block can
> be simplified to:
>
> =A0 =A0 =A0 =A0pdata =3D max8997_i2c_parse_dt_pdata(max8997->dev, &pd=
ata);
> =A0 =A0 =A0 =A0if (!pdata)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdata =3D i2c->dev.platform_data,
> =A0 =A0 =A0 =A0if (!pdata)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
>
> Otherwise, the patch looks pretty good. =A0(although seeing the decod=
e function
> has got me thinking that we need a much better way of decoding the dt=
 data).

The parsing function looks huge since there is lot of data to pick up
from the dt node.

Thanks for your comments.

Regards,
Thomas.

[...]

>
> g.
