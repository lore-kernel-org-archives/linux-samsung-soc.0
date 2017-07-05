From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: Supported high resolution rates
Date: Wed, 05 Jul 2017 15:54:17 +0900
Message-ID: <20170705065417.a7bdofqhqlihcstq@gangnam.samsung>
References: <CGME20170705055835epcas5p32d60ee0f1acaf4e04c8a80d49bc2a730@epcas5p3.samsung.com>
        <20170705055832.4893-1-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42481 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752345AbdGEGyU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 02:54:20 -0400
Content-disposition: inline
In-reply-to: <20170705055832.4893-1-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel <alsa-devel@alsa-project.org>, Jaechul Lee <galaxyra@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

>  
> +	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)
> +		i2s_dai_data = of_device_get_match_data(&pdev->dev);
> +	else
> +		i2s_dai_data = (struct samsung_i2s_dai_data *)
> +				platform_get_device_id(pdev)->driver_data;
> +

BTW, as we discussed together already, you are duplicating some
code here and it looks ugly. Please refactor.

Thanks,
Andi
