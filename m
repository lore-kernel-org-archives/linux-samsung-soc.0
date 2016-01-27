From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 06/10] rtc: max77686: Add max77802 support
Date: Wed, 27 Jan 2016 13:23:18 +0900
Message-ID: <56A84636.2000107@samsung.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
 <1453865806-4661-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27793 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbcA0EXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 23:23:31 -0500
In-reply-to: <1453865806-4661-7-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 27.01.2016 12:36, Javier Martinez Canillas wrote:
> The MAX77686 and MAX77802 RTC IP blocks are very similar with only
> these differences:
> 
> 0) The RTC registers layout and addresses are different.
> 
> 1) The MAX77686 use 1 bit of the sec/min/hour/etc registers as the
>    alarm enable while MAX77802 has a separate register for that.
> 
> 2) The MAX77686 RTCYEAR register valid values range is 0..99 while
>    for MAX77802 is 0..199.
> 
> 3) The MAX77686 has a separate I2C address for the RTC registers
>    while the MAX77802 uses the same I2C address as the PMIC regs.
> 
> 5) The minimum delay before a RTC update (16 msecs vs 200 usecs).
> 
> There are separate drivers for MAX77686 and MAX77802 RTC IP blocks
> but the differences are not that big so the driver can be extended
> to support both instead of duplicating a lot of code in 2 drivers.
> 
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
> 
> ---
> 
> Changes in v4:
> - Add Krzysztof Kozlowski's Tested-by tag to patch #6.
> - Add Andi Shyti's Reviewed-by tag to patch #6.
> - Reverse alarm enable reg check logic. Suggeted by Krzysztof Kozlowski.
> - Return early to avoid an else statement. Suggested by Andi Shyti.
> 
> Changes in v3:
> - Add Laxman Dewangan's Acked-by tag to patch #6.
> 
> Changes in v2:
> - Add a MAX77802 prefix to ALARM_ENABLE_VALUE. Suggested by Krzysztof Kozlowski.
> - Rename .rtcae to .alarm_enable_reg and .rtcrm to .separate_i2c_addr.
>   Suggested by Krzysztof Kozlowski.
> - Don't use func and LINE in error messages. Suggested by Krzysztof Kozlowski.
> - Remove REG_RTC_AE2 since is not used by neither max77686 nor max77802.
> - Check if REG_RTC_AE1 has a valid address before accessing it.
> 
>  drivers/rtc/rtc-max77686.c | 196 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 156 insertions(+), 40 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

One comment at the end...

[...]


> @@ -524,6 +636,9 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  	info->drv_data = (const struct max77686_rtc_driver_data *)
>  		id->driver_data;
>  
> +	if (!info->drv_data->separate_i2c_addr)
> +		info->max77686->rtc_regmap = info->max77686->regmap;
> +

At this stage I don't like the idea of messing with parent's state
structure. The driver should not modify any of parents data (the best
way would be to take a pointer to const). In this patch this looks like
breaking the encapsulation. If the parent is responsible for regmaps,
then the parent should set rtc_regmap for children (parent also knows
what type device it is working on).

...but I am assuming that a new patch will be following this one - the
patch moving ownership of i2c dummy and regmap to the RTC driver. In
that case this code makes a lot more sense. Am I thinking correctly?

Best regards,
Krzysztof
