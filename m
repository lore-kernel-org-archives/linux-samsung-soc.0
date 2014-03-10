From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 5/9 v7] clk: samsung exynos5250/5420: Add gate clock for
 SSS module
Date: Mon, 10 Mar 2014 01:19:18 +0100
Message-ID: <531D0506.7080209@gmail.com>
References: <1392630275-8667-1-git-send-email-ch.naveen@samsung.com> <1392630275-8667-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1392630275-8667-6-git-send-email-ch.naveen@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vzapolskiy@gmail.com, herbert@gondor.apana.org.au, naveenkrishna.ch@gmail.com, cpgs@samsung.com, davem@davemloft.net, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 17.02.2014 10:44, Naveen Krishna Chatradhi wrote:
> This patch adds gating clock for SSS(Security SubSystem)
> module on Exynos5250/5420.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> TO: <linux-samsung-soc@vger.kernel.org>
> TO: Tomasz Figa <t.figa@samsung.com>
> CC: David S. Miller <davem@davemloft.net>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: <linux-crypto@vger.kernel.org>
> ---
> changes since v6:
> None
> changes since v5:
> 1. Added Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
>   .../devicetree/bindings/clock/exynos5250-clock.txt |    1 +
>   drivers/clk/samsung/clk-exynos5250.c               |    1 +
>   drivers/clk/samsung/clk-exynos5420.c               |    4 ++++
>   include/dt-bindings/clock/exynos5250.h             |    1 +
>   4 files changed, 7 insertions(+)

Applied to samsung-clk tree.

Best regards,
Tomasz
