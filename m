From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v3 09/10] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED
 flag to clocks for sercure monitor call
Date: Mon, 27 Apr 2015 22:11:28 +0900
Message-ID: <CAJKOXPfBvtkm6y_hG0NrPKVQX-7fZyiW_bTV5FJRQyunn9R+=g@mail.gmail.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
	<1430134597-14668-10-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f41.google.com ([209.85.216.41]:37894 "EHLO
	mail-vn0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbbD0NL3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 09:11:29 -0400
In-Reply-To: <1430134597-14668-10-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>

2015-04-27 20:36 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> From: Jonghwa Lee <jonghwa3.lee@samsung.com>
>
> This patch adds 'CLK_IGNORE_UNUSED' flag to clocks which is required for
> operation of secure monitor call (smc). System will hang when it executes 'smc'
> with one of those clock is gated. All related clocks must be enabled.
>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Hi,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Best regards,
Krzysztof
