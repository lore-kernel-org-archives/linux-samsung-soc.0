From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCHv2 3/3] ARM: EXYNOS: Enable PMUs for exynos4/5
Date: Sat, 28 Jul 2012 15:41:40 +0100
Message-ID: <20120728144135.GC11713@mudshark.cambridge.arm.com>
References: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
 <1343376509-5881-4-git-send-email-chanho61.park@samsung.com>
 <20120727090201.GD559@mudshark.cambridge.arm.com>
 <01c601cd6c79$30f508e0$92df1aa0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:50780 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752401Ab2G1Ol5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Jul 2012 10:41:57 -0400
Content-Disposition: inline
In-Reply-To: <01c601cd6c79$30f508e0$92df1aa0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>

On Sat, Jul 28, 2012 at 05:26:43AM +0100, Chanho Park wrote:
> > We have devicetree bindings for the PMU -- why can't you use those instead
> > of probing the SoC all the time?
> 
> Exynos4 isn't fully supported the DT yet. Thus, we should support legacy probing.

Ok, but what about Exynos5? You seem to use the legacy probing there too.

Will
