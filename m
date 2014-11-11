From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: EXYNOS: fix typo in static struct name "exynos5_list_diable_wfi_wfe"
Date: Tue, 11 Nov 2014 10:54:30 +0100
Message-ID: <CABxcv==Hjfi+-Mt63YQaCtC3Wj12WFfU6biwmiVEFQvqAp3DBA@mail.gmail.com>
References: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
	<CABxcv=nJ7-NoF-0EqCL=rk6hX2688iV98g=CiDADKT7QTNWBrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:42535 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794AbaKKJyc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 04:54:32 -0500
Received: by mail-wg0-f46.google.com with SMTP id x13so11352928wgg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2014 01:54:30 -0800 (PST)
In-Reply-To: <CABxcv=nJ7-NoF-0EqCL=rk6hX2688iV98g=CiDADKT7QTNWBrw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, thomas.ab@samsung.com

Hello Kukjin,

>
> After this patch, "[PATCH v9 1/2] ARM: EXYNOS: Add platform driver
> support for Exynos PMU" [0] does not apply cleanly anymore.
>

I see that you already picked all the Exynos S2R patches on your
v3.19-next/mach-exynos branch and also resolved that conflict.

Is just that this branch was not merged in your for-next branch and
that's why I didn't see the patches in linux-next.

Sorry for the noise.

Best regards,
Javier
