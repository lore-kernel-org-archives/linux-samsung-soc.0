From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: DTS: Exynos: convert to generic power domain bindings
Date: Mon, 12 Jan 2015 17:50:20 +0100
Message-ID: <CABxcv==zC2Sjp+ezO9HBgynbbEqDrv94VO85LPkv02Ok0LUD_Q@mail.gmail.com>
References: <1420191389-1409-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:59259 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973AbbALQuW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 11:50:22 -0500
Received: by mail-we0-f173.google.com with SMTP id q58so20155146wes.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2015 08:50:21 -0800 (PST)
In-Reply-To: <1420191389-1409-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@kernel.org>

Hello Marek,

On Fri, Jan 2, 2015 at 10:36 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch replaces all custom samsung,power-domain device tree properties
> with generic power domain bindings and updates documentation Samsung's devices
> refering to old binding.
>
> Suggested-by: Kevin Hilman <khilman@kernel.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

It looks to me like a very nice cleanup.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

and on an Exynos5800 Peach Pi Chromebook:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
