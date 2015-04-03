From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung 2nd fixes for v4.0
Date: Fri, 3 Apr 2015 14:52:24 -0700
Message-ID: <20150403215224.GP23023@localhost>
References: <551C29AB.7030306@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34288 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519AbbDCVw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 17:52:26 -0400
Received: by pactp5 with SMTP id tp5so127686864pac.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 14:52:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551C29AB.7030306@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thu, Apr 02, 2015 at 02:23:55AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof, Kevin,
> 
> Here is 2nd Samsung fixes for v4.0 and it fixes arm allmodconfig build
> breakage and exynos5250-spring lid, power-pin and mmc nodes dt updates.
> 
> Please pull and sorry for pretty late pull-request for v4.0.
> 
> Thanks,
> Kukjin
> 
> 
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-2
> 
> for you to fetch changes up to cfdda3535f87e752780ca18a57d13db58f6a6913:
> 
>   ARM: EXYNOS: Fix build breakage cpuidle on !SMP (2015-03-18 03:26:11
> +0900)

Merged.


-Olof
