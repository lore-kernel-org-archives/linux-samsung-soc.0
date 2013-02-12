From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: SAMSUNG: Silence empty switch warning in sdhci.h
Date: Tue, 12 Feb 2013 10:29:34 -0800
Message-ID: <1d6e01ce094e$e930ed80$bb92c880$@samsung.com>
References: <1360131567-583-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47206 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933566Ab3BLS3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 13:29:55 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI400MQKE1T32A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 03:29:53 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI4001RNE1SZS60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 03:29:53 +0900 (KST)
In-reply-to: <1360131567-583-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Add 'default' case to silence the following warning:
> arch/arm/plat-samsung/include/plat/sdhci.h:356:9: warning: switch with no
> cases
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/plat-samsung/include/plat/sdhci.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-
> samsung/include/plat/sdhci.h
> index 151cc91..9b87f38 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -374,6 +374,8 @@ static inline void s3c_sdhci_setname(int id, char
> *name)
>  		s3c_device_hsmmc3.name = name;
>  		break;
>  #endif
> +	default:
> +		break;
>  	}
>  }
> 
> --
> 1.7.4.1

Applied, this and second one.

Thanks.

- Kukjin
