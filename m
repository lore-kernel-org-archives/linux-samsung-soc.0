From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v5 3/5] ARM: EXYNOS: Enable PMUs for exynos4
Date: Fri, 26 Oct 2012 10:36:28 +0100
Message-ID: <20121026093628.GE20914@mudshark.cambridge.arm.com>
References: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
 <1351056894-5790-4-git-send-email-chanho61.park@samsung.com>
 <CAOesGMg5Nn5i=J8o3Rt8es3Tq_LZgVttuYSBbvYfmw1QTGwx0A@mail.gmail.com>
 <005801cdb251$e52f7480$af8e5d80$@samsung.com>
 <20121025144125.GH11267@mudshark.cambridge.arm.com>
 <007301cdb32f$26eb92e0$74c2b8a0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:59516 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752149Ab2JZJhL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 05:37:11 -0400
Content-Disposition: inline
In-Reply-To: <007301cdb32f$26eb92e0$74c2b8a0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>

On Fri, Oct 26, 2012 at 05:05:36AM +0100, Chanho Park wrote:
> > 
> > I agree that we definitely want to support the PMU on Exynos4, but I'm
> > tempted to postpone adding that code until DT support is available.
> 
> I already included DT support for exynos4(except exynos4412) in this patchset.
> (Please see the [PATCH v5 5/5] ARM: EXYNOS: Add arm-pmu DT binding for exynos421x)

The only patch I'm objecting to is the second one, which adds the hardcoded
combiner data. That seems orthogonal to the DT patches, which look fine to
me.

Will
