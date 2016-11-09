From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Remove unused soc_is_exynos{4,5}
Date: Wed, 9 Nov 2016 22:04:32 +0200
Message-ID: <20161109200432.GB23534@kozik-lap>
References: <1478693755-11953-1-git-send-email-pankaj.dubey@samsung.com>
 <1478693755-11953-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34927 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKIUEm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 15:04:42 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so20670888wme.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2016 12:04:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1478693755-11953-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

On Wed, Nov 09, 2016 at 05:45:55PM +0530, Pankaj Dubey wrote:
> As no more user of soc_is_exynos{4,5} we can safely remove them.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h | 5 -----
>  1 file changed, 5 deletions(-)
>

Thanks, applied.

Best regards,
Krzysztof
