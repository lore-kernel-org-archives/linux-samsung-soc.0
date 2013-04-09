From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: Add SMBus emulation for block read
Date: Tue, 9 Apr 2013 11:37:39 +0200
Message-ID: <20130409093739.GH3624@the-dreams.de>
References: <1364308196-10101-1-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364308196-10101-1-git-send-email-prasanna.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasanna Kumar <prasanna.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jaemin Yoo <jmin.yoo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 26, 2013 at 07:59:56PM +0530, Prasanna Kumar wrote:
> From: Jaemin Yoo <jmin.yoo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> SMBus read and write are supported by the emulation layer of i2c
> framework if the controller doesn't have SMBus features.
> 
> I2C_M_RECV_LEN flag is used to let i2c drivers know rx length is not
> yet determined but will be read to the first byte in rx buffer.
> 
> s3c2410 doesn't handle this flag. So only one byte is read from slave.
> There fore following two features are added to the driver code.
> 
> 1. skip rx length check if I2C_M_RECV_LEN is set and the length is 1.
> 2. add actual bytes to the rx length after reading first bytes if
>    I2C_M_RECV_LEN.
> 
> I2C_M_RECV_LEN is only set for SMBus command. So this code does not
> affect legacy codes which only use i2c command for s3c2410.
> 
> Signed-off-by: Jaemin Yoo <jmin.yoo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Prasanna Kumar <prasanna.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Applied to for-next, thanks!
