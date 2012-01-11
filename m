From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Wed, 11 Jan 2012 16:21:57 +0530
Message-ID: <CAJuYYwSuDzUWgnSJHO0vwjYH7zscC9=j_=JuOUuJy9shHpPUuA@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
	<4F05F509.6020405@metafoo.de>
	<20120106064929.GB3496@opensource.wolfsonmicro.com>
	<CAJuYYwRxuZAm_JpLw1fN2ypnFc6TocH6veRmCeuqENvZHSz3kg@mail.gmail.com>
	<20120107172826.GA355@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:36483 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756874Ab2AKKv6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 05:51:58 -0500
In-Reply-To: <20120107172826.GA355@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

Hi Mark,

On 7 January 2012 22:58, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
> On Sat, Jan 07, 2012 at 04:34:34PM +0530, Thomas Abraham wrote:
>> On 6 January 2012 12:19, Mark Brown <broonie@opensource.wolfsonmicro=
=2Ecom> wrote:
>>> +       if (lcd_enable) {
>>>+               if ((pd->min_uV || pd->max_uV) &&
>>>+                       regulator_set_voltage(lp->regulator,
>>>+                                               pd->min_uV, pd->max_=
uV))
>>>+                               dev_info(lp->dev,
>>>+                                       "regulator voltage set faile=
d\n");
>>>+               if (regulator_enable(lp->regulator))
>>>+                       dev_info(lp->dev, "failed to enable regulato=
r\n");
>>>+       } else {
>>>+               regulator_disable(lp->regulator);
>>>+       }
>
>> > In principle it should be specified in both places to account for =
shared
>> > supplies though for all practical purposes for an LCD panel I can'=
t see
>> > multiple users sharing the same regulator and varying the voltage =
at
>> > runtime.
>
>> It is assumed here that the boot loader as not set the output voltag=
e
>> of the regulator that supports variable voltage ranges. So these
>> values help in setting up the regulator for LCD display.
>
> Remember that the regulator API won't allow consumers to configure
> voltages unless there are constraints granting permission. =A0Users w=
ill
> need to set both the LCD vales and the regulator constraints values t=
o
> actually allow configuration to happen.

In the case of Exynos4 based Origen board, buck7 of max8997 supplies
power to the lcd panel. buck7 is capable of supplying power at
different voltage levels but for Origen board, it is required to
supply only 3.3V. The constraints for buck7 can specify 'apply_uV' and
this will ensure that buck7 is configured to supply 3.3V.

But 'apply_uV' seems to be not ideal for regulators that supply power
to lcd panels. It would be better to power lcd panels only when video
data has to be displayed.

If 'apply_uV' is not used, then regulator_enable() does not set the
correct output voltage. So regulator_set_voltage() call is required.
If the regulator does not support multiple voltage ranges, then in the
above code min_uV and max_uV should be zero which then bypasses
regulator_set_voltage().

Hence, the call to regulator_set_voltage() is required in the above
code fragment.

Thanks,
Thomas.
