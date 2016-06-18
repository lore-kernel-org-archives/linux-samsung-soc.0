From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: cpu: prepare for adding Exynos5433 CPU clocks
Date: Sat, 18 Jun 2016 23:53:36 +0900
Message-ID: <CA+Ln22FwQ_e5OHg_8WHEWGER=X8g_Yq+NpVLONgb0ZAShJLjzA@mail.gmail.com>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com> <1464095957-25851-3-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:35284 "EHLO
	mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416AbcFROxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jun 2016 10:53:37 -0400
In-Reply-To: <1464095957-25851-3-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Bart,

2016-05-24 22:19 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> Exynos5433 uses different register layout for CPU clock registers
> than earlier SoCs so add new code for handling this layout.  Also
> add new CLK_CPU_HAS_E5433_REGS_LAYOUT flag to request using it.

Have you considered abstracting this? Comparing existing code with
newly added one, the differences don't really seem to be that huge and
it looks like there is more common code than different, except maybe
some numeric constants that could be put into a struct.

Best regards,
Tomasz
