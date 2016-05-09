From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: dts: exynos: Non-critical fixes for v4.7
Date: Mon, 09 May 2016 16:38:48 +0200
Message-ID: <7398428.rrnfaS9ayc@wuerfel>
References: <1462619428-13798-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462619428-13798-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, krzk@kernel.org, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday 07 May 2016 13:10:28 Krzysztof Kozlowski wrote:
> Samsung DTS non-critical fixes for v4.7:
> 1. Fix s5p-mfc driver probe on Exynos542x Peach boards (need to provide MFC
>    memory banks). On these boards this was broken for long time but
>    apparently no one enabled this driver till now.
> 2. Fix creation of debugfs entries for one regulator on Exynos4210
>    Trats board.
> 3. Fix probing of max8997 MFD driver (and its children) because
>    of missing interrupt. Actually the current version of the driver probes
>    (just without interrupts) but after switching to regmap and regmap-irq,
>    the interrupt will be mandatory.
> 
> 

Merged into next/fixes-non-critical, thanks!

	Arnd
