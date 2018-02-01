From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: rework HSI2C_MASTER_ST_LOSE state
 handling
Date: Thu, 01 Feb 2018 16:51:23 +0900
Message-ID: <20180201075123.GH7575@gangnam.samsung>
References: <CGME20180126121001eucas1p2931738af133ad3e5bf1cd824058ba8d0@eucas1p2.samsung.com>
        <20180126120950.9934-1-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <20180126120950.9934-1-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On Fri, Jan 26, 2018 at 01:09:50PM +0100, Andrzej Hajda wrote:
> HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
> show that hardware is usually able to recover from this state without
> interrupting the transfer. Moreover documentation says that
> such state can be caused by slave clock stretching, and should not be
> treated as an error during transaction. The only place it indicates
> an error is just before starting transaction. In such case bus recovery
> procedure should be performed - master should pulse SCL line nine times
> and then send STOP condition, it can be repeated until SDA goes high.
> The procedure can be performed using manual commands HSI2C_CMD_READ_DATA
> and HSI2C_CMD_SEND_STOP.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Thank you, looks good to me.

Please add:

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
Tested-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi
