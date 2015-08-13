From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/5] Samsung driver updates for v4.3
Date: Thu, 13 Aug 2015 11:18:48 +0200
Message-ID: <20150813091848.GB30160@localhost>
References: <55C06A0A.6040407@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:34877 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbbHMJbP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 05:31:15 -0400
Received: by lahi9 with SMTP id i9so22797562lah.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2015 02:31:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C06A0A.6040407@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Tue, Aug 04, 2015 at 04:30:18PM +0900, Kukjin Kim wrote:
> Hi,
> 
> This branch is including to support generic cpufreq driver in
> mach-exynos dir. for exynos3250 and exynos5250 even the tag name is
> driver. Because it is depending on clk and cpufreq changes which acked
> by regarding maintainers, Mike and Viresh.
> 
> Please pull and if any problems, please kindly let me know.

This now needs to be respun too, apparantly, since it includes dt2.


-Olof
