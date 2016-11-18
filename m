From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/5] Fixes for Exynos5433 TM2 board
Date: Fri, 18 Nov 2016 13:39:04 +0200
Message-ID: <20161118113904.GA5457@kozik-lap>
References: <CGME20161117085810eucas1p20d425d73d1c1e0de96d2995b96968de7@eucas1p2.samsung.com>
 <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35955 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbcKRLjZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 06:39:25 -0500
Received: by mail-wm0-f65.google.com with SMTP id m203so5249032wma.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Nov 2016 03:39:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Nov 17, 2016 at 09:57:56AM +0100, Marek Szyprowski wrote:
> Hi!
> 
> This is a collection of various fixes (mainly related to clocks
> configuration) for Exynos 5433 based TM2 board dts. I'm really sorry
> that I missed those issues in the initial board submission, but
> most of those issue were detected while testing improved clocks driver.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Changelog:
> v2:
> - added missing assigned DRD/HOST usb clocks
> - collected tags
> - rearanged nodes in alphabetical order
> 
> Patch summary:

Applied series, thanks!

Best regards,
Krzysztof
