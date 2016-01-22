From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 01/10] rtc: max77686: Fix max77686_rtc_read_alarm()
 return value
Date: Fri, 22 Jan 2016 09:51:43 +0900
Message-ID: <56A17D1F.5030802@samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <1453407813-14646-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1453407813-14646-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 22.01.2016 05:23, Javier Martinez Canillas wrote:
> The function is always returning zero even in case of failures since
> the ret value was not propagated to the callers. Fix the error path.
> 
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/rtc/rtc-max77686.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 7184a0eda793..6653c3d11b66 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -235,7 +235,7 @@ static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  
>  out:
>  	mutex_unlock(&info->lock);
> -	return 0;
> +	return ret;
>  }
>  
>  static int max77686_rtc_stop_alarm(struct max77686_rtc_info *info)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Tested on Trats2 board with max77686:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
