From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 3/6] driver: soc: exynos-pmu: Add an API to be called
 after wakeup
Date: Sun, 30 Nov 2014 08:26:42 +0900
Message-ID: <02a301d00c2b$ef2f0eb0$cd8d2c10$@kernel.org>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
 <1417270508-11174-4-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27912 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751692AbaK2X0o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 18:26:44 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT009W5QGJLZ20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 30 Nov 2014 08:26:43 +0900 (KST)
In-reply-to: <1417270508-11174-4-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: b.zolnierkie@samsung.com, pankaj.dubey@samsung.com

Amit Daniel Kachhap wrote:
> 
> This patch adds an API exynos_sys_powerup_conf to be called after system sleep
> wakeup. This will useful for exynos7 SoC to perform resume related
> initialisations. This is similar to currently existing API
> exynos_sys_powerdown_conf.
> 
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>

In subject,

"driver: soc..." -> "drivers: soc..." ?

- Kukjin

> ---
>  drivers/soc/samsung/exynos-pmu.c       |    9 +++++++++
>  include/linux/soc/samsung/exynos-pmu.h |    1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 7eb5b0b..c3307eb 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -33,6 +33,7 @@ struct exynos_pmu_data {
>  	void (*pmu_init)(void);
>  	void (*powerdown_conf)(enum sys_powerdown);
>  	void (*powerdown_conf_extra)(enum sys_powerdown);
> +	void (*powerup_conf)(enum sys_powerdown);
>  };
> 
>  struct exynos_pmu_context {
> @@ -768,6 +769,14 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>  	}
>  }
> 
> +void exynos_sys_powerup_conf(enum sys_powerdown mode)
> +{
> +	const struct exynos_pmu_data *pmu_data = pmu_context->pmu_data;
> +
> +	if (pmu_data->powerup_conf)
> +		pmu_data->powerup_conf(mode);
> +}
> +
>  static void exynos3250_pmu_init(void)
>  {
>  	unsigned int value;
> diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
> index a2ab0d5..b497712 100644
> --- a/include/linux/soc/samsung/exynos-pmu.h
> +++ b/include/linux/soc/samsung/exynos-pmu.h
> @@ -20,5 +20,6 @@ enum sys_powerdown {
>  };
> 
>  extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
> +extern void exynos_sys_powerup_conf(enum sys_powerdown mode);
> 
>  #endif /* __EXYNOS_PMU_H */
> --
> 1.7.9.5
