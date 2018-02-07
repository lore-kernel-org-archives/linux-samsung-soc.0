From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 4/8] ASoC: samsung: i2s: Define the parameters list for
 SAMSUNG_I2S_OPCLK
Date: Wed, 07 Feb 2018 17:23:54 +0100
Message-ID: <7f86ec02-2235-7622-9298-f6edd367edb2@samsung.com>
References: <CGME20180205154520epcas1p4132421a187a4d767a2f75badfef5eec4@epcas1p4.samsung.com>
        <20180205154403.13520-1-s.nawrocki@samsung.com>
        <20180205154403.13520-5-s.nawrocki@samsung.com>
        <CAJKOXPf-6wFDSPttdDbc34Y2hiuc=TG2j5bb+2uQeScxGuxjZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPf-6wFDSPttdDbc34Y2hiuc=TG2j5bb+2uQeScxGuxjZg@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/06/2018 01:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 5, 2018 at 4:43 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:

>> diff --git a/sound/soc/samsung/i2s.h b/sound/soc/samsung/i2s.h
>> index 79781de2f247..a9832a9555cb 100644
>> --- a/sound/soc/samsung/i2s.h
>> +++ b/sound/soc/samsung/i2s.h
>> @@ -16,11 +16,16 @@
>>  #define SAMSUNG_I2S_DAI        "samsung-i2s"
>>  #define SAMSUNG_I2S_DAI_SEC    "samsung-i2s-sec"
>>
>> -#define SAMSUNG_I2S_DIV_BCLK   1
>> +#define SAMSUNG_I2S_DIV_BCLK           1
>>
>> -#define SAMSUNG_I2S_RCLKSRC_0  0
>> -#define SAMSUNG_I2S_RCLKSRC_1  1
>> +#define SAMSUNG_I2S_RCLKSRC_0          0
>> +#define SAMSUNG_I2S_RCLKSRC_1          1
>>  #define SAMSUNG_I2S_CDCLK              2
>> +/* Operation clock for IIS logic */
>>  #define SAMSUNG_I2S_OPCLK              3
>> +#define  SAMSUNG_I2S_OPCLK_CDCLK_OUT   0       /* CODEC clock out */
>> +#define  SAMSUNG_I2S_OPCLK_CDCLK_IN    1       /* CODEC clock in */
>> +#define  SAMSUNG_I2S_OPCLK_BCLK_OUT    2       /* Bit clock out */
>> +#define  SAMSUNG_I2S_OPCLK_PCLK                3       /* Audio bus clock */
>>
>>  #endif /* __SND_SOC_SAMSUNG_I2S_H */
> 
> This part of patch seems to be unrelated (and it includes some cleanups).

This is actually the main part of the patch, an API exported to other
drivers.  The whitespace changes are for keeping the alignment uniform,
I could just drop them.

-- 
Regards,
Sylwester
