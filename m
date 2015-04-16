From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix return value check in s3c24xx_iis_dev_probe()
Date: Thu, 16 Apr 2015 21:24:03 +0900
Message-ID: <CAJKOXPf5kiC4pvk0zAOYXu2z8LJAWTLHbcMMzdXzvL+rpiT8Lw@mail.gmail.com>
References: <1429186682-20629-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:35359 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367AbbDPMYE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 08:24:04 -0400
Received: by vnbg1 with SMTP id g1so23689918vnb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Apr 2015 05:24:03 -0700 (PDT)
In-Reply-To: <1429186682-20629-1-git-send-email-weiyj_lk@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: weiyj_lk@163.com
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org

2015-04-16 21:18 GMT+09:00  <weiyj_lk@163.com>:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_ioremap_resource() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  sound/soc/samsung/s3c24xx-i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Good catch.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Best regards,
Krzysztof
