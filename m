From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the
 PHY	control callback
Date: Thu, 10 Mar 2011 20:29:08 +0900
Message-ID: <008d01cbdf16$63de2ad0$2b9a8070$%kim@samsung.com>
References: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
 <1299755195-9055-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9787 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab1CJL3S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 06:29:18 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHU00A7YAKSJ000@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 20:29:17 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHU004U9AKST8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 20:29:17 +0900 (KST)
In-reply-to: <1299755195-9055-3-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Extend MIPI-CSIS driver's platform data structure with a callback
> for D-PHY enable and reset control. Also add a flag indicating
> whether the external MIPI-CSI (VDD18_MIPI) power supply should
> be managed in the driver through the "vdd" power supply. On some
> boards this regulator may be a fixed voltage regulator without
> an inhibit function.
> 
Grrr...you submitted same patch yesterday like following :(

"[PATCH v2] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY"
http://marc.info/?l=linux-arm-kernel&m=129968557727858&w=2

...

> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-s5p/include/plat/mipi_csis.h |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/include/plat/mipi_csis.h b/arch/arm/plat-
> s5p/include/plat/mipi_csis.h
> index eb3beab..bb4f396 100644
> --- a/arch/arm/plat-s5p/include/plat/mipi_csis.h
> +++ b/arch/arm/plat-s5p/include/plat/mipi_csis.h
> @@ -11,18 +11,33 @@
>  #ifndef PLAT_S5P_MIPI_CSIS_H_
>  #define PLAT_S5P_MIPI_CSIS_H_ __FILE__
> 
> +struct platform_device;
> +
>  /**
>   * struct s5p_platform_mipi_csis - platform data for S5P MIPI-CSIS driver
>   * @clk_rate: bus clock frequency
>   * @lanes: number of data lanes used
>   * @alignment: data alignment in bits
>   * @hs_settle: HS-RX settle time
> + * @fixed_phy_vdd: set to 0 if the driver should be managing external
> + *		   D-PHY power supply through the "vdd" regulator supply
> + * @phy_enable: pointer to a callback controlling D-PHY enable/reset
>   */
>  struct s5p_platform_mipi_csis {
>  	unsigned long clk_rate;
>  	u8 lanes;
>  	u8 alignment;
>  	u8 hs_settle;
> +	unsigned fixed_phy_vdd:1;

+	bool fixed_phy_vdd:1;

> +	int (*phy_enable)(struct platform_device *pdev, bool on);
>  };
> 
> +/**
> + * s5p_csis_phy_enable - global MIPI-CSI receiver D-PHY control
> + * @pdev: MIPI-CSIS platform device
> + * @on: true to enable D-PHY and deassert its reset
> + *	false to disable D-PHY
> + */
> +int s5p_csis_phy_enable(struct platform_device *pdev, bool on);
> +
>  #endif /* PLAT_S5P_MIPI_CSIS_H_ */
> --
> 1.7.4.1


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
