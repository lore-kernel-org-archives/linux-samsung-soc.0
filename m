From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: s5pv210: add missing call to samsung_clk_of_add_provider()
Date: Sat, 8 Aug 2015 17:18:02 +0900
Message-ID: <CAJKOXPcMWy=7ppdhZuuowW40EV9fQ_uZOc590oD53Lpu8bczbA@mail.gmail.com>
References: <1411117216-11456-1-git-send-email-m.szyprowski@samsung.com>
	<55C4BC63.6090203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55C4BC63.6090203@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-08-07 23:10 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Hello,
>
> On 2014-09-19 11:00, Marek Szyprowski wrote:
>>
>> Commit d5e136a21b2028fb1f45143ea7112d5869bfc6c7 ("clk: samsung: Register
>> clk provider only after registering its all clocks", merged to v3.17-rc1)
>> modified a way that driver registers registers to core framework. This
>> change has not been applied to s5pv210 clocks driver, which has been
>> merged in parallel to that commit. This patch adds a missing call to
>> samsung_clk_of_add_provider(), so the driver is operational again.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Hello!
>>
>> This is an important fix to v3.17-rcX. Without it support for Samsung
>> S5PV210 SoCs is not functional.
>>
>> Mike, could you take it to the fixes branch?
>
>
> Mike: could you handle this patch? It looks it got missed for a few
> releases...

So maybe now it is worth backporting to stable?

Best regards,
Krzysztof
