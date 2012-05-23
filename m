From: jonghwa3.lee@samsung.com
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 13:40:13 +0900
Message-ID: <4FBC6A2D.6040408@samsung.com>
References: <y@samsung.com> <4fbb2ada.63de440a.589d.78e2@mx.google.com>
 <4FBC3FF0.5080408@samsung.com>
 <CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2012=EB=85=84 05=EC=9B=94 23=EC=9D=BC 13:16, Yadwinder Singh Brar wr=
ote:

>>> +     max77686_update_reg(i2c, MAX77686_REG_BUCK2CTRL1,
>>> +             max77686->ramp_delay << 6, RAMP_MASK);
>>> +     max77686_update_reg(i2c, MAX77686_REG_BUCK3CTRL1,
>>> +             max77686->ramp_delay << 6, RAMP_MASK);
>>> +     max77686_update_reg(i2c, MAX77686_REG_BUCK4CTRL1,
>>> +             max77686->ramp_delay << 6, RAMP_MASK);
>>> +
>>
>>
>> Why do you use i2c client still? If you registered regmap you can us=
e
>> its API. I recommend you to use regmap_update_bits() directly.
>>
>>
>=20
> Yes, we are using regmap_update_bits().  max77686_update_reg() is jus=
t
> a wrapper over it.
>=20


Yes, i know what you mean. However it doesn't need max77686_update_reg(=
)
any more since it uses regmap API. Why don't you just pass iodev->regma=
p
to regmap_update_bits(). It is clear that there is no reason for using
i2c client as a medium. Please check regulator and mfd driver of my
previous patch.


Thanks.
