From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: EXYNOS: fix typo in static struct name "exynos5_list_diable_wfi_wfe"
Date: Tue, 11 Nov 2014 10:44:45 +0100
Message-ID: <CABxcv=nJ7-NoF-0EqCL=rk6hX2688iV98g=CiDADKT7QTNWBrw@mail.gmail.com>
References: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:63753 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbaKKJor (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 04:44:47 -0500
Received: by mail-wg0-f51.google.com with SMTP id l18so11395817wgh.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2014 01:44:45 -0800 (PST)
In-Reply-To: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, thomas.ab@samsung.com

Hello Pankaj, Kukjin,

On Tue, Oct 28, 2014 at 10:50 AM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> This patch fixes a typo in struct named as "exynos5_list_diable_wfi_wfe"
> by making it "exynos5_list_disable_wfi_wfe" which is more meaningful.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

After this patch, "[PATCH v9 1/2] ARM: EXYNOS: Add platform driver
support for Exynos PMU" [0] does not apply cleanly anymore.

Pankaj,

Are you planning to rebase and re-post that patch?

Kukjin,

It would be great if you can pick all the pending Exynos5420 S2R
patches to avoid these kind of conflicts.

Thanks a lot and best regards,
Javier

[0]: https://lkml.org/lkml/2014/10/6/90
