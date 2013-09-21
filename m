From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 5/6] clk: exynos-audss: add support for Exynos 5420
Date: Sat, 21 Sep 2013 17:17:28 +0200
Message-ID: <1407151.hAbz8S9ABE@flatron>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org> <1379711637-5226-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1379711637-5226-5-git-send-email-abrestic@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Bresticker <abrestic@chromium.org>, linux-samsung-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-doc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, Jiri Kosina <jkosina@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Leela
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrew,

On Friday 20 of September 2013 14:13:56 Andrew Bresticker wrote:
> The AudioSS block on Exynos 5420 has an additional clock gate for the
> ADMA bus clock.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
>  Documentation/devicetree/bindings/clock/clk-exynos-audss.txt | 7
> +++++-- drivers/clk/samsung/clk-exynos-audss.c                       |
> 8 ++++++++ include/dt-bindings/clk/exynos-audss-clk.h                  
> | 3 ++- 3 files changed, 15 insertions(+), 3 deletions(-)
[snip]
> +	if (of_device_is_compatible(pdev->dev.of_node,
> +					"samsung,exynos5420-audss-clock")) 
{

I don't really like using such string based conditions in the code, but I 
guess it's just a matter of preference.

I'd introduce an enum to represent supported variants and put them into 
the OF match table or maybe even a struct that would have a bool named 
has_adma_clock, true for Exynos5420 variant.

Best regards,
Tomasz

