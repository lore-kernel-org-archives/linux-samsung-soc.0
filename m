From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 5/5] clk: samsung: Add support for exynos5410 AUDSS clock
 controller
Date: Fri, 02 Sep 2016 17:19:42 +0200
Message-ID: <23ed1cb9-8219-777f-c42c-32d8ae404650@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-6-git-send-email-s.nawrocki@samsung.com>
 <94535e9f-7c13-8be2-3bdf-8c3d3354c688@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <94535e9f-7c13-8be2-3bdf-8c3d3354c688@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-clk@vger.kernel.org, tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/30/2016 12:38 PM, Krzysztof Kozlowski wrote:
> On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
>> > Exynos5410 Audio Subsystem Clock Controller, comparing to the already
>> > supported by the driver IP block revisions, has additionally an I2S_MST
>> > divider so a new compatible string is added.
>> > While at it, the variant handling is reworked to avoid scattered testing
>> > for the controller's variant.
>
> Please split it into simple changes:
> 1. Whitespace cleanup (below you do it).
> 2. Variant handling rework.
> 3. New compatible added.
> 
> This would make easy to spot changes and new features.

Ok, I'll split it, thanks for your review.
