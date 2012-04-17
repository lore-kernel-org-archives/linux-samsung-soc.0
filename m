From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 2/2] regulator: add device tree support for max8997
Date: Wed, 18 Apr 2012 00:05:59 +0530
Message-ID: <CAJuYYwRsHynt6pBHUgk72Z-UjHj3DM=s4pV4dzbb2hTAZOUSAw@mail.gmail.com>
References: <1332582590-16382-1-git-send-email-thomas.abraham@linaro.org>
	<1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
	<4F734460.4060605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:40113 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674Ab2DQSgA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 14:36:00 -0400
Received: by vbbff1 with SMTP id ff1so4391842vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 11:35:59 -0700 (PDT)
In-Reply-To: <4F734460.4060605@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Rajendra Nayak <rnayak@ti.com>

On 28 March 2012 22:33, Karol Lewandowski <k.lewandowsk@samsung.com> wr=
ote:
> On 24.03.2012 10:49, Thomas Abraham wrote:
>
> Hi Thomas!
>
>> Add device tree based discovery support for max8997.
> ...
>> +Regulators: The regulators of max8997 that have to be instantiated =
should be
>> +included in a sub-node named 'regulators'. Regulator nodes included=
 in this
>> +sub-node should be of the format as below. Note: The 'n' in LDOn an=
d BUCKn
>> +represents the LDO or BUCK number as per the datasheet of max8997.
>> +
>> + =A0 =A0For LDO's:
>> + =A0 =A0 =A0 =A0 =A0 =A0 LDOn {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 standard regulator binding=
s here
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0For BUCK's:
>> + =A0 =A0 =A0 =A0 =A0 =A0 BUCKn {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 standard regulator binding=
s here
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>
>
> Small note - driver supports[1] configuring following regulators by
> using respective DT node names:
>
> =A0- EN32KHz_AP
> =A0- EN32KHz_CP
> =A0- ENVICHG
> =A0- ESAFEOUT1
> =A0- ESAFEOUT2
> =A0- CHARGER
> =A0- CHARGER_CV
> =A0- CHARGER_TOPOFF
>
> I wonder if these should be mentioned in documentation too.
>
> [1] These are used in e.g. mach-nuri.c

Yes, I missed the above regulators in the documentation. I have
included them now and will resubmit this patch.

>
>> diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997=
=2Ec> index 9657929..dce8aaf 100644
>
>> --- a/drivers/regulator/max8997.c
>> +++ b/drivers/regulator/max8997.c
> ..
>> +static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct max8997_platform_data *pdata)
>> +{
>> + =A0 =A0 struct device_node *pmic_np, *regulators_np, *reg_np;
>> + =A0 =A0 struct max8997_regulator_data *rdata;
>> + =A0 =A0 unsigned int i, dvs_voltage_nr =3D 1, ret;
>> +
>> + =A0 =A0 pmic_np =3D iodev->dev->of_node;
>> + =A0 =A0 if (!pmic_np) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not find pmic s=
ub-node\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 regulators_np =3D of_find_node_by_name(pmic_np, "regulator=
s");
>> + =A0 =A0 if (!regulators_np) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not find regula=
tors sub-node\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* count the number of regulators to be supported in pmic =
*/
>> + =A0 =A0 pdata->num_regulators =3D 0;
>> + =A0 =A0 for_each_child_of_node(regulators_np, reg_np)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdata->num_regulators++;
>> +
>> + =A0 =A0 rdata =3D devm_kzalloc(iodev->dev, sizeof(*rdata) *
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->num=
_regulators, GFP_KERNEL);
>> + =A0 =A0 if (!rdata) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(iodev->dev, "could not allocate me=
mory for "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 "regulator data\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 }
>
>> + =A0 =A0 pdata->regulators =3D rdata;
>
>> + =A0 =A0 for_each_child_of_node(regulators_np, reg_np) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(regulators); =
i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!of_node_cmp(reg_np->n=
ame, regulators[i].name))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 rdata->id =3D i;
>
>
> rdata->id will be equal to ARRAY_SIZE(regulators) when one adds DT no=
de
> name (below "regulators") which is different from what can be found i=
n
> regulators[] table.
>
> On my test machine this results in hard lockup - possibly because
> something tries to access regulators[ARRAY_SIZE(regulators)]
> later on.
>
> Following patch fixes this on my machine (using DTS with misspelled L=
DO1 for LDx1):
>
> diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.=
c
> index dce8aaf..c20fd72 100644
> --- a/drivers/regulator/max8997.c
> +++ b/drivers/regulator/max8997.c
> @@ -1011,6 +1011,13 @@ static int max8997_pmic_dt_parse_pdata(struct =
max8997_dev *iodev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < ARRAY_SIZE(regulator=
s); i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!of_node_cmp(reg_n=
p->name, regulators[i].name))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i =3D=3D ARRAY_SIZE(regulators)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(iodev->dev, "d=
on't know how to configure regulator %s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg_=
np->name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rdata->id =3D i;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rdata->initdata =3D of_get_regulator_i=
nit_data(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0iodev->dev, reg_np);
>

Thanks for this fix. I have merged this change into this patch.

Regards,
Thomas.

>
> Regards,
> --
> Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
