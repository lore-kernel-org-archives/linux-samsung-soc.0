From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: Fix possible ABBA deadlock by keeping I2C
 clock prepared
Date: Sun, 17 Apr 2016 15:29:44 +0200
Message-ID: <20160417132944.GA3620@kozik-lap>
References: <1460757887-18128-1-git-send-email-javier@osg.samsung.com>
 <20160416161147.GA2794@kozik-lap>
 <5712DFC9.8000402@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5712DFC9.8000402@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Apr 16, 2016 at 08:58:49PM -0400, Javier Martinez Canillas wrote:
> But regardless of the ABBA deadlock, there are reasons why the clk API is
> split into an {,un}prepare and {en,dis}able functions (e.g: non-atomic vs
> atomic) and it is a common pattern for drivers to prepare the clock(s) on
> setup (i.e: probe), unprepare on driver removal, and just {en,dis}able the
> clock(s) during runtime.

The reason to split prepare+enable is to differentiate the sleeping and
non-sleeping paths. Not to encourage doing one type in probe() and rest
in other places. The clock consumer does not care whether prepare or
enable is a noop. It shouldn't care, because the clock provider might
change and consumer remains the same. On the other hand the consumer is
interested whether it can block or not.

The argument that common pattern is to prepare in probe does not
convince me. If a clock enable is an noop and everything is done in
prepare/unprepare, then following such "common pattern" would be equal
to keeping the clock on always, even if it could be unprepared (gated). 


> So I believe this patch is good on its own 

As I said above, no. The pattern might be misleading. The prepare path
is there for sleeping purposes. Not for probes. Choosing such
pattern effectively makes clock handling worthless in certain clock
providers (these which enable is a noop).

> and at least makes the driver more
> consistent with most I2C controller drivers that do the same w.r.t clocks.

I cannot respond to that argument because I do not know most I2C
controllers.

Best regards,
Krzysztof
