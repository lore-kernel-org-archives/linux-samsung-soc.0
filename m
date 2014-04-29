From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC v3 PATCH 08/16] drm/exynos: fimd: support I80 interface
Date: Tue, 29 Apr 2014 21:05:09 +0530
Message-ID: <CAK9yfHwAqguttVZRD5BymBhS9LRpnCJoVp6JZm76XjVrkEDygQ@mail.gmail.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
	<1398563412-21781-9-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:53657 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbaD2PfK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 11:35:10 -0400
Received: by mail-oa0-f50.google.com with SMTP id i11so427847oag.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2014 08:35:10 -0700 (PDT)
In-Reply-To: <1398563412-21781-9-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi YoungJun,

On 27 April 2014 07:20, YoungJun Cho <yj44.cho@samsung.com> wrote:
> To support MIPI DSI command mode interface, FIMD should do followings:
> - Sets LCD block configuration for I80 interface.
> - Uses "lcd_sys" as an IRQ resource and sets relevant IRQ configuration.
> - Implements trigger feature which transfers image date if there is
>   page flip request, and implements TE handler to call trigger function.
> - Sets CPU mode timings configuration.
> - Sets ideal(pixel) clock is 2 times faster than the original one to
>   generate frame done IRQ prior to the next TE signal.

<...>
> +
> +       reg = readl(timing_base + TRIGCON);
> +       reg |= 1 << 0 | 1 << 1;

What does this signify? Can't this be OR'd directly with 3?

-- 
With warm regards,
Sachin
