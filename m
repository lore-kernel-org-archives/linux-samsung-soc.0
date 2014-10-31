From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 1/1] ARM: exynos_defconfig: Enable options for display
 panel support
Date: Sat, 1 Nov 2014 00:42:11 +0100
Message-ID: <CABxcv=m-aNVcUU2C8LosCECxq1yZo2C3zfA2xe6z7jF8tFPsnw@mail.gmail.com>
References: <1408956336-17376-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:45489 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753399AbaJaXmM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 19:42:12 -0400
Received: by mail-wi0-f174.google.com with SMTP id d1so2550837wiv.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 16:42:11 -0700 (PDT)
In-Reply-To: <1408956336-17376-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Kukjin,

On Mon, Aug 25, 2014 at 10:45 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Many Exynos devices have a display panel. Most of them just have
> a simple panel while others have more complex configurations that
> requires an embedded DisplayPort (eDP) to LVDS bridges.
>
> This patch enables the following features to be built in the kernel
> image to suport both setups:
>
> - Direct Rendering Manager (DRM)
> - DRM bridge registration and lookup framework
> - Parade ps8622/ps8625 eDP/LVDS bridge
> - NXP ptn3460 eDP/LVDS bridge
> - Exynos Fully Interactive Mobile Display controller (FIMD)
> - Panel registration and lookup framework
> - Simple panels
> - Backlight & LCD device support
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> ---

This patch is needed to have display working on many Exynos boards.

$subject enables the config option for the ps8622/ps8625 eDP/LVDS
bridge driver but this has not landed in mainline yet. Ajay will
re-spin a new revision of his series that adds this driver though,
after addressing some issues pointed out on a previous version.

The Kconfig symbol name (DRM_PS8622) won't change though so maybe is
not crazy to pick the patch as is since CONFIG_DRM_PS8622 will have to
be enabled later when the bridge driver lands. Or do you want me to
re-spin $subject removing that option?

Best regards,
Javier
