From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos-usb2: add vbus regulator support
Date: Tue, 6 Oct 2015 22:47:12 +0900
Message-ID: <CAJKOXPdZ+ed7UacrAChfMS+SfQxPZgvkshoJiSd0_yxRTSpTSA@mail.gmail.com>
References: <1444138860-23595-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33049 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbbJFNrN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 09:47:13 -0400
In-Reply-To: <1444138860-23595-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>

2015-10-06 22:41 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>
> Exynos USB2 PHY has separate power supply, which is usually provided by
> VBUS regulator. This patch adds support for it. VBUS regulator is
> optional, to keep compatibility with boards, which have VBUS provided
> from some always-on power source.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This is just a resend of a patch posted in the following thread:
> https://lkml.org/lkml/2015/8/21/306
>
> I really hope that it will finally get merged to v4.4. For more
> information and background, please refer to the mentioned thread.
>
> Marek Szyprowski
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt        |  3 +++
>  drivers/phy/phy-samsung-usb2.c                     | 25 ++++++++++++++++++++--
>  drivers/phy/phy-samsung-usb2.h                     |  2 ++
>  3 files changed, 28 insertions(+), 2 deletions(-)

Any particular reason to dropping my tested-by? Do you changed here anything?

Best regards,
Krzysztof
