From: Youngmin Nam <ym0914@gmail.com>
Subject: Re: [PATCH v2] pinctrl: samsung: Fixes
 samsung_gpio_direction_in/output releated with spinlock
Date: Mon, 8 Feb 2016 13:02:57 +0900
Message-ID: <56B81371.4030007@gmail.com>
References: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
 <CACRpkdaTesQL+ginJdjg0LYD=re7-ot=VLnX_=th-0gSqcQx0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:32943 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752900AbcBHEDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Feb 2016 23:03:04 -0500
Received: by mail-pa0-f68.google.com with SMTP id y7so386632paa.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Feb 2016 20:03:03 -0800 (PST)
In-Reply-To: <CACRpkdaTesQL+ginJdjg0LYD=re7-ot=VLnX_=th-0gSqcQx0Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Thanks Linus and Tomasz.

Sorry for late. I will rebase on v4.5-rc3 and resend.

Thanks.

On 2016=EB=85=84 01=EC=9B=94 27=EC=9D=BC 21:36, Linus Walleij wrote:
> On Sun, Jan 24, 2016 at 7:02 AM, Youngmin Nam <ym0914@gmail.com> wrot=
e:
>=20
>> Previously, samsung_gpio_drection_in/output function were not covere=
d with
>> one spinlock.
>>
>> For example, samsung_gpio_direction_output function consists of two =
functions.
>> 1. samsung_gpio_set
>> 2. samsung_gpio_set_direction
>>
>> When 2 CPUs try to control the same gpio pin heavily,
>> (situation like i2c control with gpio emulation)
>> This situation can cause below problem.
>>
>> CPU 0                                   | CPU1
>>                                         |
>> samsung_gpio_direction_output           |
>>    samsung_gpio_set(pin A as 1)         | samsung_gpio_direction_out=
put
>>                                         |    samsung_gpio_set(pin A =
as 0)
>>    samsung_gpio_set_direction           |
>>                                         |    samsung_gpio_set_direct=
ion
>>
>> The initial value of pin A will be set as 0 while we wanted to set p=
in A as 1.
>>
>> This patch modifies samsung_gpio_direction_in/output function
>> to be done in one spinlock to fix race condition.
>>
>> Additionally, the new samsung_gpio_set_value was added to implement
>> gpio set callback(samsung_gpio_set) with spinlock using this functio=
n.
>>
>> Signed-off-by: Youngmin Nam <ym0914@gmail.com>
>=20
> This patch does not apply to v4.5-rc1. Please rebase this
> and resend. (With Thomas ACK if it's valid.)
>=20
> Yours,
> Linus Walleij
>=20
