From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Correct clocks for Exynos4 I2S
 module
Date: Wed, 28 Dec 2016 19:26:03 +0200
Message-ID: <20161228172603.wbkdszky2ktasfbf@kozik-lap>
References: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
 <20161209142919.GB10080@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36710 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbcL1R0J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 12:26:09 -0500
Received: by mail-lf0-f66.google.com with SMTP id t196so13746866lff.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2016 09:26:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161209142919.GB10080@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Dec 09, 2016 at 04:29:19PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Dec 09, 2016 at 08:22:10AM +0100, Marek Szyprowski wrote:
> > "iis", "i2s_opclk0" and "i2s_opclk1" are standard clocks for Exynos4 I2S
> > hardware module, so they should be defined in .dtsi file not in the random
> > board .dts file.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > Changelog:
> > v2:
> > - added changes for exynos4412-itop-elite board
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi                  | 6 ++++--
> >  arch/arm/boot/dts/exynos4412-itop-elite.dts     | 4 ----
> >  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
> >  3 files changed, 4 insertions(+), 10 deletions(-)

Thanks, applied.

Best regards,
Krzysztof
