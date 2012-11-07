From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Make s3c_device_i2c0 always use id 0
Date: Wed, 07 Nov 2012 19:02:36 +0100
Message-ID: <509AA23C.6000704@gmail.com>
References: <4039915.8GOx0SKq2B@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:45769 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162Ab2KGSCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 13:02:46 -0500
Received: by mail-bk0-f46.google.com with SMTP id jk13so853847bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 10:02:45 -0800 (PST)
In-Reply-To: <4039915.8GOx0SKq2B@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jhkim@insignal.co.kr, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 11/07/2012 02:00 PM, Tomasz Figa wrote:
> This patch removes compatibility definitions added long time ago when
> clock ids were used instead of devnames that were needed for platforms
> with only one i2c controller with id -1 (some s3c24xx's).
>
> Because currently devname field is used for matching device instances to
> clocks and if no devname is provided (as in clock-s3c2412.c and
> common-s3c2443.c for i2c clock, both in arch/arm/mach-s3c24xx) the clock
> is being matched only by name, so s3c_device_i2c0 can always have id 0.
>
> This patch solves the issue with i2c0 broken on boards where its the
> only i2c controller used, tested on Origen.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--

Thanks,
Sylwester
