From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4] i2c: exynos5: add High Speed I2C controller driver
Date: Fri, 08 Feb 2013 13:16:08 +0000
Message-ID: <20130208131608.378063E2B73@localhost>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com> <1359734084-10594-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359734084-10594-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, grundler@chromium.org, naveenkrishna.ch@gmail.com, broonie@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 01 Feb 2013 21:24:44 +0530, Naveen Krishna Chatradhi <ch.naveen@samsung.com> wrote:
> Adds support for High Speed I2C driver found in Exynos5 and later
> SoCs from Samsung. This driver currently supports Auto mode.
> 
> Driver only supports Device Tree method.
> Note: Added debugfs support for registers view, not tested.
> 
> Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> Help please,
> 
> Usual reads and writes are happening. But, when i try doing
> i2cdetect -y 0 0x10 0x59; It throws me continous interrupts at 0x1a
> i2cdetect -y 0 0x50 0x64; It throws me continous interrupts at 0x63
> 
> There are eeproms from 0x50 till 0x58
> wm8994 codec at 0x1a
> 
> Kindly, can anyone explain this behaviour.
> 
>  drivers/i2c/busses/Kconfig       |    7 +
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-exynos5.c |  754 ++++++++++++++++++++++++++++++++++++++

Don't forget you need to document the new compatible string in
Documentation/devicetree/bindings/i2c. That should be part of this
patch.

g.
