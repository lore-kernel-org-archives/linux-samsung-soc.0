From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: Supported high resolution rates
Date: Wed, 05 Jul 2017 15:13:23 +0900
Message-ID: <20170705061323.a45ylipylcerz3te@gangnam.samsung>
References: <CGME20170705055835epcas5p32d60ee0f1acaf4e04c8a80d49bc2a730@epcas5p3.samsung.com>
        <20170705055832.4893-1-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29508 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbdGEGN1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 02:13:27 -0400
Content-disposition: inline
In-reply-to: <20170705055832.4893-1-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel <alsa-devel@alsa-project.org>, Jaechul Lee <galaxyra@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jaechul,

> This driver can support more frequencies over 96KHz. There are no reasons
> to limit the frequency range below 96KHz. If codecs/amps or something else
> can't support high resolution rates, the constraints would be set rates
> properly because each drivers have its own limits.

That's a good commit introduction, but you are not explaining
what you actually did. Please explain better how you fixed the
issue.

"> Supported high resolution rates"

In the patch title, please use the imperative form, not
"supported" but "support".

> +	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)

I do not like drivers to check the Kernel's configuration, I
think just checking "pdev->dev.of_node" is enough.

The rest looks good.

Andi
