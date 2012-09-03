From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] pinctrl: add samsung pinctrl and gpiolib driver
Date: Mon, 3 Sep 2012 13:14:44 +0200
Message-ID: <CACRpkdbVe77pAYdOw0+_2G2FWVWcn4GKQty6R-LXXEz-OkUdUg@mail.gmail.com>
References: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
	<1345720529-32315-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:60172 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756295Ab2ICLOp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 07:14:45 -0400
Received: by wgbdr13 with SMTP id dr13so4572546wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Sep 2012 04:14:44 -0700 (PDT)
In-Reply-To: <1345720529-32315-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, dong.aisheng@linaro.org, swarren@wwwdotorg.org, patches@linaro.org

On Thu, Aug 23, 2012 at 1:15 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Add a new device tree enabled pinctrl and gpiolib driver for Samsung
> SoC's. This driver provides a common and extensible framework for all
> Samsung SoC's to interface with the pinctrl and gpiolib subsystems. This
> driver supports only device tree based instantiation and hence can be
> used only on those Samsung platforms that have device tree enabled.
>
> This driver is split into two parts: the pinctrl interface and the gpiolib
> interface. The pinctrl interface registers pinctrl devices with the pinctrl
> subsystem and gpiolib interface registers gpio chips with the gpiolib
> subsystem. The information about the pins, pin groups, pin functions and
> gpio chips, which are SoC specific, are parsed from device tree node.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Looks good to me, I saw Stephen had some minor comments and
I expect that you probably fix them before applying to the Samsung
tree so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Feel free to push this through ARM SoC, I guess that's the plan?

Yours,
Linus Walleij
