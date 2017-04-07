From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 03/12] ARM: EXYNOS: remove secondary startup
 initialization from smp_prepare_cpus
Date: Fri, 7 Apr 2017 10:31:21 +0200
Message-ID: <CAJKOXPcyvVmsAvBUhqxV=WuFKjqKCqcidTFQ5mTtUFDAfmpcrg@mail.gmail.com>
References: <CGME20170330131424epcas5p4fccfab06e5d77d70d09c3835c3332ee5@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755901AbdDGIbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 04:31:31 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id A938F202F2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 08:31:23 +0000 (UTC)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com [209.85.223.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26E4B202BE
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 08:31:22 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b140so45418412iof.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 01:31:22 -0700 (PDT)
In-Reply-To: <1490879826-16754-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> We are taking care of setting secondary cpu boot address in
> exynos_boot_secondary just before sending ipi to secondary CPUs,
> so we can safely remove this setting from smp_prepare_cpus.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
>

I also wondered why we need this twice... Testing on different
platforms would be nice to be sure that we did not miss anything but
it looks correct for me. For my reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
