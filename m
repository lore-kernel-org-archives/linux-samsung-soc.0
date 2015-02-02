From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 01/13] clk: samsung: exynos5433: Add binding document
 for Exynos5433 clock domains
Date: Mon, 02 Feb 2015 15:40:53 +0100
Message-ID: <54CF8C75.7000104@samsung.com>
References: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
 <1422882074-19758-2-git-send-email-cw00.choi@samsung.com>
 <54CF81DE.3010902@samsung.com> <54CF84D8.7070208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59785 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbbBBOlN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 09:41:13 -0500
In-reply-to: <54CF84D8.7070208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/02/15 15:08, Chanwoo Choi wrote:

> OK, I'll add more following information:
> I'll send only patch1 with following information.
> 
> + - clocks: list of clock identifiers which are fed as the input to
> +       the given clock controller. Please refer the next section to
> +       find the input clocks for a given controller.
> + - clock-names: list of names of clocks which are fed as the input
> +       to the given clock controller.
> +

Perhaps:

+ - clocks: list of the clock controller input clock identifiers,
	from common clock bindings. Please refer the next section
	to find the input clocks for a given controller.

+- clock-names: list of the clock controller input clock names,
	as described in clock-bindings.txt.

?
It's fine to resend just updated first patch from each series.

-- 
Regards,
Sylwester
