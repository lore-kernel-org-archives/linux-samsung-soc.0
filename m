From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 07/12] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
Date: Tue, 13 Mar 2012 20:42:46 -0700
Message-ID: <CAOesGMgEg3Pem4ZMCEp341MxSrW7uajZ0wB1YWgQM-k=KSdiXA@mail.gmail.com>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
	<1331652643-12626-8-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:56690 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841Ab2CNDmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 23:42:47 -0400
Received: by gghe5 with SMTP id e5so1365262ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 20:42:46 -0700 (PDT)
In-Reply-To: <1331652643-12626-8-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de

Hi

On Tue, Mar 13, 2012 at 8:30 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> ARM: EXYNOS: irqs.h for exynos4 and exynos5 - WIP
> This patch adds the interrupt definitions for EXYNOS5250 at
> <mach/irqs.h> file. Basically, now it is needed for EXYNOS5250
> interrupt and will be updated for single zImage next time.

Nit for when you stage the branch: Update the commit message a bit, I think?


-Olof
