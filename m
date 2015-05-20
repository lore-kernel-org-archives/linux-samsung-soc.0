From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 3/4] ARM: dts: Add SPI flash node to exynos5250-snow
Date: Wed, 20 May 2015 12:38:12 +0900
Message-ID: <555C01A4.1010707@samsung.com>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432042454-19234-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59727 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbETDiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 23:38:19 -0400
In-reply-to: <1432042454-19234-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 19.05.2015 22:34, Javier Martinez Canillas wrote:
> From: Doug Anderson <dianders@chromium.org>
> 
> Exynos5250 Snow machine has a SPI flash memory that is used to
> store firmware and different system parameters and data.
> 
> Add information about the SPI flash chip so that user-space tools
> can access it.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Olof Johansson <olofj@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
