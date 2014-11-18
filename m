From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 2/2] ARM: dts: Add missing irq pinctrl for max77686 on smdk5250
Date: Tue, 18 Nov 2014 15:02:40 +0100
Message-ID: <CABxcv=moHWKCPsmOkk5w=L8EZeke+8TzPkW+vERKWBc5qRNb=g@mail.gmail.com>
References: <1416312509-11530-1-git-send-email-yadi.brar@samsung.com>
	<1416312509-11530-2-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37040 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753576AbaKROCl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 09:02:41 -0500
Received: by mail-wi0-f179.google.com with SMTP id ex7so12657690wid.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 06:02:40 -0800 (PST)
In-Reply-To: <1416312509-11530-2-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

Hello Yadwinder,

On Tue, Nov 18, 2014 at 1:08 PM, Yadwinder Singh Brar
<yadi.brar@samsung.com> wrote:
> This patch adds pinctrl configuration for using configuring gpx3-2 as an
> external interrupt from max77686. Though max77686 RTC is enabled and gets
> probed by default, it doesnt work as its unable to get interrupt.
>

I'm not familiar with this board but the patch looks good to me
assuming the IRQ is the correct one.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
