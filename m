From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/9] soc: samsung: Convert exynos-chipid driver to
 use the regmap API
Date: Thu, 8 Aug 2019 14:07:13 +0200
Message-ID: <dc34402e-6e94-09e7-414d-10f87beb3e7c@samsung.com>
References: <CGME20190718143128eucas1p2677ae16d229dddcd9a0db8084f0da5cf@eucas1p2.samsung.com>
        <20190718143044.25066-1-s.nawrocki@samsung.com>
        <20190718143044.25066-3-s.nawrocki@samsung.com>
        <CAJKOXPfLPjmjgX01UAyu_=7etUO1G7osMQDmyHVBNxF2Sdh=yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfLPjmjgX01UAyu_=7etUO1G7osMQDmyHVBNxF2Sdh=yA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 7/23/19 15:01, Krzysztof Kozlowski wrote:
> On Thu, 18 Jul 2019 at 16:31, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>>
>> Convert the driver to use regmap API in order to allow other
>> drivers, like ASV, to access the CHIPID registers.
>>
>> This patch adds definition of selected CHIPID register offsets
>> and register bit fields for Exynos5422 SoC.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>> index 78b123ee60c0..594b00488013 100644
>> --- a/drivers/soc/samsung/exynos-chipid.c
>> +++ b/drivers/soc/samsung/exynos-chipid.c
>> @@ -9,18 +9,16 @@
>>   */
>> @@ -53,29 +51,24 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
>>  int __init exynos_chipid_early_init(void)
>>  {

>> +       regmap = syscon_regmap_lookup_by_compatible("samsung,exynos4210-chipid");
>> +       if (IS_ERR(regmap)) {
>> +               pr_err("%s: failed to get regmap\n", __func__);
> 
> Other places do not use __func__ prefix so make it consistent. Add it
> in patch #1?

I would rather drop the function name prefix here, there should be 
no problem in finding those error messages with grep. I'll just make
the above log a bit more specific.

>> +               return PTR_ERR(regmap);
>>         }

>> diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
>> new file mode 100644
>> index 000000000000..25359d70d617
>> --- /dev/null
>> +++ b/include/linux/soc/samsung/exynos-chipid.h
>> @@ -0,0 +1,48 @@

>> +#define EXYNOS_CHIPID_REG_PRO_ID       0x00
>> + #define EXYNOS_SUBREV_MASK            (0xf << 4)
> 
> " #define" is unusual syntax. I think not used anywhere else. Stick to
> regular one.

Indeed it's almost not used anywhere, I will drop those leading spaces.

git grep "^\ #define" *.[ch] | wc -l

-- 
Regards,
Sylwester
