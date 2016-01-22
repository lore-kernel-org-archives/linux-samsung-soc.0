From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 04/10] rtc: max77686: Use a driver data struct instead
 hard-coded values
Date: Fri, 22 Jan 2016 10:00:10 +0900
Message-ID: <56A17F1A.8020402@samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <1453407813-14646-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1453407813-14646-5-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 22.01.2016 05:23, Javier Martinez Canillas wrote:
> The driver has some hard-coded values such as the minimum delay needed
> before a RTC update or the mask used for the sec/min/hour/etc registers.
> 
> Use a data structure that contains these values and pass as driver data
> using the platform device ID table for each device.
> 
> This allows to make the driver's ops callbacks more generic so other RTC
> that are similar but don't have the same values can also be supported.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v2:
> - Add a max77686 prefix to rtc_driver_data. Suggested by Krzysztof Kozlowski.
> - Comment about the .delay and .mask fields. Suggested by Krzysztof Kozlowski.
> - Change .mask type to u8. Suggested by Krzysztof Kozlowski.
> - Make .drv_data field const. Suggested by Krzysztof Kozlowski.
> - Don't cast to drop const on .drv_data asign. Suggested by Krzysztof Kozlowski.
> - Use platform_get_device_id() macro. Suggested by Krzysztof Kozlowski.
> 
>  drivers/rtc/rtc-max77686.c | 51 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 71ef2240b3fc..16033a2c2756 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -41,8 +41,6 @@
>  #define ALARM_ENABLE_SHIFT		7
>  #define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
>  
> -#define MAX77686_RTC_UPDATE_DELAY	16000
> -
>  enum {
>  	RTC_SEC = 0,
>  	RTC_MIN,
> @@ -54,6 +52,13 @@ enum {
>  	RTC_NR_TIME
>  };
>  
> +struct max77686_rtc_driver_data {
> +	/* Minimum delay needed for a RTC update */
> +	unsigned long		delay;
> +	/* Mask used to read RTC registers value */
> +	u8			mask;
> +};
> +
>  struct max77686_rtc_info {
>  	struct device		*dev;
>  	struct max77686_dev	*max77686;
> @@ -63,6 +68,8 @@ struct max77686_rtc_info {
>  
>  	struct regmap		*regmap;
>  
> +	const struct max77686_rtc_driver_data *drv_data;
> +
>  	int virq;
>  	int rtc_24hr_mode;
>  };
> @@ -72,12 +79,19 @@ enum MAX77686_RTC_OP {
>  	MAX77686_RTC_READ,
>  };
>  
> +static const struct max77686_rtc_driver_data max77686_drv_data = {
> +	.delay = 1600,

16000.
wakealarm does not work with 1600.


> +	.mask  = 0x7f,
> +};
> +
>  static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
> -				   int rtc_24hr_mode)
> +				    struct max77686_rtc_info *info)
>  {
> -	tm->tm_sec = data[RTC_SEC] & 0x7f;
> -	tm->tm_min = data[RTC_MIN] & 0x7f;
> -	if (rtc_24hr_mode)
> +	int mask = info->drv_data->mask;

u8 mask

Best regards,
Krzysztof
