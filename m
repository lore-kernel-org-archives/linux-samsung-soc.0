From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Wed, 25 May 2011 10:54:34 -0700
Message-ID: <4DDD425A.1070202@samsung.com>
References: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:64490 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023Ab1EYRyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 13:54:40 -0400
Received: by pzk9 with SMTP id 9so3493742pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 10:54:40 -0700 (PDT)
In-Reply-To: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Angus Ainslie <angus.ainslie@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com

On 05/24/11 21:39, Angus Ainslie wrote:
> From: Giridhar Maruthy<giridhar.maruthy@linaro.org>
>
> Whenever I2S is selected, select MFD for WM8994 and I2C
> to avoid manual enabling of the codec and I2C.
>
> Signed-off-by: Giridhar Maruthy<giridhar.maruthy@linaro.org>
> Signed-off-by: Angus Ainslie<angus.ainslie@linaro.org>
> ---
>   sound/soc/samsung/Kconfig |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>

Hi Angus :)

Hmm...first of all, should add proper maintainers in Cc. In this case, 
Jassi, Liam, and Mark should be added in Cc. (Cc'ed them)

> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index a3fdfb6..a80eeb1 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -65,6 +65,9 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
>   	tristate "SoC I2S Audio support for WM8994 on SMDK"
>   	depends on SND_SOC_SAMSUNG&&  (MACH_SMDKV310 || MACH_SMDKC210)
>   	select SND_SOC_WM8994
> +	select MFD_SUPPORT
> +	select I2C_S3C2410
> +	select MFD_WM8994

I'm not sure about MFD configs, but if "select I2C_S3C2410" is required, 
it should be moved into regarding Kconfig of arch/arm, because it is 
related to dependency of ARCH. Maybe in this case, 
arch/arm/mach-exynos4/Kconfig?

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e849f67..30b716e 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,6 +12,7 @@ if ARCH_EXYNOS4
  config CPU_EXYNOS4210
         bool
         select S3C_PL330_DMA
+       select I2C_S3C2410
         help
           Enable EXYNOS4210 CPU support

>   	select SND_SAMSUNG_I2S
>   	help
>   		Say Y if you want to add support for SoC audio on the SMDKs.

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
