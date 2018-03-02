From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 11:19:31 +0000
Message-ID: <20180302111931.GX9418@n2100.armlinux.org.uk>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519936484-23132-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Mar 01, 2018 at 09:34:44PM +0100, Krzysztof Kozlowski wrote:
> Interrupt number 0 (returned by platform_get_irq()) might be a valid IRQ
> so do not treat it as an error.  If interrupt 0 was configured, the driver
> would exit the probe early, before finishing initialization, but with
> 0-exit status.

The official position (as stated by Linus) is that interrupt zero is
not a valid interrupt for peripheral drivers (it may be valid within
architecture code for things like the x86 PIT, but nothing else.)

You need to number your platform interrupts from one rather than zero.

Note that there have been patches proposed to make platform_get_irq()
return an error rather than returning a value of zero, so changing
the driver in this way is not a good idea.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
