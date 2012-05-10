From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 1/2] mfd: Add support for MAX77686.
Date: Thu, 10 May 2012 13:00:19 +0530
Message-ID: <CAKew6eU2DW-GrVyfhi73SfQrYKAdLRi_bUgMWfhr6V_Tbo5dkQ@mail.gmail.com>
References: <1336580695-1184-1-git-send-email-yadi.brar@samsung.com>
	<1336580695-1184-2-git-send-email-yadi.brar@samsung.com>
	<20120509182757.GB32037@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42978 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752966Ab2EJHag convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 03:30:36 -0400
In-Reply-To: <20120509182757.GB32037@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Yadwinder Singh <yadi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

On Wed, May 9, 2012 at 11:57 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, May 09, 2012 at 09:54:54PM +0530, Yadwinder Singh wrote:
>
>> +int max77686_read_reg(struct i2c_client *i2c, u8 reg, u8 *dest)
>> +{
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 ret =3D i2c_smbus_read_byte_data(i2c, reg);
>> + =A0 =A0 if (ret < 0)
>
> It would really be better if this used the regmap API - the regulator
> API is starting to build out functionality on top of regmap which thi=
s
> won't be able to take advantage of if it doesn't use regmap.
>

I agree, I will implement it.

>> + =A0 =A0 if (of_get_property(dev->of_node, "max77686,wakeup", NULL)=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->wakeup =3D true;
>
> You haven't included any binding documentatiojn for the device tree
> bindings - you should do this.
>

Ok. I will add documentation in next version of patch.

>> + =A0 =A0 max77686 =3D kzalloc(sizeof(struct max77686_dev), GFP_KERN=
EL);
>> + =A0 =A0 if (max77686 =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max77686->dev, "could not allocate=
 memory\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 }
>
> devm_kzalloc().
>

yes, its better option.

>> + =A0 =A0 device_init_wakeup(max77686->dev, max77686->wakeup);
>
> Why is this not just done unconditionally? =A0There's sysfs files to =
allow
> userspace control.
>

yes, i agree with you. i will do it.

>> + =A0 =A0 if (max77686_read_reg(i2c, MAX77686_REG_DEVICE_ID, &data) =
< 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 dbg_info("%s : device not found on this ch=
annel\n", __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_mfd;
>> + =A0 =A0 } else
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_info(max77686->dev, "device found\n");
>
> You should verify that the device ID you read back is the expected on=
e.
>

Ok, I will do that also.

>> + =A0 =A0 dev_err(max77686->dev, "device probe failed : %d\n", ret);
>
> Driver core should do this for you.
>

Yes, I will remove this message.

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Thanks,
Yadwinder.
