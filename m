From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix HDMI related warnings
Date: Fri, 07 Sep 2012 15:16:57 +0900
Message-ID: <244901cd8cc0$62934300$27b9c900$%kim@samsung.com>
References: <1346136077-1226-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12814 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932381Ab2IGGQ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 02:16:59 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y00AKZURXPP10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 15:16:57 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y00G1TUS9GY00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 15:16:57 +0900 (KST)
In-reply-to: <1346136077-1226-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Silences the following warnings:
> arch/arm/plat-samsung/devs.c:765:31: warning:
> symbol 's5p_hdmi_def_platdata' was not declared. Should it be static?
> arch/arm/plat-samsung/devs.c:767:13: warning:
> symbol 's5p_hdmi_set_platdata' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/plat-samsung/devs.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 6ff45d5..565cea7 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -51,6 +51,7 @@
>  #include <plat/ehci.h>
>  #include <plat/fb.h>
>  #include <plat/fb-s3c2410.h>
> +#include <plat/hdmi.h>
>  #include <plat/hwmon.h>
>  #include <plat/iic.h>
>  #include <plat/keypad.h>
> @@ -762,7 +763,7 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct
> s3c2410_platform_i2c *pd)
>  			       &s5p_device_i2c_hdmiphy);
>  }
> 
> -struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
> +static struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
> 
>  void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
>  				  struct i2c_board_info *mhl_info, int
mhl_bus)
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
