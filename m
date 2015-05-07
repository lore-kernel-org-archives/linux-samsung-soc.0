From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/1] mfd: max77686: Remove unused struct
 max77686_opmode_data
Date: Thu, 07 May 2015 10:49:41 +0900
Message-ID: <554AC4B5.2070905@samsung.com>
References: <1430932036-23971-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59462 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbbEGBto (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 21:49:44 -0400
In-reply-to: <1430932036-23971-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/07/2015 02:07 AM, Javier Martinez Canillas wrote:
> The defined struct max77686_opmode_data isn't used neither by
> the max77686 mfd driver nor the drivers for its sub-devices.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  include/linux/mfd/max77686.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max77686.h
> index bb995ab9a575..d4b72d519115 100644
> --- a/include/linux/mfd/max77686.h
> +++ b/include/linux/mfd/max77686.h
> @@ -125,9 +125,4 @@ enum max77686_opmode {
>  	MAX77686_OPMODE_STANDBY,
>  };
>  
> -struct max77686_opmode_data {
> -	int id;
> -	int mode;
> -};
> -
>  #endif /* __LINUX_MFD_MAX77686_H */
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
