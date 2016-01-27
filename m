From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 02/10] rtc: max77686: Use ARRAY_SIZE() instead of
 current array length
Date: Wed, 27 Jan 2016 10:20:34 +0900
Message-ID: <20160127012034.GB14296@samsunx.samsung>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46297 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbcA0BUh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 20:20:37 -0500
Content-disposition: inline
In-reply-to: <1453836020-29579-3-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On Tue, Jan 26, 2016 at 04:20:12PM -0300, Javier Martinez Canillas wrote:
> It is better to use the ARRAY_SIZE() macro instead of the array length
> to avoid bugs if the array is later changed and the length not updated.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

> ---
> 
> Changes in v3:
> - Add Krzysztof Kozlowski's Tested-by tag to patch #2.
> - Add Laxman Dewangan's Acked-by tag to patch #2.
> - Use ARRAY_SIZE() in all places. Suggested by Laxman Dewangan.
> 
> Changes in v2:
> - Add Krzysztof Kozlowski's Reviewed-by tag to patch #2.
> 
>  drivers/rtc/rtc-max77686.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 6653c3d11b66..d84a50c9f7f7 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -149,7 +149,7 @@ static int max77686_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		goto out;
>  
>  	ret = regmap_bulk_read(info->max77686->rtc_regmap,
> -				MAX77686_RTC_SEC, data, RTC_NR_TIME);
> +				MAX77686_RTC_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to read time reg(%d)\n", __func__,	ret);
>  		goto out;
> @@ -177,7 +177,7 @@ static int max77686_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	mutex_lock(&info->lock);
>  
>  	ret = regmap_bulk_write(info->max77686->rtc_regmap,
> -				 MAX77686_RTC_SEC, data, RTC_NR_TIME);
> +				 MAX77686_RTC_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write time reg(%d)\n", __func__,
>  				ret);
> @@ -205,7 +205,7 @@ static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  		goto out;
>  
>  	ret = regmap_bulk_read(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s:%d fail to read alarm reg(%d)\n",
>  				__func__, __LINE__, ret);
> @@ -215,7 +215,7 @@ static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	max77686_rtc_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
>  
>  	alrm->enabled = 0;
> -	for (i = 0; i < RTC_NR_TIME; i++) {
> +	for (i = 0; i < ARRAY_SIZE(data); i++) {
>  		if (data[i] & ALARM_ENABLE_MASK) {
>  			alrm->enabled = 1;
>  			break;
> @@ -252,7 +252,7 @@ static int max77686_rtc_stop_alarm(struct max77686_rtc_info *info)
>  		goto out;
>  
>  	ret = regmap_bulk_read(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to read alarm reg(%d)\n",
>  				__func__, ret);
> @@ -261,11 +261,11 @@ static int max77686_rtc_stop_alarm(struct max77686_rtc_info *info)
>  
>  	max77686_rtc_data_to_tm(data, &tm, info->rtc_24hr_mode);
>  
> -	for (i = 0; i < RTC_NR_TIME; i++)
> +	for (i = 0; i < ARRAY_SIZE(data); i++)
>  		data[i] &= ~ALARM_ENABLE_MASK;
>  
>  	ret = regmap_bulk_write(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write alarm reg(%d)\n",
>  				__func__, ret);
> @@ -291,7 +291,7 @@ static int max77686_rtc_start_alarm(struct max77686_rtc_info *info)
>  		goto out;
>  
>  	ret = regmap_bulk_read(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to read alarm reg(%d)\n",
>  				__func__, ret);
> @@ -312,7 +312,7 @@ static int max77686_rtc_start_alarm(struct max77686_rtc_info *info)
>  		data[RTC_DATE] |= (1 << ALARM_ENABLE_SHIFT);
>  
>  	ret = regmap_bulk_write(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write alarm reg(%d)\n",
>  				__func__, ret);
> @@ -341,7 +341,7 @@ static int max77686_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  		goto out;
>  
>  	ret = regmap_bulk_write(info->max77686->rtc_regmap,
> -				 MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
> +				 MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>  
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write alarm reg(%d)\n",
> @@ -406,7 +406,8 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
>  
>  	info->rtc_24hr_mode = 1;
>  
> -	ret = regmap_bulk_write(info->max77686->rtc_regmap, MAX77686_RTC_CONTROLM, data, 2);
> +	ret = regmap_bulk_write(info->max77686->rtc_regmap,
> +				MAX77686_RTC_CONTROLM, data, ARRAY_SIZE(data));
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
>  				__func__, ret);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
