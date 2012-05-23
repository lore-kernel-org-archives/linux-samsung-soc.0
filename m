From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 10:53:27 +0530
Message-ID: <CAKew6eUew+=f-dGjJZD7Wy8Xt2f4smEhkYh=CUhx6Y_EMByFFw@mail.gmail.com>
References: <y@samsung.com>
	<4fbb2ada.63de440a.589d.78e2@mx.google.com>
	<4FBC3FF0.5080408@samsung.com>
	<CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
	<4FBC6A2D.6040408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35505 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab2EWFX2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 01:23:28 -0400
In-Reply-To: <4FBC6A2D.6040408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jonghwa3.lee@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>

On Wed, May 23, 2012 at 10:10 AM,  <jonghwa3.lee@samsung.com> wrote:
> On 2012=EB=85=84 05=EC=9B=94 23=EC=9D=BC 13:16, Yadwinder Singh Brar =
wrote:
>
>>>> + =C2=A0 =C2=A0 max77686_update_reg(i2c, MAX77686_REG_BUCK2CTRL1,
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max77686->ramp_delay <=
< 6, RAMP_MASK);
>>>> + =C2=A0 =C2=A0 max77686_update_reg(i2c, MAX77686_REG_BUCK3CTRL1,
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max77686->ramp_delay <=
< 6, RAMP_MASK);
>>>> + =C2=A0 =C2=A0 max77686_update_reg(i2c, MAX77686_REG_BUCK4CTRL1,
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max77686->ramp_delay <=
< 6, RAMP_MASK);
>>>> +
>>>
>>>
>>> Why do you use i2c client still? If you registered regmap you can u=
se
>>> its API. I recommend you to use regmap_update_bits() directly.
>>>
>>>
>>
>> Yes, we are using regmap_update_bits(). =C2=A0max77686_update_reg() =
is just
>> a wrapper over it.
>>
>
>
> Yes, i know what you mean. However it doesn't need max77686_update_re=
g()
> any more since it uses regmap API. Why don't you just pass iodev->reg=
map
> to regmap_update_bits(). It is clear that there is no reason for usin=
g
> i2c client as a medium. Please check regulator and mfd driver of my
> previous patch.
>

I agree with you we can use directly  regmap API. But I preferred
max77686_update_reg() because its a common practice to use
common read/write API which we define in mfd driver to access
that particular mfd device from other drivers.

Regards,
Yadwinder.
