From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/3] Exynos multi-platform support
Date: Fri, 23 May 2014 21:17:12 +0200
Message-ID: <201405232117.12348.arnd@arndb.de>
References: <1400858369-14357-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:57698 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618AbaEWTRY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 15:17:24 -0400
In-Reply-To: <1400858369-14357-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Friday 23 May 2014, Sachin Kamat wrote:
> The patches in this series were earlier sent as part of other
> series. Now that the other patches have been merged, re-sending
> these after rebasing them on linux-next (20140523).
> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
> 
> A particular change in this series is the removal of single platform
> support for Exynos as suggested by Arnd and Olof (patch 2/3). With
> this change certain features (drivers) which are not yet multi-platform
> aware like cpufreq, devfreq and DRM based gscaler will not be available
> now.


Acked-by: Arnd Bergmann <arnd@arndb.de>
