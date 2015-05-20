From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-trats2: set display clock correctly
Date: Wed, 20 May 2015 09:12:41 +0900
Message-ID: <CAJKOXPd_ON3sYuWCHOWJJEL7E9gzu9eQHf3yqc0cXAX3QoES7A@mail.gmail.com>
References: <1423306148-22212-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:46951 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbbETAMm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 20:12:42 -0400
In-Reply-To: <1423306148-22212-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

2015-02-07 19:49 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
> This patch sets display clock correctly.
>
> If Display clock isn't set correctly then you would find below messages
> and Display controller doesn't work correctly since a patch[1]
>
>    exynos-drm: No connectors reported connected with modes
>    [drm] Cannot find any crtc or sizes - going 1024x768
>
> [1] commit abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Tested on Trats2 board.

Dear Kukjin,

Could you pull it to current fixes branch (this RC cycle)? The patch
fixes display on Trats2 board. Without it (since abc0b1447d49) it
won't be properly set up and device boots with blank screen and
mentioned error message in logs.

I think this actually is a candidate for stable backporting (4.0+)
because it fixes important functionality of device:

Fixes: abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")
Cc: <stable@vger.kernel.org>

Best regards,
Krzysztof
