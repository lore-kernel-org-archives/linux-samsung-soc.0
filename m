From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3] 2nd Round Samsung DT for v3.12
Date: Thu, 29 Aug 2013 13:27:26 -0700
Message-ID: <20130829202726.GQ18542@quad.lixom.net>
References: <1f7601cea1f1$3f2913d0$bd7b3b70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:45540 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751659Ab3H2U2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 16:28:05 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc17so931164pbc.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2013 13:28:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1f7601cea1f1$3f2913d0$bd7b3b70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

On Mon, Aug 26, 2013 at 09:14:35AM +0900, Kukjin Kim wrote:
> The following changes since commit 6f9d02a056fff8e965da0f940a09d4c39a4fe80a:
> 
>   ARM: dts: Add USB host node for Exynos4 (2013-08-19 05:07:17 +0900)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-2

Merged into late/all, to be merged towards the end of the merge window.

> Vikas Sajjan (3):
>       ARM: dts: Fix the RTC DT node name for Exynos5250
>       ARM: dts: Update the "status" property of RTC DT node for Exynos5250
> SoC

Next time please squash stuff like this, one adds properties and the next patch
removes them. I know Linaro likes to show up on patch contributor highscore
lists but this is nothing but churn.


-Olof
