From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 3/6] mfd: exynos-lpass: Remove pad retention control
Date: Wed, 19 Apr 2017 13:00:08 +0200
Message-ID: <4646acab-261e-32ea-df63-6f8333f64e2d@samsung.com>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170323080348eucas1p29d1fb4eb06e4785d20341be7a374bfb3@eucas1p2.samsung.com>
 <1490256207-10061-4-git-send-email-m.szyprowski@samsung.com>
 <20170411120231.hivtn6c7to4z2gu6@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <20170411120231.hivtn6c7to4z2gu6@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Lee,

On 2017-04-11 14:02, Lee Jones wrote:
> On Thu, 23 Mar 2017, Marek Szyprowski wrote:
>
>> Pad retention should be controlled from pin control driver, so remove it
>> from Exynos LPASS driver. After this change, no more access to PMU regmap
>> is needed, so remove also the code for handling PMU regmap.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>> ---
>>   .../bindings/mfd/samsung,exynos5433-lpass.txt           |  2 --
>>   drivers/mfd/exynos-lpass.c                              | 17 -----------------
>>   include/linux/mfd/syscon/exynos5-pmu.h                  |  3 ---
>>   3 files changed, 22 deletions(-)
> Applied, thanks.

When can I expect this (and the remaining patches from this patchset) to 
appear
in your -next branch?

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

