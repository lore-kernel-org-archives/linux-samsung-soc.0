From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable usb3503
Date: Wed, 03 Jun 2015 18:08:37 -0700
Message-ID: <7hsia846wa.fsf@deeprootsystems.com>
References: <1426254866-24772-1-git-send-email-riku.voipio@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36691 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527AbbFDBIl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 21:08:41 -0400
Received: by pabqy3 with SMTP id qy3so17966327pab.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 18:08:40 -0700 (PDT)
In-Reply-To: <1426254866-24772-1-git-send-email-riku.voipio@linaro.org> (riku
	voipio's message of "Fri, 13 Mar 2015 15:54:26 +0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: riku.voipio@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tyler.baker@linaro.org, javier.martinez@collabora.co.uk

riku.voipio@linaro.org writes:

> From: Riku Voipio <riku.voipio@linaro.org>
>
> CONFIG_USB_HSIC_USB3503 is needed by exynos5250-arndale for the on-board
> asix network controller. Enable it so networking works with
> multi_v7_defconfig out of box like it does with exynos_defconfig.
>
> USB3503 is also referenced from exynos4412-odroidu3.dts and
> exynos5250-spring.dts so this patch should improve
> multi_v7_defconfig on those platforms as well.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Tyler pointed me to this in order to get arndale networking on mainline,
but looks like this might need to be revisited for current mainline.  

I tested this and it doesn't work because as of commit 7de7c6717f2c
(ARM: multi_v7_defconfig: Enable Exynos USB PHY) the PHY that this
depends on is built as a module in multi_v7_config, so having this
driver built-in doesn't help.  Even after the PHY driver is loaded, this
driver will not detect the hardware.

So instead, I think this driver should be built as a module as well.
Testing that, I can get networking by doing loading both the phy and
this driver after boot:

 # modprobe phy-exynos-usb2
 # modprobe usb3503

Kevin
