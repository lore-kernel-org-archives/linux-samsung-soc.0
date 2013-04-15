From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: Add SMBus emulation for block read
Date: Mon, 15 Apr 2013 18:06:51 +0200
Message-ID: <20130415160651.GA6286@the-dreams.de>
References: <1364308196-10101-1-git-send-email-prasanna.ps@samsung.com>
 <20130409122313.GD4913@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130409122313.GD4913-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Prasanna Kumar <prasanna.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jaemin Yoo <jmin.yoo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


> I don't know if that can happen, but if the block has length 0 (that is,
> only consists of a single byte that is read as 0) the is_msglast() test
> returns 0 which might be wrong. Maybe even if it cannot regularily
> happen handle it in a sane way?

Length of 0 is illegal according to the specs, but a check won't hurt.

> Also I wonder if error checking for byte > I2C_SMBUS_BLOCK_MAX would be
> needed to prevent a buffer overrun?

Yes. Although I have seen devices able to send more than that, yet
adding support for that is a seperate issue.
