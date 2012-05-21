From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: Add support for MAX77686.
Date: Mon, 21 May 2012 13:27:26 +0530
Message-ID: <CAKew6eUqqC-jSRoY1e4Q=JnLekuA_geGcCjQr4=6g86nf3LfDA@mail.gmail.com>
References: <1337261967-26004-1-git-send-email-yadi.brar@samsung.com>
	<1337261967-26004-3-git-send-email-yadi.brar@samsung.com>
	<20120520100015.GC20652@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51373 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374Ab2EUH50 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 May 2012 03:57:26 -0400
In-Reply-To: <20120520100015.GC20652@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

Hi Mark,

On Sun, May 20, 2012 at 3:30 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, May 17, 2012 at 07:09:27PM +0530, Yadwinder Singh Brar wrote:
>
> Looks mostly good. =A0A couple of fairly small things:
>
>> +static int max77686_get_voltage_sel(struct regulator_dev *rdev)
>> +{
>
> This looks like it should be regulator_get_voltage_sel_regmap().
>
>> +static int max77686_set_voltage_sel(struct regulator_dev *rdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned sel)
>> +{
>
> This looks like it should be regulator_set_voltage_sel_regmap().
>

Yes, We can use  regulator_set_voltage_sel_regmap(), I will replace it.

>> + =A0 =A0 max77686->ramp_delay =3D pdata->ramp_delay - 1;
>> + =A0 =A0 max77686_update_reg(i2c, MAX77686_REG_BUCK2CTRL1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 RAMP_VALUE, RAMP_MASK);
>> + =A0 =A0 max77686_update_reg(i2c, MAX77686_REG_BUCK3CTRL1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 RAMP_VALUE, RAMP_MASK);
>> + =A0 =A0 max77686_update_reg(i2c, MAX77686_REG_BUCK4CTRL1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 RAMP_VALUE, RAMP_MASK);
>
> This code is unclear because RAMP_VALUE looks like a constant that ha=
s
> nothing to do with ramp_delay when in fact it's actually this:
>
>> +#define RAMP_VALUE (max77686->ramp_delay << 6)
>
> which isn't constant - this is why I queried this last time. =A0Just
> remove the define and write this out directly. =A0The way the code is
> written at the minute it looks like ramp_delay is just stored and not
> referred to unless you go searching around the rest of the driver.

Ok, I will remove it.

Thanks,
Yadwinder.
