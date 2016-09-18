From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: make audio interface/controller explicitly
Date: Sun, 18 Sep 2016 16:42:47 +0200
Message-ID: <20160918144247.GA11009@kozik-book>
References: <1474207751-9804-1-git-send-email-ayaka@soulik.info>
 <1474207751-9804-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33508 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935524AbcIROmw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Sep 2016 10:42:52 -0400
Content-Disposition: inline
In-Reply-To: <1474207751-9804-2-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 18, 2016 at 10:09:11PM +0800, Randy Li wrote:
> It is simple sound card time, we could assign different codec
> to a interface without making a specific driver for it.

The description does not convince me and I do not see an example using
this. Could you provide one?

Best regards,
Krzysztof


> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  sound/soc/samsung/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index 7b722b0..b7b3a38 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -18,18 +18,18 @@ config SND_S3C2412_SOC_I2S
>  	select SND_S3C_I2SV2_SOC
>  
>  config SND_SAMSUNG_PCM
> -	tristate
> +	tristate "Samsung PCM interface support"
>  
>  config SND_SAMSUNG_AC97
> -	tristate
> +	tristate "Samsung AC97 controller support"
>  	select SND_SOC_AC97_BUS
>  
>  config SND_SAMSUNG_SPDIF
> -	tristate
> +	tristate "Samsung SPDIF transmitter support"
>  	select SND_SOC_SPDIF
>  
>  config SND_SAMSUNG_I2S
> -	tristate
> +	tristate "Samsung I2S interface support"
>  
>  config SND_SOC_SAMSUNG_NEO1973_WM8753
>  	tristate "Audio support for Openmoko Neo1973 Smartphones (GTA02)"
> -- 
> 2.7.4
> 
