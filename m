From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/5] Samsung clock updates for 3.16
Date: Wed, 21 May 2014 22:31:26 -0700
Message-ID: <20140522053126.GF32618@quad.lixom.net>
References: <014501cf73c8$5eb66960$1c233c20$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:55721 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbaEVFbQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:31:16 -0400
Received: by mail-pa0-f52.google.com with SMTP id fa1so2141494pad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 22:31:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <014501cf73c8$5eb66960$1c233c20$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>

On Tue, May 20, 2014 at 10:11:03AM +0900, Kukjin Kim wrote:
> The following changes since commit 34c453ce16633539a94a2e876faeb731ac1be899:
> 
>   ARM: S3C24XX: fix merge conflict (2014-05-15 05:54:38 +0900)
> 
> are available in the git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-clk
> 
> for you to fetch changes up to 6520e968eef4f88c076a84a80e026049d157132e:
> 
>   clk: exynos5420: Add 5800 specific clocks (2014-05-19 22:15:08 +0900)
> 

1. This is new SoC support -- you said you're sending multiplatform soon so
   we'll hold off until that's made it in.

2. What's the actual dependency here for taking it through arm-soc? Seems like
   nearly all of it is in drivers/clk.


-Olof
