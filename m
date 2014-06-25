From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] arm: exynos: Modify pm code to check for cortex A9
	rather than the SoC
Date: Wed, 25 Jun 2014 12:18:23 +0100
Message-ID: <20140625111823.GH32514@n2100.arm.linux.org.uk>
References: <1400814061-12813-1-git-send-email-a.kesavan@samsung.com> <CAM4voa=3zzo-2KbjDtBOca+uJeSxT2OYpi+rJuSGsDg-vo7GYA@mail.gmail.com> <20140624161114.GW32514@n2100.arm.linux.org.uk> <CAM4voak4ZD0OHWoto7j2TyYBmpaWH3JH4ug3+hsxeL+WUhE9jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:42018 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754205AbaFYLS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:18:29 -0400
Content-Disposition: inline
In-Reply-To: <CAM4voak4ZD0OHWoto7j2TyYBmpaWH3JH4ug3+hsxeL+WUhE9jA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

On Wed, Jun 25, 2014 at 10:30:46AM +0530, Abhilash Kesavan wrote:
> I see that you have sent a patch out that ensures both part and
> implementor number are checked. Currently, my patch has been applied
> to the fixes branch of the arm-soc tree and I wanted to know how to
> proceed (without it there is a crash on the 5420):
> Should I request Arnd to drop it (if possible) and send out a new
> patch using your updated function ?

I'll hold my patch off - as yours is in the fixes branch, it should end
up in a -rc release.  Mine isn't -rc material.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
