Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EF4C3F2D7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 17:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C77212146E
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 17:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=anholt-net.20150623.gappssmtp.com header.i=@anholt-net.20150623.gappssmtp.com header.b="QdJpsICt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgCERDZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 12:03:25 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39408 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgCERDZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 12:03:25 -0500
Received: by mail-lf1-f68.google.com with SMTP id j15so2064419lfk.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2020 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
        b=QdJpsICtDG2FI/4Z9M6lKYAcG0BpjpbXK8rLQyA4OEixlsxjDiGx3To1lir1sBp1M9
         UwuoRwaVCnVgUPq4inbZJ3TxCkxCrFEJn1E6DTKoLoG9iHe+E01qy4ui4vtj9Q36JSXp
         ZqI3vZjzXINJNR2WZQYS26NJieBM4iEKc5bwAVwHReucih3l3k93tS1OUlLleRX0o1y1
         KtuaE/jXH3s5Pdf2YA/jnZsd2GI9LGTK5wvLZgDIrxGSZbyinFeR134NKThtgyXxUoJU
         f3VfKoFSVmnBne9A3FTkdC4acYw5/x1ZZwLrZ04c0wXHMYb/1RofGGRyRmlBqM+aIrD4
         1aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
        b=KXR6ybG/IlKl1zkikZu0NAIfcc7OiZRoHauaTz9dmFUE8alBgRTZPqMvaHwRmXXcVT
         3Y6QtfeEHJh4niEbn+QCeoE1b2aaXbOdkziMvOtS2zjiHXIu7QyjF4FeQEEQYOm0M+Br
         4eikpPAvp6wZ9KIqWSWwNX9XIBTtIVkXe8y3ycZ/PXyS0Tz0m+LasjhYkjuSJPKxVeNh
         61KFDOUbLpGkkpfI7W7fagNWurPsCCoHrQHchumui/KBkPCTbvOxhMMhu2tubK66M22/
         CNgfXVG3YLyQNPqNZLbM+Qn4rCjHuxJax7RMny09CvBt9uovIIjzJNV7Oa3jdeWHoezU
         QLrw==
X-Gm-Message-State: ANhLgQ1E29tniZ4rKIJUIpFQLKg1s15v3DouUdUz9a3gktlO2cAmdaLj
        RCY+Z+Hk22X+kfD1nsYllJDY12eiEAHb8+ubwl29MA==
X-Google-Smtp-Source: ADFU+vtj5gp1/LY+e6ph9lZLVyP4h9/sF6S8jMp7MXl11AHO2LcgdwYrHVm+Ah8nGom52hUhqSxPo5r0KmpWtLmClCc=
X-Received: by 2002:a05:6512:692:: with SMTP id t18mr6077856lfe.212.1583427801701;
 Thu, 05 Mar 2020 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200305155950.2705-1-tzimmermann@suse.de> <20200305155950.2705-19-tzimmermann@suse.de>
In-Reply-To: <20200305155950.2705-19-tzimmermann@suse.de>
From:   Eric Anholt <eric@anholt.net>
Date:   Thu, 5 Mar 2020 09:03:10 -0800
Message-ID: <CADaigPXaBRx+DG8TP-BPFycqwzmf-2NMQX6cXQP69MTVE6CzAw@mail.gmail.com>
Subject: Re: [PATCH 18/22] drm/vc4: Use simple encoder
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        sam@ravnborg.org, abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, kraxel@redhat.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        sebastian.reichel@collabora.com,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 5, 2020 at 8:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The vc4 driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

Acked-by: Eric Anholt <eric@anholt.net>
