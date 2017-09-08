From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] ASoC: samsung: Fix invalid argument when
 devm_gpiod_get is called
Date: Fri, 8 Sep 2017 18:46:12 +0200
Message-ID: <20170908164612.5r6mkzul3cts7m56@kozik-lap>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
 <CGME20170906010417epcas2p1fa15cc68a8fb034f087b8103f6767f29@epcas2p1.samsung.com>
 <20170906010415.26952-4-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.161.176]:35058 "EHLO
        mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932183AbdIHQqS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Sep 2017 12:46:18 -0400
Content-Disposition: inline
In-Reply-To: <20170906010415.26952-4-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Sep 06, 2017 at 10:04:15AM +0900, Jaechul Lee wrote:
> devm_gpiod_get is called with GPIOF_OUT_INIT_LOW but the function doesn't
> allow the parameters. Unluckily, GPIOF_OUT_INIT_LOW is same value as
> GPIOD_ASIS and gpio direction isn't set properly.
> 
> Muted stream comes up when I try recording some sounds on TM2. mic-bias
> gpiod state can't be changed because the gpiod is created with the invalid
> parameter. The gpio should be set GPIOD_OUT_HIGH.
> 
> Fixes: 1bfbc260a5b4 ("ASoC: samsung: Add machine driver for Exynos5433 based TM2 board")
> Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
