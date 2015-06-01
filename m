From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: EXYNOS: Fix for 4.1, 4th
Date: Mon, 01 Jun 2015 17:06:21 +0200
Message-ID: <1716391.lQMtOGPqf7@wuerfel>
References: <1433120217-26814-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:53555 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbbFAPG2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:06:28 -0400
In-Reply-To: <1433120217-26814-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On Monday 01 June 2015 09:56:57 Krzysztof Kozlowski wrote:
> Fix for Exynos3250 RTC wake-up interrupts after converting PMU
> wakeup to stacked domains. This allows waking up the device from
> suspend to RAM using S3C RTC driver (the RTC on SoC).
> 
> The patch should be applied some time ago, unfortunately
> it seems it slipped through fingers.
> 

Pulled into fixes, thanks!

	Arnd
