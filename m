From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 05/12] ARM: EXYNOS: Remove file path from comment section
Date: Wed, 30 Apr 2014 14:11:43 +0530
Message-ID: <CAK9yfHy8kbNk6mVZy_ARiWZ8kLbn7r7R8vj+3ETCcGsASQZsCw@mail.gmail.com>
References: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
	<1398835057-3860-6-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:36131 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758062AbaD3Ilo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 04:41:44 -0400
Received: by mail-oa0-f42.google.com with SMTP id i7so1602855oag.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2014 01:41:43 -0700 (PDT)
In-Reply-To: <1398835057-3860-6-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>, VIKAS SAJJANC <vikas.sajjan@samsung.com>

Hi Pankaj,

On 30 April 2014 10:47, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> Many files under "arm/mach-exynos" are having file path in file
> comment section which is invalid now.
> So for better code maintainability let's remove them.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---

The change is sensible. However Kukjin had refused to accept such patches
when I had submitted patches doing such cleanup for all Samsung platform files.

Anyway, FWIW
Reviewed-by: Sachin Kamat <sachin.kamat@linaro.org>

-- 
With warm regards,
Sachin
