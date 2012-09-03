From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: add exynos4210 specific extensions for
 samsung pinctrl driver
Date: Mon, 3 Sep 2012 13:16:04 +0200
Message-ID: <CACRpkdZxtG7oTzwv85ELFEB6rLwBUjiJV3POVwqTxvJz5n6LrQ@mail.gmail.com>
References: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
	<1345720529-32315-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:58401 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756254Ab2ICLQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 07:16:05 -0400
Received: by weyx8 with SMTP id x8so2873684wey.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Sep 2012 04:16:04 -0700 (PDT)
In-Reply-To: <1345720529-32315-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, dong.aisheng@linaro.org, swarren@wwwdotorg.org, patches@linaro.org

On Thu, Aug 23, 2012 at 1:15 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Add information about the Exynos4210 pin banks and driver data which is
> used by the Samsung pinctrl driver. In addition to this, the support for
> external gpio and wakeup interrupt support is included and hooked up with
> the Samsung pinctrl driver.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
