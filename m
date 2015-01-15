From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Thu, 15 Jan 2015 11:10:10 +0100
Message-ID: <54B79202.80209@math.uni-bielefeld.de>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58558 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751786AbbAOKKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 05:10:14 -0500
In-Reply-To: <54B79123.4090200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Marek Szyprowski wrote: This is on a ODROID-X2.
> 
> The issues with FIMC / DRM FIMC are not related to HDMI patches. They will
> be handled separately. For the time being simply please disable Exynos IPP
> (or Exynos DRM FIMC) feature in your kernel configuration.
> 
> I hope that HDMI display works fine for you.
> 
> Best regards

OK, I'll check without FIMC again later this day, but what about the
warning (?) from the mixer:
exynos-mixer 12c10000.mixer: Unbalanced pm_runtime_enable!

Should this go away as well, when I disable the FIMC?

With best wishes,
Tobias
