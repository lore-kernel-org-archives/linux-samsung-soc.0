From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/5] ARM: EXYNOS: replace clock.c for other new EXYNOS
 SoCs
Date: Sat, 10 Mar 2012 09:22:27 -0800
Message-ID: <20120310172227.GA5972@quad.lixom.net>
References: <1331374749-23256-1-git-send-email-kgene.kim@samsung.com>
 <1331374749-23256-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39181 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab2CJRW0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 12:22:26 -0500
Received: by iagz16 with SMTP id z16so4070064iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 09:22:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1331374749-23256-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Sat, Mar 10, 2012 at 02:19:05AM -0800, Kukjin Kim wrote:
> This patch changes the name of clock.c to clock-exynos4.c for other
> EXYNOS series such as EXYNOS5. And since the header file of clock
> is used only in arch/arm/mach-exynos, moves it in the local directory.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks, much easier to review this way!

Ideally the whitespace cleanup could also be split up to a separate
patch that has _no_ contents changes besides whitespace, but this is OK
too since it's easy to see what's a change and not anyway.


-Olof
