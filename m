From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Wed, 27 Jan 2016 10:22:30 +0900
Message-ID: <20160127012230.GE14296@samsunx.samsung>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-8-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <1453836020-29579-8-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

>  		if (tm->tm_year < 100) {
> -			pr_warn("RTC can't handle year %d. Assume it's 2000.\n",
> -				1900 + tm->tm_year);
> +			dev_warn(info->dev,
> +				 "RTC can't handle year %d. Assume it's 2000\n",
> +				 1900 + tm->tm_year);
>  			return -EINVAL;

Because we are returning an error value, why not use dev_err()?

>  		}
>  	} else {
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
