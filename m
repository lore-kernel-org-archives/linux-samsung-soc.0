From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk samsung exynos5420 add CLK_RECALC_NEW_RATES flag to
 mout_apll and mout_kpll clock.
Date: Fri, 08 May 2015 13:05:43 +0900
Message-ID: <554C3617.10906@samsung.com>
References: <1431020935-5025-1-git-send-email-linux.amoon@gmail.com>
 <CAJKOXPcCc8j=i5FPdF62bGKar74+4U=C9BPN9ar2j52Y8dSMwA@mail.gmail.com>
 <CANAwSgT8aa5svHgLbkNkSPXWT_hLez8e4cBws2ajEB9p56WHFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48358 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260AbbEHEFt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 00:05:49 -0400
In-reply-to: <CANAwSgT8aa5svHgLbkNkSPXWT_hLez8e4cBws2ajEB9p56WHFA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 08.05.2015 13:01, Anand Moon wrote:
> Hi Krysztof,
> 
> Actually the patch is based on https://lkml.org/lkml/2015/4/3/389
> I don't know how to measure the energy consumption when compared to
> cpufreq-exynos.

It does not have to be energy consumption. It may be something else
visible, like wrong values for clock rates. I don't know, it is your
patch so you should know *what is fixed* (or changed).

Best regards,
Krzysztof
