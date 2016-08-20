From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 00/17] clk: Add per-controller locks to fix deadlocks
Date: Sat, 20 Aug 2016 18:03:07 +0200
Message-ID: <20160820160307.GB6344@kozik-book>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
 <8519a1cf-ec51-2914-e4aa-27b26b9233de@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8519a1cf-ec51-2914-e4aa-27b26b9233de@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 19, 2016 at 03:31:08PM -0400, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 08/16/2016 09:34 AM, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > RFC, please, do not apply, maybe except patch #1 which is harmless.
> > 
> > 
> > Introduction
> > ============
> > The patchset brings new entity: clock controller representing a hardware
> > block.  The clock controller comes with its own prepare lock which
> > is used then in many places.  The idea is to fix the deadlock mentioned
> > in commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA deadlock by keeping
> > I2C clock prepared") and commit 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA deadlock
> > by keeping clock prepared").
> > 
> > 
> 
> I'm not familiar enough with the common clock framework to do a proper review
> of this patch-set, but I've tested both on an Exynos5800 Peach Pi Chromebook
> and an Exynos5422 Odroid XU4 board and I didn't find any clock regressions.
> 
> Also, I confirmed that the possible deadlock in the Odroid XU4 that was fixed
> by reverted commit 10ff4c5239a1 doesn't happen anymore with your patches.
> 
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks for testing, I appreciate that!

Best regards,
Krzysztof
