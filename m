From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 7/9] phy: remove .owner field for drivers using
 module_platform_driver
Date: Wed, 17 Sep 2014 20:04:01 +0100
Message-ID: <20140917190401.GA31237@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1408106416-19044-1-git-send-email-peter.griffin@linaro.org>
 <1408106416-19044-8-git-send-email-peter.griffin@linaro.org>
 <5419B485.8010002@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:44311 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756331AbaIQTEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 15:04:09 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so37661pad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2014 12:04:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5419B485.8010002@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, maxime.ripard@free-electrons.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org, lee.jones@linaro.org

Hi Kishon,

On Wed, 17 Sep 2014, Kishon Vijay Abraham I wrote:

> Hi,
> 
> On Friday 15 August 2014 06:10 PM, Peter Griffin wrote:
> > This patch removes the superflous .owner field for drivers which
> > use the module_platform_driver or platform_driver_register api,
> > as this is overriden in __platform_driver_register.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

<snip>
> >  drivers/phy/phy-twl4030-usb.c       | 1 -
> 
> twl4030-usb doesn't use module_platform_driver. Care to resend this patch
> along? I've merged all other patches in this series.

That is true, but it does use platform_driver_register  whih overrides .owner.
So the patch is stil good I think (fyi see include/linux/platform_device.h).

regards,

Peter.
