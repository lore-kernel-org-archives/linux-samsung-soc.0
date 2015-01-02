From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock
 disable failure due to domain being gated
Date: Fri, 02 Jan 2015 10:49:06 +0100
Message-ID: <54A66992.1080802@collabora.co.uk>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com> <1418129982.19339.6.camel@AMDC1943> <5486F69B.6020005@samsung.com> <7hlhmfo1b0.fsf@deeprootsystems.com> <20141224163626.GA3902@peachpi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59786 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761AbbABJtM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jan 2015 04:49:12 -0500
In-Reply-To: <20141224163626.GA3902@peachpi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paolo Pisati <p.pisati@gmail.com>, Kevin Hilman <khilman@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Paolo,

On 12/24/2014 05:36 PM, Paolo Pisati wrote:
> On Wed, Dec 10, 2014 at 09:35:31AM -0800, Kevin Hilman wrote:
>> 
>> I confirm it fixes the boot hang in linux-next (next-20141210) on my
>> exynos5800-peach-pi and exynos5420-arndale-octa.  Tested both
>> exynos_defconfig and multi_v7_defconfig.
>> 
>> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
> does audio work on your peach pi? because kernel boots fine, but i can't get any
> audio out of it
> 

Audio is not working for me as well. I said before that audio was working
because I tested with the headphone audio jack but I forgot that I had
re-introduced the clk_ignore_unused parameter to my kernel command line
to test the mmc/sdio wifi. Without clk_ignore_unused, I have no audio.

I see that the downstream daisy_max98095 ASoC driver in the ChromeOS tree
grabs some clocks that the mainline sound/soc/samsung/snow.c driver so it
it seems that at least that is missing and may explain why it is working
with clk_ignore_unused.

Best regards,
Javier
