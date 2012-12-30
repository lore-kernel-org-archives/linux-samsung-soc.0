From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 00/12] clk: exynos4: migrate to common clock framework
Date: Sat, 29 Dec 2012 21:29:53 -0800
Message-ID: <20121230052953.GB20903@quad.lixom.net>
References: <1356827621-27617-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:35408 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714Ab2L3F3r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Dec 2012 00:29:47 -0500
Received: by mail-pb0-f54.google.com with SMTP id wz12so6560811pbc.27
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Dec 2012 21:29:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1356827621-27617-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

On Sat, Dec 29, 2012 at 04:33:29PM -0800, Thomas Abraham wrote:
> Changes since v4:
> - Rebased to linux-3.8-rc1.
> 
> Changes since v3:
> - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch series migrates the Samsung Exynos4 SoC clock code to adopt the
> common clock framework. The use of Samsung specific clock structures has
> been removed and all board support code has been updated. imx-style of
> clock registration and lookup has been adopted for device tree based
> exynos4 platforms.

I'd prefer to see if exynos4 and 5 were kept common here, and both transitioned
at the same time. Especially since there are no legacy boards for exynos5, it
would mean you could have a very clean transition there. What's the plan to
follow up with 5?

What are the plans to remove legacy board files on exynos4 at this time
and switch them to DT-only? You could do it gradually like Stephen Warren
did on Tegra, with hooks that call out to some of the legacy code, but
configure the board through device tree and do away with the classic
machine descriptors, etc.



-Olof
