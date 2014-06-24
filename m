From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] arm: exynos: Modify pm code to check for cortex A9
	rather than the SoC
Date: Tue, 24 Jun 2014 17:20:48 +0100
Message-ID: <20140624162048.GX32514@n2100.arm.linux.org.uk>
References: <1400814061-12813-1-git-send-email-a.kesavan@samsung.com> <CAM4voa=3zzo-2KbjDtBOca+uJeSxT2OYpi+rJuSGsDg-vo7GYA@mail.gmail.com> <20140624161114.GW32514@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:40769 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754033AbaFXQU5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 12:20:57 -0400
Content-Disposition: inline
In-Reply-To: <20140624161114.GW32514@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Tue, Jun 24, 2014 at 05:11:14PM +0100, Russell King - ARM Linux wrote:
> Another point: exynos have taken it upon themselves to add code which
> saves various ARM core registers.  This is a bad idea, it brings us
> back to the days where every platform did their own suspend implementations.
> 
> CPU level registers should be handled by CPU level code, not by platform
> code.  Is there a reason why this can't be added to the Cortex-A9
> support code in proc-v7.S ?

BTW, Shawn Guo recently posted a patch to add the diagnostic register
save/restore to proc-v7.S.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
