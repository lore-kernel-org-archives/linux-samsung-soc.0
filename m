From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/2] Enable config options to enable S2R wakeup
Date: Mon, 17 Jun 2013 10:25:06 -0700
Message-ID: <20130617172506.GD28497@quad.lixom.net>
References: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:40440 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752376Ab3FQRZA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 13:25:00 -0400
Received: by mail-pa0-f44.google.com with SMTP id lj1so3076742pab.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 10:25:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On Mon, Jun 17, 2013 at 09:48:04AM +0530, Tushar Behera wrote:
> RTC source is very useful in testing S2R wakeup. Also enable
> gpio-keys driver in case someone wants wakeup the board using
> the buttons.
> 
> S2R wakeup feature on Arndale depends on following two additional
> patches.
> 
> 1. [PATCH 1/8] ARM: EXYNOS: use generic cpu idle function for wfi
>  http://permalink.gmane.org/gmane.linux.linaro.devel/15871
> 
> 2. [PATCH V2] ARM: dts: Enable RTC node for Arndale
> (Posted a couple of minutes back, link not available yet)
> 
> S2R wakeup tested on Arndale board with an initramfs through
> both RTC wakeup alarm and GPIO button interrupt.
> 
> Tushar Behera (2):
>   ARM: exynos_defconfig: Enable GPIO buttons driver
>   ARM: exynos_defconfig: Enable RTC driver
> 
>  arch/arm/configs/exynos_defconfig |    3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Olof Johansson <olof@lixom.net>

..  but I don't see a need to keep them as two separate commit, just squash
them when applying, Kukjin.


-Olof
