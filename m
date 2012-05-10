From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 2/2] regulator: Add support for MAX77686.
Date: Thu, 10 May 2012 13:01:30 +0530
Message-ID: <CAKew6eUQ7P8SNK+0AGdJP1w51i8krGcPiMjCF4vHaWd93wR8ng@mail.gmail.com>
References: <1336580695-1184-1-git-send-email-yadi.brar@samsung.com>
	<1336580695-1184-3-git-send-email-yadi.brar@samsung.com>
	<4FAACB66.3020706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43649 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756693Ab2EJHbb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 03:31:31 -0400
In-Reply-To: <4FAACB66.3020706@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: Yadwinder Singh <yadi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi  Sylwester,

On Thu, May 10, 2012 at 1:24 AM, Sylwester Nawrocki <snjw23@gmail.com> =
wrote:
> Hi,
>
> just a few nitpicks...
>
>
> On 05/09/2012 06:24 PM, Yadwinder Singh wrote:
>>
>> From: Yadwinder Singh Brar<yadi.brar@samsung.com>
>>
>> Add support for PMIC/regulator portion of MAX77686 multifunction dev=
ice.
>> MAX77686 provides LDOs[1-26] and BUCKs[1-9]. This is initial release=
 of
>> driver
>> which supports setting and getting the voltage of a regulator with I=
2C
>> interface.
>>
>> Signed-off-by: Yadwinder Singh Brar<yadi.brar@samsung.com>
>
> ...
>
>> diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max776=
86.c
>> new file mode 100644
>> index 0000000..4aa9722
>> --- /dev/null
>> +++ b/drivers/regulator/max77686.c
>> @@ -0,0 +1,660 @@
>> +/*
>> + * max77686.c - Regulator driver for the Maxim 77686
>> + *
>> + * Copyright (C) 2012 Samsung Electronics
>
>
> I believe this should read:
>
> =A0+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
>
> In patch 1/2 the copyright notice is also not exactly correct.
>
>
>> + * Chiwoong Byun<woong.byun@smasung.com>
>
>
> s/smasung/samsung
>
> ...
>

Thanks for pointing. I will rectify above mistakes.

>> +static int max77686_get_enable_register(struct regulator_dev *rdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 int *reg, int *mask, int *pattern)
>> +{
>> + =A0 =A0 =A0 int rid =3D rdev_get_id(rdev);
>> +
>> + =A0 =A0 =A0 switch (rid) {
>> + =A0 =A0 =A0 case MAX77686_LDO1...MAX77686_LDO26:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *reg =3D MAX77686_REG_LDO1CTRL1 + (rid=
 - MAX77686_LDO1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *mask =3D 0xC0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *pattern =3D 0xC0;
>
>
> What about using lower case for all hex numbers ?
>
> ...
>

Yes, i will take care of this.

>> +static int max77686_get_voltage_register(struct regulator_dev *rdev=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0int *_reg, int *_shift, int
>> *_mask)
>> +{
>
> ...
>
>> + =A0 =A0 =A0 case MAX77686_BUCK2:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D MAX77686_REG_BUCK2DVS1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 0xff;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case MAX77686_BUCK3:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D MAX77686_REG_BUCK3DVS1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 0xff;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case MAX77686_BUCK4:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D MAX77686_REG_BUCK4DVS1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 0xff;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case MAX77686_BUCK5...MAX77686_BUCK9:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D MAX77686_REG_BUCK5OUT + (rid -=
 MAX77686_BUCK5) * 2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 *_reg =3D reg;
>> + =A0 =A0 =A0 *_shift =3D shift;
>> + =A0 =A0 =A0 *_mask =3D mask;
>> +
>> + =A0 =A0 =A0 return 0;
>> +}
>
>
> Thanks,
> Sylwester
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Thanks,
Yadwinder.
