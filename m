From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 16:28:21 +0000
Message-ID: <20180302162821.bmsxgrqqaginjooo@lakrids.cambridge.arm.com>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
 <20180302124647.sfhnto77wgdh5sv6@katana>
 <20180302125907.GA9418@n2100.armlinux.org.uk>
 <20180302135854.76ue5jzsg7lvxjxw@katana>
 <20180302140901.lrjqiaa2k4nxkqco@mwanda>
 <20180302153221.GB9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302153221.GB9418@n2100.armlinux.org.uk>
Sender: stable-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 02, 2018 at 03:32:22PM +0000, Russell King - ARM Linux wrote:
> How do we break this status quo and finally solve the IRQ 0 and
> NO_IRQ issue?

> Another possibility would be to change platform_get_irq() and
> suffer the regressions that will cause, telling people that fixing
> their platform IRQ numbering is the only solution (but this
> requires breaking our ideals about regressions.)

How about we start with a warning? That'll be visible, but shouldn't
result in broken systems while we wait for people to fix things up.

e.g. something like the below.

Mark.

---->8----
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f1bf7b38d91c..bd42eeffd2aa 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -126,7 +126,12 @@ int platform_get_irq(struct platform_device *dev, unsigned int num)
                irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
        }
 
-       return r ? r->start : -ENXIO;
+       if (!r)
+               return -ENXIO;
+
+       WARN_ONCE(!r->start, "Platform uses zero as a valid IRQ.");
+
+       return r->start;
 #endif
 }
 EXPORT_SYMBOL_GPL(platform_get_irq);
