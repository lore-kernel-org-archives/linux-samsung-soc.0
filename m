From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 7/7] ARM: exynos_defconfig: Enable MAX77802
Date: Wed, 10 Sep 2014 13:03:28 -0700
Message-ID: <CAD=FV=UL8gUO7bGk4vxZxuUuwZumzNZsR5+DVXafB6Z7Psc2kQ@mail.gmail.com>
References: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
	<1410344391-5675-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:60913 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752568AbaIJUD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 16:03:29 -0400
Received: by mail-vc0-f177.google.com with SMTP id la4so2579214vcb.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2014 13:03:28 -0700 (PDT)
In-Reply-To: <1410344391-5675-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Javier,

On Wed, Sep 10, 2014 at 3:19 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> From: Vivek Gautam <gautam.vivek@samsung.com>
>
> Enabled MAX77802 pmic for exynos systems.
> One config USB_ANNOUNCE_NEW_DEVICES to display device
> information on connect.
> Another config for I2C_CHARDEV to see i2c device nodes.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/configs/exynos_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

I've no complaints about any of that.

Reviewed-by: Doug Anderson <dianders@chromium.org>
