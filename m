From: Beata Michalska <b.k.m.devel@gmail.com>
Subject: Re: [PATCH v2] i2c: Mark adapter devices with pm_runtime_no_callbacks
Date: Thu, 16 Apr 2015 14:28:02 +0200
Message-ID: <552FAAD2.80407@gmail.com>
References: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34753 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367AbbDPM2H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 08:28:07 -0400
In-reply-to: <1429185919-26098-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: wsa@the-dreams.de, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, lars@metafoo.de

On 04/16/2015 02:05 PM, Charles Keepax wrote:
> Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
> ops from the bus type, which causes the pm operations on the s3c2410
> adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
> doesn't get bound to a driver and as such can't have its own pm_runtime
> callbacks. Previously this was fine as the bus callbacks would have been
> used, but now this can cause devices which use PM runtime and are
> attached over I2C to fail to resume.
>
> This commit fixes this issue by marking all adapter devices with
> pm_runtime_no_callbacks, since they can't have any.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>
> Changes since v1:
>  - Simple mark all adapter devices with pm_runtime_no_callbacks in the i2c
>    core
>
> Thanks,
> Charles
>
>  drivers/i2c/i2c-core.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index 1672e6b..eac3331 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -1410,6 +1410,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>  
>  	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
>  
> +	pm_runtime_no_callbacks(&adap->dev);
> +
>  #ifdef CONFIG_I2C_COMPAT
>  	res = class_compat_create_link(i2c_adapter_compat_class, &adap->dev,
>  				       adap->dev.parent);

Thereis at least one more casewhen an I2C device fails to resume due
to bus callbacks being dropped(like fimc-is-i2c driver for exynos4-is,
the same scenario),  so I'm glad to see  it's being handled in on place
-it saves the trouble.

BR
Beata
