From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] exynos: pmu: use PS_HOLD based poweroff for all
 supported SoCs
Date: Mon, 09 Feb 2015 21:24:06 +0100
Message-ID: <54D91766.4080400@math.uni-bielefeld.de>
References: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39196 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760068AbbBIUYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 15:24:10 -0500
In-Reply-To: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Daniel Drake <drake@endlessm.com>

Marek Szyprowski wrote:
> PS_HOLD based power off procedure is common for all Exynos SoCs, so use
> it for every Exynos SoC.


Tested on my Odroid-X2 and it seems to solve the 'heating issue' when
the system is shut down but left on the AC adapter.

With best wishes,
Tobias
