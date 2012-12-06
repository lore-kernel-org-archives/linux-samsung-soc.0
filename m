From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V4 0/2] Add DT support for i2s
Date: Thu, 6 Dec 2012 09:31:40 +0530
Message-ID: <CAAgF-Bc4t6WL4vswP6CFeSQrPZBmOuYfVt6_JoB1Za9TBX7mvA@mail.gmail.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:38315 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549Ab2LFEBm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Dec 2012 23:01:42 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so4936813lag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Dec 2012 20:01:41 -0800 (PST)
In-Reply-To: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

Hi Mark,

On Wed, Nov 28, 2012 at 4:17 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> V4 patches are based on Mark Brown's for-next branch of
> "git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git"
>
> Changes since V3:
>         - Added syntex of gpio specifier as suggested by Mark Brown in
>           DT document file
>         - Added the requirement for having I2S alias ids
>         - Explained about gpio lines
>         - Made a seperate patch to get the I2S rclk src clk from alias ID
>
> Changes since V2:
>         - Rebased on 3.7-rc3
>         - Custom DT bindings are prefixed with samsung
>         - As generic device tree DMA helpers not yet mainlined
>           I am still using custom dma bindings. So added a
>           priliminary statement regarding the same. I will rework
>           on my patch once generic DMA helpers are mainlined.
>
> Chnages since V1:
>         - Rebased on 3.6-rc6
>
> Padmavathi Venna (2):
>   ASoC: Samsung: Get I2S src_clk from clock alias id.
>   ASoC: SAMSUNG: Add DT support for i2s

Any comments on DT support for i2s patch?  If not when this patch can be pulled?

>
>  .../devicetree/bindings/sound/samsung-i2s.txt      |   78 +++++++
>  include/linux/platform_data/asoc-s3c.h             |    6 -
>  sound/soc/samsung/dma.c                            |    1 +
>  sound/soc/samsung/dma.h                            |    1 +
>  sound/soc/samsung/i2s.c                            |  238 +++++++++++++++----
>  5 files changed, 268 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>
> --
> 1.7.4.4
>

Thanks
Padma
