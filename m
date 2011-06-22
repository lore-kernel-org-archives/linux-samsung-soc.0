From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2 4/4] Exynos4 NURI: support for NTC thermistor
Date: Wed, 22 Jun 2011 14:00:37 +0900
Message-ID: <BANLkTi=eBAGCADe1MTdtQ4XnBVpHK+uUNA@mail.gmail.com>
References: <20110620103124.GD31864@opensource.wolfsonmicro.com>
	<1308622033-2521-1-git-send-email-myungjoo.ham@samsung.com>
	<1308622033-2521-5-git-send-email-myungjoo.ham@samsung.com>
	<20110621105033.GF22177@opensource.wolfsonmicro.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40435 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024Ab1FVFAj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 01:00:39 -0400
In-Reply-To: <20110621105033.GF22177@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, dg77.kim@samsung.com

On Tue, Jun 21, 2011 at 7:50 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Jun 21, 2011 at 11:07:13AM +0900, MyungJoo Ham wrote:
>
>> +#include <linux/platform_data/ntc_thermistor.h>
>
> This doesn't appear to be in mainline.

Right, not just yet. I should've added comment about the patch just
being applied to "next".

I've added it as it was told to be applied to "next" in lm-sensors by
Guenter Roeck yesterday.
http://comments.gmane.org/gmane.linux.drivers.sensors/26475

Should I surround them with "#ifdef CONFIG_NTC_THERMISTOR"?

>
>> +/* NTC Thermistor */
>> +static struct platform_device nuri_ncp15wb473_thermistor;
>> +static int read_thermistor_uV(void)
>
> Blank line between these two.
>

got it.

>> +{
>> + =C2=A0 =C2=A0 static struct s3c_adc_client *adc;
>> + =C2=A0 =C2=A0 int val;
>> + =C2=A0 =C2=A0 s64 converted;
>> +
>> + =C2=A0 =C2=A0 if (!adc) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc =3D s3c_adc_register=
(&nuri_ncp15wb473_thermistor,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, 0);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR_OR_NULL(adc))=
 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_err("%s: Cannot get adc.\n", __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return adc ? PTR_ERR(adc) : -ENODEV;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
>
> Why not do this in an initcall or in the device registration? =C2=A0T=
his
> looks like working around a limitation of the ntc_thermistor driver
> which should be fixed as part of a mainline merge for that.

Um... I think I can put this away to a common plat-samsung/dev-ntc.c
as I've seen many S5PC110/S5PV210/Exynos4 devices using NTC attached
to the CPU's ADC ports.

However, I won't be able to put that part into the NTC driver because
using S3C-ADC is plat-samsung specific method and NTC thermistor
itself is a general thermistor device not specific to S3C. Maybe, I
can do so after we've got a common ADC framework.

>
>> +
>> + =C2=A0 =C2=A0 if (IS_ERR_OR_NULL(adc))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return adc ? PTR_ERR(adc=
) : -ENODEV;
>> +
>> + =C2=A0 =C2=A0 val =3D s3c_adc_read(adc, 6);
>> +
>> + =C2=A0 =C2=A0 converted =3D 3300000LL * (s64) val;
>> + =C2=A0 =C2=A0 converted >>=3D 12;
>> +
>> + =C2=A0 =C2=A0 pr_emerg("%s: %d -> %llduV\n", __func__, val, conver=
ted);
>
> This looks like debug that was left in by mistake.
>

Oh.. yes.. thanks. I need to remove that.


--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
