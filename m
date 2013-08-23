From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks
 from device tree
Date: Fri, 23 Aug 2013 20:12:05 +0200
Message-ID: <CACRpkdZEJTCx4RwNCdLfYNDQauO32iMJwJP0eZevTfyV0S-TwQ@mail.gmail.com>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com>
	<1377120111-25601-2-git-send-email-tomasz.figa@gmail.com>
	<1500724.07LRpFtgcx@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:46327 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754761Ab3HWSMG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 14:12:06 -0400
Received: by mail-ob0-f169.google.com with SMTP id wc20so1011194obb.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2013 11:12:05 -0700 (PDT)
In-Reply-To: <1500724.07LRpFtgcx@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>

On Fri, Aug 23, 2013 at 1:22 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This patch extends vic_of_init to parse valid interrupt sources
> and resume sources masks from device tree.
>
> If mask values are not specified in device tree, all sources
> are assumed to be valid, as before this patch.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/vic.txt | 6 ++++++
>  drivers/irqchip/irq-vic.c                     | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> Changes since v7:
>  - Renamed interrupt-mask property to valid-mask, for consistency with
>    bindings of other interrupt controllers.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
