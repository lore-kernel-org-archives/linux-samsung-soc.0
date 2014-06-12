From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3 v4] spi: s3c64xx: for DT platofrms always get the
 chipselect info from DT node
Date: Thu, 12 Jun 2014 16:26:55 -0700
Message-ID: <CAD=FV=VoNbe_Hrr0tNTyQGyYcaUopAwzWAqMQG8HX+xcyVzD0A@mail.gmail.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
	<1402578821-27338-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:59646 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619AbaFLX04 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 19:26:56 -0400
Received: by mail-ve0-f178.google.com with SMTP id oy12so637997veb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2014 16:26:55 -0700 (PDT)
In-Reply-To: <1402578821-27338-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>

Naveen,

On Thu, Jun 12, 2014 at 6:13 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Use controller_data structure only for the Non Device tree  platforms.
> For Device tree platforms, always derive the chipselect info from
> DT node.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

I'm not planning to do an in-depth review of this patch since it seems
that others are on top of it, but I've tested it.  With it (and some
patches that haven't been sent up yet) I can talk to the EC on
exynos5420-pit (which uses device tree for specifying the cs-gpios)

Tested-by: Doug Anderson <dianders@chromium.org>
