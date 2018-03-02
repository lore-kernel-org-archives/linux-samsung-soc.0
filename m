From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 17:09:01 +0300
Message-ID: <20180302140901.lrjqiaa2k4nxkqco@mwanda>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
 <20180302124647.sfhnto77wgdh5sv6@katana>
 <20180302125907.GA9418@n2100.armlinux.org.uk>
 <20180302135854.76ue5jzsg7lvxjxw@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302135854.76ue5jzsg7lvxjxw@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 02, 2018 at 02:58:54PM +0100, Wolfram Sang wrote:
> 
> > It needs platform maintainers to be motivated to fix it, and one way to
> > provide that motivation is for subsystem maintainers to say no to patches
> > like this.  If patches like this get accepted, then the "problem" gets
> > solved, and there is very little motivation to fix the platform itself.
> 
> Yes, I can see this. I will drop / revert the patch.
> 

TBH, I can't find the threads from November so I feel a bit lost and
there is no documentation for platform_get_irq().

regards,
dan carpenter
