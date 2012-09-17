From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ARM: samsung: Change __s5p_mipi_phy_control() function
 signature
Date: Mon, 17 Sep 2012 20:06:50 +0900
Message-ID: <050e01cd94c4$89e29080$9da7b180$%kim@samsung.com>
References: <1347878888-30001-1-git-send-email-s.nawrocki@samsung.com>
 <1347879100-30150-1-git-send-email-s.nawrocki@samsung.com>
 <1347879100-30150-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31054 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755796Ab2IQLGz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 07:06:55 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH00EURQVBAKO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:06:52 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH004ONQVFKG50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 20:06:51 +0900 (KST)
In-reply-to: <1347879100-30150-2-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> Replace pdev argument __s5p_mipi_phy_control() helper with plain int
> so MIPI-CSIS hardware instance index can be passed directly making
> the function usable on platforms instantiated from device tree.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Kukjin <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
> ---
>  arch/arm/plat-samsung/setup-mipiphy.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/setup-mipiphy.c b/arch/arm/plat-
> samsung/setup-mipiphy.c
> index 683c466..1474593 100644
> --- a/arch/arm/plat-samsung/setup-mipiphy.c
> +++ b/arch/arm/plat-samsung/setup-mipiphy.c
> @@ -14,24 +14,18 @@
>  #include <linux/spinlock.h>
>  #include <mach/regs-clock.h>
> 
> -static int __s5p_mipi_phy_control(struct platform_device *pdev,
> -				  bool on, u32 reset)
> +static int __s5p_mipi_phy_control(int id, bool on, u32 reset)
>  {
>  	static DEFINE_SPINLOCK(lock);
>  	void __iomem *addr;
>  	unsigned long flags;
> -	int pid;
>  	u32 cfg;
> 
> -	if (!pdev)
> +	id = max(0, id);
> +	if (id > 1)
>  		return -EINVAL;
> 
> -	pid = (pdev->id == -1) ? 0 : pdev->id;
> -
> -	if (pid != 0 && pid != 1)
> -		return -EINVAL;
> -
> -	addr = S5P_MIPI_DPHY_CONTROL(pid);
> +	addr = S5P_MIPI_DPHY_CONTROL(id);
> 
>  	spin_lock_irqsave(&lock, flags);
> 
> @@ -52,12 +46,12 @@ static int __s5p_mipi_phy_control(struct
> platform_device *pdev,
>  	return 0;
>  }
> 
> -int s5p_csis_phy_enable(struct platform_device *pdev, bool on)
> +int s5p_csis_phy_enable(int id, bool on)
>  {
> -	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_SRESETN);
> +	return __s5p_mipi_phy_control(id, on, S5P_MIPI_DPHY_SRESETN);
>  }
> 
>  int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
>  {
> -	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_MRESETN);
> +	return __s5p_mipi_phy_control(pdev->id, on, S5P_MIPI_DPHY_MRESETN);
>  }
> --
> 1.7.11.3
