From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5250: Add DISP1 clocks
Date: Sat, 17 Oct 2015 19:08:28 +0900
Message-ID: <CAJKOXPdvGUbkPB4E5uufQ=a63k7FK7puJjgY7xWnyqjGVhrnGQ@mail.gmail.com>
References: <1444905084-22540-1-git-send-email-tomeu.vizoso@collabora.com>
	<1444905084-22540-2-git-send-email-tomeu.vizoso@collabora.com>
	<56203AD3.2050905@samsung.com>
	<20151016124935.20687.4394@quantum>
	<20151016172651.GB23912@codeaurora.org>
	<CAAObsKAjZX8XxTAFVKq4BCSZSrKG5xQPTue+z+xnJDD8QwK88Q@mail.gmail.com>
	<56218B2D.9040007@kernel.org>
	<CAJKOXPf5Dnh36rrY6Vet13EHKB3gJuU0VnAfsyYnvWTx92O_GA@mail.gmail.com>
	<56221B26.2050407@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56221B26.2050407@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.i
List-Id: linux-samsung-soc@vger.kernel.org

2015-10-17 18:55 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
> Hello Krzysztof,
>
> On 10/17/2015 10:53 AM, Krzysztof Kozlowski wrote:
>> 2015-10-17 8:41 GMT+09:00 Kukjin Kim <kgene@kernel.org>:
>
> [snip]
>
>>>>
>>> So...how can I take 2nd patch of this series in samsung(arm-soc) tree?
>>> And this series shouldn't be for fixes for 4.3?...Mike how do you think?
>>
>> Stephen acked it so I thought everything will go through samsung-soc.
>>
>> Dear Kukjin,
>> Indeed this can go as fix for current cycle... but in the same time
>> this does not fix any specific regression. Tomeu did not describe when
>> issue happened for the first time so I assumed it was like that
>> always. It's up to you.
>>
>
> Sorry for not answering about this series before but I've been in contact
> with Tomeu over IRC before he posted it and since you already added your
> Reviewed-by tag, I didn't feel the need do to it.
>
> This is a regression for 4.3 since S2R was working correctly for 4.2 in
> Snow, I tested after fixing resume with commit 6fd4899a54a5 ("irqchip:
> exynos-combiner: Save IRQ enable set on suspend") and the display was
> always enabled on resume.

Hmmm, that means the patchset indeed should go as fixes.

Thanks for details,
Krzysztof
