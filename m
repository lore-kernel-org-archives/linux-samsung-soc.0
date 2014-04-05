From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/7] drm/exynos: add super device support
Date: Sat, 5 Apr 2014 19:52:49 +0100
Message-ID: <20140405185249.GM7528@n2100.arm.linux.org.uk>
References: <1396355882-17010-1-git-send-email-inki.dae@samsung.com> <1396355882-17010-2-git-send-email-inki.dae@samsung.com> <533EB9C6.80302@samsung.com> <CAAQKjZPbzb+qvJA5y+Kco9BRv4j3iVatM_0bd+ugyuVZUbfFFg@mail.gmail.com> <53403E42.1010403@gmail.com> <20140405182423.GL7528@n2100.arm.linux.org.uk> <53404BF3.2010409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51305 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753372AbaDESxV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Apr 2014 14:53:21 -0400
Content-Disposition: inline
In-Reply-To: <53404BF3.2010409@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, Daniel Vetter <daniel@ffwll.ch>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Sat, Apr 05, 2014 at 08:31:15PM +0200, Tomasz Figa wrote:
> Maybe my words have been misinterpreted, but all I'm suggesting here is  
> that there is no need to add any new data to DT to solve the same issue  
> to the same extent as componentized subsystem framework, at least in  
> Exynos case.

Right, so we seem to have agreement that what exynos is currently doing
is fundamentally broken.

So the next question is, how is it going to get fixed?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
