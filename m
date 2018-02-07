From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/8] ASoC: samsung: i2s: Ensure names of supplied clocks
 are unique
Date: Wed, 07 Feb 2018 16:20:56 +0100
Message-ID: <db8df557-fa55-9eac-d9cf-f3dc111c93c0@samsung.com>
References: <CGME20180205154511epcas1p14dccb00b68fdb688f2c427c56e01c052@epcas1p1.samsung.com>
        <20180205154403.13520-1-s.nawrocki@samsung.com>
        <20180205154403.13520-3-s.nawrocki@samsung.com>
        <CAJKOXPeUPyX89u1csm98huKLEGX_xjaPr_wuqwuyoQWwurQbUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPeUPyX89u1csm98huKLEGX_xjaPr_wuqwuyoQWwurQbUg@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/06/2018 01:20 PM, Krzysztof Kozlowski wrote:
>> @@ -1214,30 +1216,35 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
>>                 clk_put(rclksrc);
>>         }
>>
>> +       for (i = 0; i < ARRAY_SIZE(i2s_clk_desc); i++)
>> +               i2s_clk_name[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
>> +                                               dev_name(dev), i2s_clk_desc[i]);
>
> kasprintf() might return NULL and later it is being used as clock
> name. I think you should handle such error.

Right, I will fix that in next version, thanks for your review.

-- 
Regards,
Sylwester
