From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Tue, 18 Jun 2013 00:43:41 +0900
Message-ID: <51BF2EAD.9030504@samsung.com>
References: <201306140044.15568.heiko@sntech.de> <201306140045.27744.heiko@sntech.de> <1825186.C6XXUYx8Nl@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:59745 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777Ab3FQPns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 11:43:48 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so3016837pad.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 08:43:47 -0700 (PDT)
In-Reply-To: <1825186.C6XXUYx8Nl@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

On 06/17/13 22:19, Tomasz Figa wrote:
> Hi Heiko,
>
> On Friday 14 of June 2013 00:45:27 Heiko St=FCbner wrote:
>> When a pinctrl driver is loaded legacy gpio support has to be disabl=
ed.
>> The code checking for the pinctrl presence is contained in an #ifdef
>> checking for the presence of a valid samsung pinctrl driver.
>>
>> There the new PINCTRL_S3C24XX was missing resulting in the check nev=
er
>> being run and the gpio being enabled breaking the pinctrl driver.
>>
>> Fix this by adding the missing CONFIG_PINCTRL_S3C24XX
>>
>> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
>> ---
>>   drivers/gpio/gpio-samsung.c |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung=
=2Ec
>> index a1392f4..c84503e 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c
>> @@ -2949,7 +2949,8 @@ static __init int samsung_gpiolib_init(void)
>>   	int i, nr_chips;
>>   	int group =3D 0;
>>
>> -#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS=
5440)
>> +#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS=
5440) ||
>> \ +    defined(CONFIG_PINCTRL_S3C24XX)
>
> I wonder if this wouldn't be simply covered by PINCTRL_SAMSUNG (excep=
t
> PINCTRL_EXYNOS5440 which doesn't use the common part).
>
Well, not added compatible for 's3c64xx-pinctrl' yet?

- Kukjin
