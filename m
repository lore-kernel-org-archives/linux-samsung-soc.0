From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] i2c: use dev_get_drvdata() to get private data in
 suspend/resume hooks
Date: Fri, 28 Jul 2017 13:40:15 +0300
Message-ID: <1501238415.29303.279.camel@linux.intel.com>
References: <1501172184-17102-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:34028 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751595AbdG1KkV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Jul 2017 06:40:21 -0400
In-Reply-To: <1501172184-17102-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-i2c@vger.kernel.org
Cc: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Scott Branden <sbranden@broadcom.com>, Wolfram Sang <wsa@the-dreams.de>, Joachim Eastwood <manabian@gmail.com>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <krzk@kernel.org>, Barry Song <baohua@kernel.org>, Jon Mason <jonmason@broadcom.com>, Kevin Hilman <khilman@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-samsung-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Patrice Chotard <patrice.chotard@st.com>

On Fri, 2017-07-28 at 01:16 +0900, Masahiro Yamada wrote:
> Several drivers call to_platform_device() to get platform_device
> and pass it to platform_get_drvdata().  In platform_get_drvdata(),
> the platform_device is converted back to struct device again.
> 
> Use dev_get_drvdata() to avoid platform_device/device dance.
> 

I think it should be split on per driver basis.

In any case,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(for DesignWare only)

>  drivers/i2c/busses/i2c-designware-platdrv.c | 6 ++----

> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c
> b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2ea6d0d25a01..abe1eca8d689 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -428,8 +428,7 @@ static void dw_i2c_plat_complete(struct device
> *dev)
>  #ifdef CONFIG_PM
>  static int dw_i2c_plat_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct dw_i2c_dev *i_dev = platform_get_drvdata(pdev);
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
>  	i_dev->disable(i_dev);
>  	i2c_dw_plat_prepare_clk(i_dev, false);
> @@ -439,8 +438,7 @@ static int dw_i2c_plat_suspend(struct device *dev)
>  
>  static int dw_i2c_plat_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct dw_i2c_dev *i_dev = platform_get_drvdata(pdev);
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
>  	i2c_dw_plat_prepare_clk(i_dev, true);
>  	i_dev->init(i_dev);
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
