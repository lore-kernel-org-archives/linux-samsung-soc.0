From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock
 disable failure due to domain being gated
Date: Tue, 09 Dec 2014 15:05:42 +0100
Message-ID: <548701B6.2030902@collabora.co.uk>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com> <1418129982.19339.6.camel@AMDC1943> <5486F69B.6020005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:58178 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752737AbaLIOFt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Dec 2014 09:05:49 -0500
In-Reply-To: <5486F69B.6020005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 12/09/2014 02:18 PM, Sylwester Nawrocki wrote:
>> 
>> This is a non-intrusive workaround for that issue, as wanted by
>> Sylwester:
>> https://lkml.org/lkml/2014/12/5/223
>> 
>> Any comments on this?
> 
> The patch looks OK to me, it would be good though if someone else
> has confirmed it fixes the bug. I don't have any clock patches queued
> at the moment. Perhaps you could apply it directly, Mike ?
> 

This patch fixes the boot failure bug on my Exynos5420 Peach Pit
Chromebook and I've audio working as well.

> From my side:
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
