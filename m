From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 RESEND] clk: samsung: exynos4: Enable VPLL and EPLL
 clocks for suspend/resume cycle
Date: Wed, 04 Oct 2017 08:08:57 +0200
Message-ID: <2073050f-70c3-f007-64e4-275ddabdc473@samsung.com>
References: <CGME20170919100345eucas1p1391a495dab09faecdc2acf9635e4c42d@eucas1p1.samsung.com>
        <1505815279-19097-1-git-send-email-m.szyprowski@samsung.com>
        <bb559caa-4b3a-6bff-e8e6-2921f372d272@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <bb559caa-4b3a-6bff-e8e6-2921f372d272@samsung.com>
Content-language: en-US
Sender: stable-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On 2017-09-19 12:28, Sylwester Nawrocki wrote:
> On 09/19/2017 12:01 PM, Marek Szyprowski wrote:
>> Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
>> PLL36XX clocks") added enable/disable operations to PLL clocks. Prior 
>> that
>> VPLL and EPPL clocks were always enabled because the enable bit was 
>> never
>> touched. Those clocks have to be enabled during suspend/resume cycle,
>> because otherwise board fails to enter sleep mode. This patch enables 
>> them
>> unconditionally before entering system suspend state. System restore
>> function will set them to the previous state saved in the register cache
>> done before that unconditional enable.
>>
>> Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for 
>> PLL36XX clocks")
>> CC: stable@vger.kernel.org # v4.13
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Stephen, Mike, could you please apply this patch directly?

Gentle ping.

Any chance to have this patch merged as a fix to v4.14-rcX?

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
