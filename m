From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: add a gpio and pinctrl driver for samsung io-pad controllers
Date: Thu, 17 Nov 2011 10:20:42 +0100
Message-ID: <CACRpkdainYVgvGded+zNMAkw+9qa4kvcL3EVbOExkRKmX_xQUg@mail.gmail.com>
References: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:54557 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365Ab1KQJUn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Nov 2011 04:20:43 -0500
Received: by yenq3 with SMTP id q3so772722yen.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2011 01:20:42 -0800 (PST)
In-Reply-To: <1321387600-21033-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linaro-kernel@lists.linaro.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Tue, Nov 15, 2011 at 9:06 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> This driver supports gpio, pinctrl and pinmux functionality. At present, all the
> possible pin groups and pin functions have not been added. This driver is
> designed to be reusable across all Samsung SoC's and when this implemtation is
> complete, the gpio driver in driver/gpio for samsung platforms can be phased out.
> Features like GPIO interrupt support and pin-config support are yet to be added.

I would prefer if we have this driver on ice or in the drivers/staging/*
hierarchy until it can completely replace the GPIO driver and the platform
variant.

I am aware that you need more support from the pinctrl subsystem before
you can do this, I'm working on the things I can provide...

Overall the driver looks good!

Pretty massive with three controller instances, but it looks all manageable.

Yours,
Linus Walleij
