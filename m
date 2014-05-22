From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/5] Samsung driver update for 3.16
Date: Wed, 21 May 2014 22:34:21 -0700
Message-ID: <20140522053421.GG32618@quad.lixom.net>
References: <014601cf73c8$68e56030$3ab02090$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:57985 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbaEVFeL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:34:11 -0400
Received: by mail-pd0-f180.google.com with SMTP id y13so2101448pdi.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 22:34:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <014601cf73c8$68e56030$3ab02090$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, May 20, 2014 at 10:11:20AM +0900, Kukjin Kim wrote:
> The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:
> 
>   Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)
> 
> are available in the git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-drivers
> 
> for you to fetch changes up to 93bfb769752babdc4d3665a1fb166bb4e3ff927b:
> 
>   clocksource: exynos_mct: register sched_clock callback (2014-05-02
> 22:27:01 +0900)
> 
> ----------------------------------------------------------------
> exynos_mct update for v3.16
> 
> - register sched_clock callback to use clocksource mct-frc
> 
> Note that got ack from Daniel

Merged into next/drivers, but is there a reason for why you took it through
your own tree instead of through Daniels? Seems like you might as well just
have sent it to him.


-Olof
