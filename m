From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Fri, 16 Jan 2015 00:54:36 +0100
Message-ID: <54B8533C.3070000@math.uni-bielefeld.de>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59842 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752054AbbAOXyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 18:54:40 -0500
In-Reply-To: <54B79123.4090200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello!

Marek Szyprowski wrote:
> I hope that HDMI display works fine for you.
I checked with my panel just now and played around a bit with the DRM
(opening, vsync, etc.). However on deinitialization the entire system
locked up. I currently haven't hooked the board up to the serial
console, otherwise I would've tried to extract some more meaningful
information.

Going to check again more thoroughly on the weekend what exactly
triggers the lockup.

With best wishes,
Tobias
