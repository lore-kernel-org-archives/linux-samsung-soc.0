From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 5/5] mmc: sdhci-s3c: setup pins using pinctrl interface
Date: Mon, 12 Mar 2012 20:01:34 +0530
Message-ID: <CAJuYYwQ=vhcrbH3gsMBuLG1D_p=mx_RFbN86+ETPT4bLYrRgEA@mail.gmail.com>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org>
	<1331469965-28846-6-git-send-email-thomas.abraham@linaro.org>
	<20120312142143.GC14020@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:57176 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab2CLObg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 10:31:36 -0400
Received: by eaaq12 with SMTP id q12so1092728eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 07:31:34 -0700 (PDT)
In-Reply-To: <20120312142143.GC14020@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On 12 March 2012 19:51, Mark Brown <broonie@opensource.wolfsonmicro.com=
> wrote:
> On Sun, Mar 11, 2012 at 06:16:05PM +0530, Thomas Abraham wrote:
>> The platform specific callback to setup the sdhci pin mux and pin co=
nfig
>> is removed and the pinctrl subsystem interface is used to setup the
>> mux and config.
>
> You've only added pinctrl support for Exynos but this driver is also
> used by SoCs going back to s3c24xx era. =A0Either all those SoCs need=
 to
> be converted to use pinctrl or the driver needs to understand both
> methods (eg, using pinctrl if no callback is supplied).

Yes, I agree with your comment. I did refer to manuals of s3c24xx to
Exynos to ensure that the samsung pinctrl driver is generic and
reusable on all samsung soc's. I hope I have not missed out something
important that would require additional tweaks in the samsung pinctrl
driver. The missing bits now are gpio interrupt and wakeup interrupt
support in the samsung pinctrl driver. Once that is complete, I
believe it should be easy to add support for other SoC and convert the
drivers to use pinctrl (other option being to let pinctrl driver hog
all the mappings at boot and remove the cfg_gpio platform callbacks
from the driver).

Thank you Mark for your comments.

Regards,
Thomas.
