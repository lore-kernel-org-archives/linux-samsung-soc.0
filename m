From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2 1/5] Samsung SoC ADC: use regulator (VDD for ADC).
Date: Wed, 22 Jun 2011 11:40:46 +0900
Message-ID: <BANLkTinQYV8FJsy+5_sU8sTBhYPC7AQPow@mail.gmail.com>
References: <20110620101737.GA31864@opensource.wolfsonmicro.com>
	<1308621527-2457-1-git-send-email-myungjoo.ham@samsung.com>
	<1308621527-2457-2-git-send-email-myungjoo.ham@samsung.com>
	<20110621104357.GE22177@opensource.wolfsonmicro.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110621104357.GE22177@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kyungmin Park <kyungmin.park@samsung.com>, dg77.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 21, 2011 at 7:43 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Jun 21, 2011 at 10:58:43AM +0900, MyungJoo Ham wrote:
>
>> + =C2=A0 =C2=A0 ret =3D regulator_enable(adc->vdd);
>> + =C2=A0 =C2=A0 if (!ret)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_ioremap;
>> +
>
> This test looks the wrong way round? =C2=A0regulator_enable() should =
return 0
> on success but this will treat that as an error.

Whoops.. thanks for pointing that out!

>
>> =C2=A0static int s3c_adc_resume(struct platform_device *pdev)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 struct adc_device *adc =3D platform_get_drvdata=
(pdev);
>> + =C2=A0 =C2=A0 int ret;
>>
>> + =C2=A0 =C2=A0 ret =3D regulator_enable(adc->vdd);
>> =C2=A0 =C2=A0 =C2=A0 clk_enable(adc->clk);
>> =C2=A0 =C2=A0 =C2=A0 enable_irq(adc->irq);
>>
>> =C2=A0 =C2=A0 =C2=A0 writel(adc->prescale | S3C2410_ADCCON_PRSCEN,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc->regs + S3C2410_=
ADCCON);
>>
>> - =C2=A0 =C2=A0 return 0;
>> + =C2=A0 =C2=A0 return ret;
>
> Seems better to return as soon as we notice the error, no point in
> starting anything else up if we don't have power.
>

Ok. I see.



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
