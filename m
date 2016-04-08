From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] regulator: s2mps11: Use module_platform_driver()
 instead subsys initcall
Date: Fri, 8 Apr 2016 05:55:54 +0200
Message-ID: <20160408035554.GB9532@kozik-lap>
References: <1459950587-8807-1-git-send-email-javier@osg.samsung.com>
 <20160407123024.GA6765@kozik-lap>
 <5706A3FD.4030509@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35927 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752274AbcDHDz7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2016 23:55:59 -0400
Content-Disposition: inline
In-Reply-To: <5706A3FD.4030509@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

On Thu, Apr 07, 2016 at 02:16:29PM -0400, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 04/07/2016 08:30 AM, Krzysztof Kozlowski wrote:
> > On Wed, Apr 06, 2016 at 09:49:46AM -0400, Javier Martinez Canillas wrote:
> >> The driver's init and exit function don't do anything besides registering
> >> and unregistering the platform driver, so the module_platform_driver()
> >> macro could just be used instead of having separate functions.
> >>
> >> Currently the macro is not being used because the driver is initialized at
> >> subsys init call level but this isn't necessary since consumer devices are
> >> defined in the DT as dependencies so there's no need for init calls order.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> >>
> >> ---
> >> This patch was tested on an Exynos5422 Odroid XU4 board.
> > 
> > This test might not be sufficient. XU4 is not a mobile device like many
> > other users of this driver (except Arndale Octa and Artiks all of other
> > users are mobiles/wearables).
> > 
> > For example XU4 does not have USB OTG (like other devices and like XU3).
> >
> 
> All the consumer device nodes for these regulators are defined in the
> exynos5422-odroidxu3-common.dtsi that is shared by all the Odroid XU*
> so I thought testing in the XU4 was as good as testing in the XU3
> (since the USB OTG doesn't use a regulator from this PMIC).
> 
> I've also checked the DTS for all the boards that use regulators that
> are registered by this driver and all consumer drivers supports probe
> deferral so I think this change is safe.

Ah, seems fine then! Thanks for checking.

Best regards,
Krzysztof
