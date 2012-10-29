From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 1/2] ARM: exynos4: Add devicetree node for TMU driver
Date: Mon, 29 Oct 2012 21:22:22 +0900
Message-ID: <508E74FE.7090900@samsung.com>
References: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com> <1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:63626 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759940Ab2J2Pvu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 11:51:50 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so2054224bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Oct 2012 08:51:49 -0700 (PDT)
In-Reply-To: <1351243746-4173-2-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, amit.kachhap@linaro.org

On 10/26/12 18:29, Amit Daniel Kachhap wrote:
> From: Amit Daniel Kachhap<amit.daniel@samsung.com>
>
> This patch adds necessary source definations needed for TMU driver and
> adds devicetree node for exynos4210.
>
> Signed-off-by: Amit Daniel Kachhap<amit.daniel@samsung.com>
> ---

[...]

> +		.name           = "tmu_apbif",
> +		.enable         = exynos4_clk_ip_perir_ctrl,
> +		.ctrlbit        = (1<<  17),

tab instead of white spaces?

I fixed them when I applied.

[...]

> +#define EXYNOS4_IRQ_TMU_TRIG0		COMBINER_IRQ(2, 4)
> +#define EXYNOS4_IRQ_TMU_TRIG1		COMBINER_IRQ(3, 4)

BTW, where are above definitions used?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
