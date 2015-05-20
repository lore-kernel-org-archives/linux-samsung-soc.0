From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 2/4] ARM: dts: Add SPI flash node for Peach boards
Date: Wed, 20 May 2015 12:37:29 +0900
Message-ID: <555C0179.8040102@samsung.com>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432042454-19234-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55050 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbbETDhg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 23:37:36 -0400
In-reply-to: <1432042454-19234-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Simon Glass <sjg@chromium.org>

On 19.05.2015 22:34, Javier Martinez Canillas wrote:
> From: Simon Glass <sjg@chromium.org>
> 
> Peach Pit and Pi machines have a SPI flash memory that is used to
> store firmware and different system parameters and data.
> 
> Add information about the SPI flash chip so that user-space tools
> can access it.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I assume this can go through samsung-soc tree (after documenting new
compatible)?

The exynos5800-peach-pi.dts and exynos5420-peach-pit.dts have a lot of
common nodes. I wonder if there is a common part which could have its
own dtsi? Like exynos4412-odroid-common.dtsi?

Best regards,
Krzysztof
