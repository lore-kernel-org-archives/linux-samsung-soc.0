From: Ben Dooks <ben-i2c@fluff.org>
Subject: Re: [PATCH v2 0/3] Add device tree support for Samsung's I2C driver
Date: Wed, 27 Jul 2011 23:06:22 +0100
Message-ID: <20110727220622.GO15795@trinity.fluff.org>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:42785 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756145Ab1G0WG2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 18:06:28 -0400
Content-Disposition: inline
In-Reply-To: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-i2c@vger.kernel.org, grant.likely@secretlab.ca, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Fri, Jul 22, 2011 at 03:48:35PM +0530, Thomas Abraham wrote:
> This patchset adds device tree support for Samsung's I2C driver. The
> Exynos4 DT enabled machine is updated to support device tree based probe
> for I2C instance 0 and 1.

I'll look at taking the i2c specific changes for either this or the next
release depending on how I feel.
 
> Changes since v1:
> 
> - Addressed all comments from Grant Likely
>     - s3c24xx_i2c_is2440 function is simpler now.
>     - Consolidated all the scatterd dt support code into a single function.
>     - but the dependency on i2c pinmux handler function passed from the
>       platform data is retained. It would be removed eventually when the
>       new pinmux api is finalized and the i2c driver is modified to
>       support the pinmux settings using the pinmux api.
> 
> Thomas Abraham (3):
>   i2c: s3c2410: Keep a copy of platform data and use it.
>   i2c: s3c2410: Add device tree support
>   arm: dt: Add device tree support for i2c instance 0 and 1 on exynos4 dt machine
> 
>  .../devicetree/bindings/i2c/samsung-i2c.txt        |   44 +++++++++++++++
>  arch/arm/boot/dts/exynos4-smdkv310.dts             |   45 +++++++++++++++
>  arch/arm/mach-exynos4/Kconfig                      |    2 +
>  arch/arm/mach-exynos4/mach-exynos4-dt.c            |   23 ++++++++
>  drivers/i2c/busses/i2c-s3c2410.c                   |   58 +++++++++++++++++++-
>  5 files changed, 169 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
