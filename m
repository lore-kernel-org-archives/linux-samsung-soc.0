From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH v3 1/6] Samsung SoC ADC: use regulator (VDD for ADC).
Date: Thu, 30 Jun 2011 18:03:06 +0900
Message-ID: <BANLkTimwqF3APEbJnTGcO5mh+AnS=N787g@mail.gmail.com>
References: <1309420175-10301-1-git-send-email-myungjoo.ham@samsung.com>
	<1309420175-10301-2-git-send-email-myungjoo.ham@samsung.com>
	<201106301122.50800.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:47720 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754648Ab1F3JDI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 05:03:08 -0400
In-Reply-To: <201106301122.50800.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Jassi Brar <jassi.brar@samsung.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Seungwhan Youn <sw.youn@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Jun 30, 2011 at 5:22 PM, Vasily Khoruzhick <anarsoul@gmail.com>=
 wrote:
> On Thursday 30 June 2011 10:49:30 MyungJoo Ham wrote:
>> This patch allows the Samsung ADC driver to enable VDD regulator at
>> probe and resume and to disable at exit and suspend.
>> In a platform where ADC's VDD regulator is not "always-on", this con=
trol
>> is required although this patch does not provide fine-grained power
>> control (turning on the regulator only when being accessed).
>>
>> However, if VDD regulator ("vdd" for the adc device) is not provided=
,
>> the regulator control will not be activated because there are platfo=
rms
>> that do not provide regulator for ADC device.
>>
>> arch_initcall has been modified to module_init in order to allow
>> regulators to be available at probe.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[]
>> + =A0 =A0 adc->vdd =3D regulator_get(dev, "vdd");
>> + =A0 =A0 if (IS_ERR(adc->vdd)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "operating without regulator =
\"vdd\" .\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(adc->vdd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_alloc;
>> + =A0 =A0 }
>> +
>
> NACK. Make it optional, otherwise it breaks s3c24xx.
>

Ok. Now, I've got the issue I've worried in the previous patch revision=
=2E

Anyway, Mark once stated:
--- quote starts ---
On Sun, Jun 19, 2011 at 12:06 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
>> +     if (IS_ERR_OR_NULL(adc->vdd)) {
>> +             dev_dbg(dev, "operating without regulator %s.\n", S3C_=
ADC_REGULATOR_NAME);
>> +             adc->vdd =3D NULL; /* Do not control regulator */
>> +     }
>> +
>
> No, don't do this.  Just unconditionally assume the regulator is pres=
ent
> if power is essential for use of the device.  The regulator API will
> stub out correctly if it's not in use to allow things to proceed and =
if
> vdd is genuinely not hooked up then the driver can't function.
--- quote ends ---

Then, how about unconditionally using ADC VDD for TYPE_ADCV3
(S5PC110/S5PV210/Exynos4210) and forget VDD for older ADC types?


Thanks.

- MyungJoo
--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
