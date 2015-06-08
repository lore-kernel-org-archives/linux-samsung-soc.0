From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCHv2 1/2] ARM: exynos_defconfig: Enable
 CONFIG_SND_SOC_ODROIDX2 for Odroid-XU3
Date: Mon, 08 Jun 2015 17:10:37 +0200
Message-ID: <20150608171037.70ca6796@amdc2363>
References: <1433696621-4763-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36629 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbbFHPKz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 11:10:55 -0400
In-reply-to: <1433696621-4763-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Anand,

> Enable CONFIG_SND_SOC_ODROIDX2 and CONFIG_SND_SIMPLE_CARD to enable
> sound on Odroid-XU3 board.
> 
> Below is the output of boot log.
> [    6.021550] max98090 5-0010: MAX98090 REVID=0x43
> [    6.025506] random: nonblocking pool is initialized
> [    6.047297] asoc-simple-card sound: HiFi <-> 3830000.i2s mapping ok
> [    6.068392] s5m-rtc s2mps14-rtc: setting system clock to
> 2015-06-07 12:51:06 UTC (1433681466) [    6.123650] ALSA device list:
> [    6.135203]   #0: Odroid-XU3
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig
> b/arch/arm/configs/exynos_defconfig index 9504e77..1b7253b 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -144,6 +144,8 @@ CONFIG_SND=y
>  CONFIG_SND_SOC=y
>  CONFIG_SND_SOC_SAMSUNG=y
>  CONFIG_SND_SOC_SNOW=y
> +CONFIG_SND_SOC_ODROIDX2=y
> +CONFIG_SND_SIMPLE_CARD=y
>  CONFIG_USB=y
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_XHCI_HCD=y

Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>

-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
