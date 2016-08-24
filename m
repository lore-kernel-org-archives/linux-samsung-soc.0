From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: Remove unused DMC offset and its mapping
Date: Wed, 24 Aug 2016 06:58:52 +0200
Message-ID: <20160824045852.GA13990@kozik-book>
References: <1471931416-15991-1-git-send-email-pankaj.dubey@samsung.com>
 <20160824044329.GA8407@kozik-book>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33965 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbcHXE7X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 00:59:23 -0400
Received: by mail-wm0-f66.google.com with SMTP id q128so945449wma.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2016 21:58:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160824044329.GA8407@kozik-book>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, k.kozlowski@samsung.com, kgene@kernel.org

On Wed, Aug 24, 2016 at 06:43:29AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 23, 2016 at 11:20:16AM +0530, Pankaj Dubey wrote:
> > Currently there is no user of DMC SFR offsets, so we can safely remove
> > mapping of its SFR address space and cleanup related offset macros from
> > mach-exynos.
> > 
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/exynos.c                | 10 ----------
> >  arch/arm/mach-exynos/include/mach/map.h      |  3 ---
> >  arch/arm/plat-samsung/include/plat/map-s5p.h |  3 ---
> >  3 files changed, 16 deletions(-)
> >
> 
> Thanks, applied.

I mean, v2, applied.

BR,
Krzysztof
