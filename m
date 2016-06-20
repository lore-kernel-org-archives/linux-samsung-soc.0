From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/3] clk: samsung: exynos5433: prepare for adding CPU clocks
Date: Mon, 20 Jun 2016 15:35:47 +0200
Message-ID: <1687314.R0ikIvAotG@amdc1976>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
 <1464095957-25851-2-git-send-email-b.zolnierkie@samsung.com>
 <CA+Ln22GmeuHaNwpHOMxP0SA9-KaJp4D4sM5aF3bVRWm5Xb72fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34141 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754395AbcFTNgE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 09:36:04 -0400
In-reply-to: <CA+Ln22GmeuHaNwpHOMxP0SA9-KaJp4D4sM5aF3bVRWm5Xb72fA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>


Hi Tomasz,

On Saturday, June 18, 2016 11:40:05 PM Tomasz Figa wrote:
> Hi Bartlomiej,
> 
> 2016-05-24 22:19 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> > Open-code samsung_cmu_register_one() calls for CMU_APOLLO and
> > CMU_ATLAS setup code as a preparation for adding CPU clocks
> > support for Exynos5433.
> 
> Why do we need to open code it? Even if it's really necessary, it

We want to register CPU clock before calling samsung_clk_sleep_init()
and samsung_clk_of_add_provider() (just as we do it on other Exynos
SoCs) so we cannot use samsung_cmu_register_one() helper.

> would make sense to state it in the commit description for lazy
> readers reviewing the patches in order. :)

Right, sorry about that.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
