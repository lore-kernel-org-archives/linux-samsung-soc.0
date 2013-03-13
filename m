From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ASoC: samsung: remove last traces of neo1973-gta01
Date: Wed, 13 Mar 2013 14:10:37 +0900
Message-ID: <093301ce1fa9$19903ba0$4cb0b2e0$%kim@samsung.com>
References: <1363126175.3137.160.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34047 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383Ab3CMFKs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 01:10:48 -0400
In-reply-to: <1363126175.3137.160.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Liam Girdwood' <lgirdwood@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Jaroslav Kysela' <perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Paul Bolle wrote:
> 
> The (rudimentary) support for the Openmoko Neo1973 GTA01 got removed in
> commit 1ae5cbc52e7c6619a3f44b87809fd25370df31bb ("ASoC: neo1973_wm8753:
> remove references to the neo1973-gta01 machine"). Remove its last traces
> in the Kconfig file too.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

- Kukjin

> ---
> Untested.
> 
>  sound/soc/samsung/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index 90e7e66..475fb0d 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -35,11 +35,10 @@ config SND_SAMSUNG_I2S
>  	tristate
> 
>  config SND_SOC_SAMSUNG_NEO1973_WM8753
> -	tristate "Audio support for Openmoko Neo1973 Smartphones (GTA01/GTA02)"
> -	depends on SND_SOC_SAMSUNG && (MACH_NEO1973_GTA01 || MACH_NEO1973_GTA02)
> +	tristate "Audio support for Openmoko Neo1973 Smartphones (GTA02)"
> +	depends on SND_SOC_SAMSUNG && MACH_NEO1973_GTA02
>  	select SND_S3C24XX_I2S
>  	select SND_SOC_WM8753
> -	select SND_SOC_LM4857 if MACH_NEO1973_GTA01
>  	select SND_SOC_DFBMCS320
>  	help
>  	  Say Y here to enable audio support for the Openmoko Neo1973
> --
> 1.7.11.7
