From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 1/1] ARM: exynos_defconfig: Enable options for display
 panel support
Date: Sat, 08 Nov 2014 18:46:43 +0900
Message-ID: <000d01cffb38$e90e42c0$bb2ac840$@kernel.org>
References: <1408956336-17376-1-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv=m-aNVcUU2C8LosCECxq1yZo2C3zfA2xe6z7jF8tFPsnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28443 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753444AbaKHJqt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 04:46:49 -0500
In-reply-to: <CABxcv=m-aNVcUU2C8LosCECxq1yZo2C3zfA2xe6z7jF8tFPsnw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>
Cc: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Linux Kernel' <linux-kernel@vger.kernel.org>

Javier Martinez Canillas wrote:
> 
> Hello Kukjin,
> 
Hi,

> On Mon, Aug 25, 2014 at 10:45 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
> > Many Exynos devices have a display panel. Most of them just have
> > a simple panel while others have more complex configurations that
> > requires an embedded DisplayPort (eDP) to LVDS bridges.
> >
> > This patch enables the following features to be built in the kernel
> > image to suport both setups:
> >
> > - Direct Rendering Manager (DRM)
> > - DRM bridge registration and lookup framework
> > - Parade ps8622/ps8625 eDP/LVDS bridge
> > - NXP ptn3460 eDP/LVDS bridge
> > - Exynos Fully Interactive Mobile Display controller (FIMD)
> > - Panel registration and lookup framework
> > - Simple panels
> > - Backlight & LCD device support
> >
> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> > Tested-by: Kevin Hilman <khilman@linaro.org>
> > ---
> 
> This patch is needed to have display working on many Exynos boards.
> 
OK, I'll apply this into samsung tree in this weekend.

Thanks for your gentle reminder.

- Kukjin

> $subject enables the config option for the ps8622/ps8625 eDP/LVDS
> bridge driver but this has not landed in mainline yet. Ajay will
> re-spin a new revision of his series that adds this driver though,
> after addressing some issues pointed out on a previous version.
> 
> The Kconfig symbol name (DRM_PS8622) won't change though so maybe is
> not crazy to pick the patch as is since CONFIG_DRM_PS8622 will have to
> be enabled later when the bridge driver lands. Or do you want me to
> re-spin $subject removing that option?
> 
> Best regards,
> Javier
