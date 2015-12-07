From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable fan, sensors and audio for Odroid XU3
Date: Mon, 07 Dec 2015 10:14:02 +0100
Message-ID: <3286190.bAhobgE2la@wuerfel>
References: <1449449994-10110-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:63738 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466AbbLGJOr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 04:14:47 -0500
In-Reply-To: <1449449994-10110-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>

On Monday 07 December 2015 09:59:54 Krzysztof Kozlowski wrote:
> For Odroid XU3-family enable the:
>  - PWM fan (to control the CPU fan using thermal subsystem),
>  - TI INA231 sensors (provide power measurements of big.LITTLE cores,
>    DRAM and GPU),
>  - Samsung sound (for Odroid XU3 and Snow as well).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

Looks good. Do you have a samsung/defconfig branch already that you
can put this into, or should be pick it up into arm-soc directly?

My preference is the former, but it would be a bit silly if that
is the only samsung defconfig change we need.

	Arnd
