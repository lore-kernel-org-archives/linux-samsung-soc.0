From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 6/7] ARM: dts: Set i2c7 clock at 400kHz for Peach boards
Date: Wed, 10 Sep 2014 13:02:02 -0700
Message-ID: <CAD=FV=Wb+0gQ7xLzxoXz_7gxEK01oX3fm8wcBwqM2tzUvQ8h-g@mail.gmail.com>
References: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
	<1410344391-5675-7-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:45952 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044AbaIJUCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 16:02:03 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so19330294vcb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2014 13:02:02 -0700 (PDT)
In-Reply-To: <1410344391-5675-7-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>

Javier,

On Wed, Sep 10, 2014 at 3:19 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The downstream ChromeOS 3.8 kernel sets the clock frequency
> for the I2C bus 7 at 400kHz. Do the same change in mainline.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
