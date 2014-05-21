From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/3] Exynos multi-platform support
Date: Wed, 21 May 2014 10:26:56 +0200
Message-ID: <537C6350.2010707@gmail.com>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:48049 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822AbaEUI1E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:27:04 -0400
Received: by mail-ee0-f50.google.com with SMTP id e51so1296963eek.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 01:27:03 -0700 (PDT)
In-Reply-To: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de

Hi,

On 21.05.2014 08:52, Sachin Kamat wrote:
> The patches in this series were earlier sent as part of other
> series. Now that the other patches have been merged, re-sending
> these after rebasing them on linux-next (20140519).
> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
> 
> A particular change in this series is the removal of single platform
> support for Exynos as suggested by Arnd and Olof (patch 2/3). With
> this change certain features (drivers) which are not yet multi-platform
> aware like cpufreq, devfreq and DRM based gscaler will not be available
> now.

I really don't like this. Well, I don't care too much for devfreq and
DRM Gscaler, as the the first one doesn't even support DT and Gscaler is
usually used through a V4L2 driver, which should be fine. However
cpufreq is quite important feature and it will be a serious regression
in terms of performance (most boards don't boot at maximum frequency)
and power consumption (no ability to scale the CPU down).

So my proposal here is to hack the cpufreq driver with a minimal amount
of changes needed to compile and use it on multi-platform builds. I'll
send a patch later today to show what I mean. It would have to be merged
as a prerequisite for this series, to keep the history bisectable.

Best regards,
Tomasz
