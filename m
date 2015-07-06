From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 0/2] thermal: exynos: Fix minor issue
Date: Mon, 06 Jul 2015 17:19:17 +0200
Message-ID: <20150706171917.24ab262c@amdc2363>
References: <1435819201-30729-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44503 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbbGFPTZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 11:19:25 -0400
In-reply-to: <1435819201-30729-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: eduardo.valentin@ti.com, rui.zhang@intel.com, kgene@kernel.org, k.kozlowski@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

> This patch fixes the two minor issue. The first patch add the
> CONFIG_THERMAL_OF dependency and second patch removes the unused code.
> 
> Chanwoo Choi (2):
>   thermal: exynos: Add the dependency of CONFIG_THERMAL_OF instead of
> CONFIG_OF thermal: exynos: Remove unused code related to
> platform_data on probe()
> 
>  drivers/thermal/samsung/Kconfig      | 2 +-
>  drivers/thermal/samsung/exynos_tmu.c | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 

Thanks for your work.

Applied to my tree: linux-samusng-thermal/fixes


-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
