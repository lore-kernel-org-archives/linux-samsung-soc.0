From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 03/10] rtc: max77686: Use usleep_range() instead of
 msleep()
Date: Wed, 27 Jan 2016 10:21:05 +0900
Message-ID: <20160127012105.GC14296@samsunx.samsung>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <1453836020-29579-4-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 26, 2016 at 04:20:13PM -0300, Javier Martinez Canillas wrote:
> Documentation/timers/timers-howto.txt suggest to use usleep_range()
> instead of msleep() for small msec (1ms - 20ms) since msleep() will
> often sleep for 20ms for any value in that range.
> 
> This is fine in this case since 16ms is the _minimum_ delay required
> by max77686 for an RTC update but by using usleep_range() instead of
> msleep(), the driver can support other RTC IP blocks with a shorter
> minimum delay (i.e: in the range of usecs instead of msecs).
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

> ---
> 
> Changes in v3:
> - Add Krzysztof Kozlowski's Tested-by tag to patch #3.
> - Add Laxman Dewangan's Acked-by tag to patch #3.
> 
> Changes in v2:
> - Add Krzysztof Kozlowski's Reviewed-by tag to patch #3.
> - Fix typo error in changelog. Suggested by Krzysztof Kozlowski.
> 
>  drivers/rtc/rtc-max77686.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d84a50c9f7f7..025a17a95da3 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -41,7 +41,7 @@
>  #define ALARM_ENABLE_SHIFT		7
>  #define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
>  
> -#define MAX77686_RTC_UPDATE_DELAY	16
> +#define MAX77686_RTC_UPDATE_DELAY	16000
>  
>  enum {
>  	RTC_SEC = 0,
> @@ -130,7 +130,8 @@ static int max77686_rtc_update(struct max77686_rtc_info *info,
>  				__func__, ret, data);
>  	else {
>  		/* Minimum 16ms delay required before RTC update. */
> -		msleep(MAX77686_RTC_UPDATE_DELAY);
> +		usleep_range(MAX77686_RTC_UPDATE_DELAY,
> +			     MAX77686_RTC_UPDATE_DELAY * 2);
>  	}
>  
>  	return ret;
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
