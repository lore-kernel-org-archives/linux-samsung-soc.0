From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Sat, 7 Jan 2012 16:34:34 +0530
Message-ID: <CAJuYYwRxuZAm_JpLw1fN2ypnFc6TocH6veRmCeuqENvZHSz3kg@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
	<4F05F509.6020405@metafoo.de>
	<20120106064929.GB3496@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:43621 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab2AGLEf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 06:04:35 -0500
In-Reply-To: <20120106064929.GB3496@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

Hi Mark,

On 6 January 2012 12:19, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
> On Thu, Jan 05, 2012 at 08:07:53PM +0100, Lars-Peter Clausen wrote:
>
>> > +- lcd,pwrctrl-min-uV: If a regulator controls the Vcc voltage of =
the lcd panel,
>> > + =A0this property specifies the minimum voltage the regulator sho=
uld supply.
>> > + =A0The value of this property should in in micro-volts.
>> > +- lcd,pwrctrl-max-uV: If a regulator controls the Vcc voltage of =
the lcd panel,
>> > + =A0this property specifies the maximum voltage the regulator sho=
uld limit to
>> > + =A0on the Vcc line. The value of this property should in in micr=
o-volts.
>
>> The min and max voltage should rather be specified through the regul=
ator
>> constraints.
>
> In principle it should be specified in both places to account for sha=
red
> supplies though for all practical purposes for an LCD panel I can't s=
ee
> multiple users sharing the same regulator and varying the voltage at
> runtime.

It is assumed here that the boot loader as not set the output voltage
of the regulator that supports variable voltage ranges. So these
values help in setting up the regulator for LCD display.

>
>> > + =A0 if (lcd_enable) {
>> > + =A0 =A0 =A0 =A0 =A0 if ((pd->min_uV || pd->max_uV) &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_set_voltage(lp->re=
gulator,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 pd->min_uV, pd->max_uV))
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(lp-=
>dev,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 "regulator voltage set failed\n");
>> > + =A0 =A0 =A0 =A0 =A0 if (regulator_enable(lp->regulator))
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(lp->dev, "failed to=
 enable regulator\n");
>> > + =A0 } else {
>> > + =A0 =A0 =A0 =A0 =A0 regulator_disable(lp->regulator);
>> > + =A0 }
>
>> I think you have to make sure that the regulator enable and disable =
calls are
>> balanced.
>
> Yes.

Ok. I will fix this.

>
>> > +#ifdef CONFIG_OF
>
>> I think you can remove all the CONFIG_OF ifdefs, the of API should s=
tub itself out.
>
> It's reasonably idiomatic to do this if the parsing code is in a
> separate function.

Thanks for your review Mark.

Regards,
Thomas.
