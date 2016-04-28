From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/3] ARM: dts: exynos: Fixup for SROM controller (v4.7)
Date: Thu, 28 Apr 2016 17:41:06 +0200
Message-ID: <7052710.l4pDA7Dm1I@wuerfel>
References: <1461748256-4394-1-git-send-email-k.kozlowski@samsung.com> <1461748256-4394-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:58176 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbcD1Plp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 11:41:45 -0400
In-Reply-To: <1461748256-4394-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wednesday 27 April 2016 11:10:55 Krzysztof Kozlowski wrote:
> DeviceTree changes for new SROM controller driver reached mainline
> some time ago, before the driver was accepted (due to very late
> comments). However, after these late comments, the driver expects
> different bindings so we need to fix the DTS.

Pulled into next/dt, thanks!

	Arnd
