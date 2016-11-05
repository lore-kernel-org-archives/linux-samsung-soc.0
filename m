From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
Date: Sat, 5 Nov 2016 17:41:19 +0200
Message-ID: <20161105154119.GA8183@kozik-lap>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
 <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34969 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755265AbcKEPlZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Nov 2016 11:41:25 -0400
Received: by mail-wm0-f65.google.com with SMTP id 68so8560043wmz.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Nov 2016 08:41:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

On Fri, Nov 04, 2016 at 09:09:21AM +0530, Pankaj Dubey wrote:
> We can safely remove exynos_smp_init_cpus() hook from mach-exynos/platsmp.c,
> as all SMP platforms in mach-exynos can rely on DT for CPU core description
> instead of determining number of cores from the SCU.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
>


Thanks, applied. Somehow your patchset did not reach linux-samsung-soc's
Parchwork. I don't have a clue why... It is on linux-arm-kernel's
Patchwork.

Best regards,
Krzysztof
