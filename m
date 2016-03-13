From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/2] ARM64: EXYNOS: mach/soc changes for v4.6, 2nd
Date: Sat, 12 Mar 2016 17:14:45 -0800
Message-ID: <20160313011445.GK17502@localhost>
References: <1456445103-23314-1-git-send-email-k.kozlowski@samsung.com>
 <1456445103-23314-2-git-send-email-k.kozlowski@samsung.com>
 <56CF97C2.5000305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34101 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914AbcCMCIJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Mar 2016 21:08:09 -0500
Received: by mail-pa0-f50.google.com with SMTP id fe3so113320271pab.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Mar 2016 18:08:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56CF97C2.5000305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>

On Fri, Feb 26, 2016 at 09:09:38AM +0900, Krzysztof Kozlowski wrote:
> On 26.02.2016 09:05, Krzysztof Kozlowski wrote:
> > Hi Arnd, Kevin and Olof,
> > 
> > 
> > Pull request for v4.6 with ARM64 mach/soc changes.
> > 
> > This depends on change in clk tree (removal of ARCH_EXYNOS7) which is
> > pulled here.
> > 
> > 
> > Kind regards,
> > Krzysztof
> > 
> > 
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > 
> > 
> > 
> > The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:
> > 
> >   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.6-2
> > 
> > for you to fetch changes up to c87b3e970c70d5e27f9eb9acd09c6b5b9d589860:
> > 
> >   arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS (2016-02-23 08:49:46 +0900)
> 
> And for easier grepping through history, below is the pull request
> for Exynos-specific change (no clk commits):
> 
> 
> The following changes since commit 85997a7cba7bc1578eb554e88f82023d85fb499a:
> 
>   clk: samsung: Don't build ARMv8 clock drivers on ARMv7 (2016-02-22 10:20:24 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.6-2
> 
> for you to fetch changes up to c87b3e970c70d5e27f9eb9acd09c6b5b9d589860:
> 
>   arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS (2016-02-23 08:49:46 +0900)

Excellent, thanks! Merged into next/arm64.


-Olof
