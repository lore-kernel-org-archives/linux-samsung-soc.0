From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: Re: [PATCH 1/4] pinctrl: Add s5pv210 support to pinctrl-exynos
Date: Tue, 27 Aug 2013 14:21:25 +0200
Message-ID: <521C99C5.3080401@partner.samsung.com>
References: <1377595171-31116-1-git-send-email-m.krawczuk@partner.samsung.com>
 <521C71A1.4070609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16249 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069Ab3H0MV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 08:21:29 -0400
In-reply-to: <521C71A1.4070609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linus.walleij@linaro.org, t.figa@samsung.com, thomas.abraham@linaro.org, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 08/27/2013 11:30 AM, Sylwester Nawrocki wrote:
> Hi,
>
> Just a few nits...
>
> On 08/27/2013 11:19 AM, Mateusz Krawczuk wrote:
>> This patch implements pinctrl for s5pv210 and adds required device t=
ree bindings.
> Would be good to wrap this to not exceed 80 columns.
>
>> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
>> ---
> [...]
>> diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinc=
trl-exynos.c
>> index a74b3cb..fc3e1d7 100644
>> --- a/drivers/pinctrl/pinctrl-exynos.c
>> +++ b/drivers/pinctrl/pinctrl-exynos.c
>> @@ -660,6 +660,64 @@ static void exynos_pinctrl_resume(struct samsun=
g_pinctrl_drv_data *drvdata)
>>   			exynos_pinctrl_resume_bank(drvdata, bank);
>>   }
>>  =20
>> +/* pin banks of s5pv210 pin-controller */
>> +static struct samsung_pin_bank s5pv210_pin_banks0[] =3D {
> Couldn't it be 'static const' ?
Using static const cause warning: initialization discards =91const=92=20
qualifier from pointer target type
>
>> +	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
>> +	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
>> +	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpb", 0x08),
>> +	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpc0", 0x0c),
>> +	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpc1", 0x10),
>> +	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
>> +	EXYNOS_PIN_BANK_EINTG(4, 0x0C0, "gpd1", 0x18),
>> +	EXYNOS_PIN_BANK_EINTG(5, 0x0E0, "gpe0", 0x1c),
> How about consistently using lower case for the hex numbers ?
Thanks, I will use lower case.
>
> --
> Thanks,
> Sylwester
>
Best regards,
Mateusz
