From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5422: add missing parent GSCL
 block clocks
Date: Wed, 09 Dec 2015 11:14:11 +0100
Message-ID: <5667FEF3.4080703@samsung.com>
References: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
 <5667B2F3.9040807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5667B2F3.9040807@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adding Stephen and linux-clk at Cc.

On 09/12/15 05:49, Krzysztof Kozlowski wrote:
> On 08.12.2015 22:46, Marek Szyprowski wrote:
>> > This patch adds clocks, which are required for preserving parent clock
>> > configuration on GSCL power domain on/off.
>> > 
>> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> > ---
>> >  drivers/clk/samsung/clk-exynos5420.c   | 8 ++++----
>> >  include/dt-bindings/clock/exynos5420.h | 2 ++
>> >  2 files changed, 6 insertions(+), 4 deletions(-)
>
> I suppose that, with ack from clock folks, this can go through samsung-soc?

I guess it makes more sense that making a stable branch with just
this patch to be pulled into arm-soc and clk tree. I'm fine with
applying this patch through arm-soc, but I think we also need
Mike's or Stephen ack for this.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
