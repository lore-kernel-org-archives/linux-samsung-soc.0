From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC 00/17] clk: Add per-controller locks to fix deadlocks
Date: Tue, 16 Aug 2016 15:51:10 +0200
Message-ID: <65703100-1e16-6c34-babe-40e630180688@samsung.com>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@osg.samsung.com>, a.hajda@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/16/2016 03:34 PM, Krzysztof Kozlowski wrote:
> Hi,
> 
> RFC, please, do not apply, maybe except patch #1 which is harmless.
> 
> 
> Introduction
> ============
> The patchset brings new entity: clock controller representing a hardware
> block.  The clock controller comes with its own prepare lock which
> is used then in many places.  The idea is to fix the deadlock mentioned
> in commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA deadlock by keeping
> I2C clock prepared") and commit 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA deadlock
> by keeping clock prepared").
> 

Damn, I forgot to describe the overall idea. :) It is mentioned in patch
15 but probably not many will have enough of patience to reach it.

The locking idea
================
Clock controllers representing different hardware blocks, will contain
its own prepare lock which protects the clocks inside controller.  The
hierarchy itself is protected by global lock.

In prepare path, the global prepare lock is removed.  This is direct
solution for the deadlock.

Clock hierarchy imposes also hierarchy between controllers so when a
prepare happens, also parents have to be locked.

Following locking design was chosen:
1. For prepare/unprepare paths: lock only clock controller and its
   parents.
2. For recalc rates paths: lock global lock, the controller and its
   children.
3. For reparent paths: lock entire tree up down (children and parents)
   and the global lock as well.


In each case of traversing the clock hierarchy, the locking of
controllers is always from children to parents.


Best regards,
Krzysztof
