From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] video: fbdev: exynos: Remove old non-working MIPI driver
Date: Thu, 01 Sep 2016 13:44:35 +0200
Message-ID: <176ff6ca-5e1e-1d7e-bfb6-7e0b9da44179@kernel.org>
References: <1472729876-9218-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26221 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754928AbcIALpN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 07:45:13 -0400
In-reply-to: <1472729876-9218-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kukjin Kim <kgene@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 09/01/2016 01:37 PM, Krzysztof Kozlowski wrote:
> The old non-DRM Exynos MIPI driver does not support DeviceTree and
> requires board files.  Our platforms do not provide such so the driver
> is not usable since a long time ago.  All features provided by the
> driver (and associated s6e8ax0 panel driver) are already supported by
> newer DRM version so the old code can be removed.
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Donghwa Lee <dh09.lee@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Damn, I forgot to update top-fbdev Makefile. I will resend soon.

BR,
Krzysztof
