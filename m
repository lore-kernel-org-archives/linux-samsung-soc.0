From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Tue, 20 Jan 2015 00:33:20 +0100
Message-ID: <54BD9440.1040907@gmx.net>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com> <54B8533C.3070000@math.uni-bielefeld.de> <54B99178.1060006@gmx.net> <54BD3129.5090305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:56774 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751514AbbASXdY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 18:33:24 -0500
In-Reply-To: <54BD3129.5090305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Marek Szyprowski wrote:
> Please check the following kernel tree - instead of hacking around hdmi
> clock I've added
> handling of it directly to drm mixer driver:
> https://git.linaro.org/people/marek.szyprowski/linux-srpol.git/shortlog/refs/heads/v3.19-odroid-hdmi
> 
> I hope that this will finally solve all mixer initialization related
> issues (also for
> Odroid XU3, discussed recently in the other thread). If it works fine, I
> will resend
> exynos4 hdmi patches to include this change.
OK, I can verify that with the additional patches the lockup issues no
longer occur.

When doing the vsync tests though there are still the drm_vblank_put
warnings. I have yet to check if patch by Joonyoung (thanks Joonyoung
for the hint!) fixes these warnings.

With best wishes,
Tobias
