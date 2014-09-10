From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5420/arndale-octa: imprecise external aborts on exynos_defconfig
Date: Wed, 10 Sep 2014 11:46:14 -0700
Message-ID: <7h7g1bwbyh.fsf@deeprootsystems.com>
References: <CANMBJr41TQx4jVjnOO9WThn=SiZCq12mx1xtGN8_ubzZrO1=YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:56768 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750882AbaIJSqR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 14:46:17 -0400
In-Reply-To: <CANMBJr41TQx4jVjnOO9WThn=SiZCq12mx1xtGN8_ubzZrO1=YA@mail.gmail.com>
	(Tyler Baker's message of "Wed, 10 Sep 2014 11:20:19 -0700")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Tyler Baker <tyler.baker@linaro.org> writes:

> Exynos5420-based Arndale octa boards have recently started failing boot
> tests due to imprecise external aborts.  This only appears to happen
> when using exynos_defconfig and boots fine with multi_v7_defconfig.  The
> issue seems to be intermittent, so is not reliably reproducable and
> difficult to bisect.  Here are a few boot logs from recent
> mainline/linux-next kernels that are failing:

FYI, I'm seeing the same periodic aborts.  For example, here's my boot
of next-20140910:
http://images.armcloud.us/kernel-ci/next/next-20140910/arm-exynos_defconfig/boot-exynos5420-arndale-octa.html

However, my userspace is much simpler and doesn't seem to cause a panic,
so my boot tests report passing. (I should fixup my scripts so these
imprecise aborts are reported as a FAIL.)

I'm glad you pointed out that it happens only with exynos_defconfig and
not multi_v7_defconfig because I noticed that too.  I haven't had the
time to track it any further than that, so maybe the exynos folks can
help track it down from here.

Thanks for reporting this,

Kevin
