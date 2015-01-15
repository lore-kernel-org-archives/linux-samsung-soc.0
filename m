From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Thu, 15 Jan 2015 14:59:29 +0100
Message-ID: <b8351489813e37f123eb38d8da078392@math.uni-bielefeld.de>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59119 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751437AbbAON7a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 08:59:30 -0500
In-Reply-To: <54B79123.4090200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello!

On 2015-01-15 11:06, Marek Szyprowski wrote:
> The issues with FIMC / DRM FIMC are not related to HDMI patches. They 
> will
> be handled separately. For the time being simply please disable Exynos 
> IPP
> (or Exynos DRM FIMC) feature in your kernel configuration.
Confirming that disabling the IPP removes the __clk_{unprepare,disable} 
warnings.

> I hope that HDMI display works fine for you.
I haven't got a HDMI display here atm, testing later!

With best wishes,
Tobias
