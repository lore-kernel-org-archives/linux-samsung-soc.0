From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 RESEND 9/9] drm/exynos: add support for 'hdmi' clock
Date: Thu, 22 Jan 2015 14:11:22 +0100
Message-ID: <54C0F6FA.1020101@collabora.co.uk>
References: <54BE4F8E.50605@collabora.co.uk> <1421929686-19709-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:35653 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752626AbbAVNL1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 08:11:27 -0500
In-Reply-To: <1421929686-19709-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Hello Marek,

On 01/22/2015 01:28 PM, Marek Szyprowski wrote:
> Mixed need to have hdmi clock enabled to properly perform power on/off
> sequences, so add handling of this clock directly to the mixer driver.
> Dependency between hdmi clock and mixer module has been observed on
> Exynos4 based boards.
> 
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

The patch looks good to me and I tested that it does not regress HDMI on
other platforms (Exynos5420 Peach Pit). I've just a comment below.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

>  Documentation/devicetree/bindings/video/exynos_mixer.txt | 1 +
>  drivers/gpu/drm/exynos/exynos_mixer.c                    | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> index 08b394b..3e38128 100644
> --- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	a) mixer: Gate of Mixer IP bus clock.
>  	b) sclk_hdmi: HDMI Special clock, one of the two possible inputs of
>                 mixer mux.
> +	c) hdmi: Gate of HDMI IP bus clock, needed together with sclk_hdmi.
>

You are adding as a required property which means that this breaks DT backward
compatibility. I guess is not a big issue here since HDMI seems to have been
broken in mainline on most Exynos platforms anyways.

Best regards,
Javier
