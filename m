From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/3 RESEND] ARM: dts: exynos: Move audio clocks
 configuration to odroidxu3-audio.dtsi
Date: Fri, 29 Sep 2017 14:54:02 +0200
Message-ID: <febf5d73-4d31-cac0-54e3-b0d61768fdeb@samsung.com>
References: <1506684783-9722-2-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929123353eucas1p164a4d125cf71345f98dc27d5eb8d1e3d@eucas1p1.samsung.com>
        <1506688405-12624-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58505 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdI2MyI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 08:54:08 -0400
In-reply-to: <1506688405-12624-1-git-send-email-m.szyprowski@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/29/2017 02:33 PM, Marek Szyprowski wrote:
> Audio subsystem clocks configuration is a part of audio block,
> so there it should be moved to exynos5422-odroidxu3-audio.dtsi
> to avoid it on Odroid XU4, which has no audio codec.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
