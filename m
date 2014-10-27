From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/8] regulator: max77802: Remove support for board files
Date: Mon, 27 Oct 2014 20:36:18 +0100
Message-ID: <544E9EB2.2010408@collabora.co.uk>
References: <1414422226-10948-1-git-send-email-k.kozlowski@samsung.com> <1414422226-10948-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:57767 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752116AbaJ0Tg0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 15:36:26 -0400
In-Reply-To: <1414422226-10948-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Krzysztof,

On 10/27/2014 04:03 PM, Krzysztof Kozlowski wrote:
> The driver is used only on Exynos based boards with DTS support.
> Convert the driver to DTS-only version.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/regulator/max77802.c | 44 +++++++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
> index 5839c4509e1f..61d03e9f8acf 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c

The original ChromeOS max77xxx driver supported both DT and platform data
configuration and that's why the max77802 driver was not DT-only.

But I looked at the ChromeOS kernel now and indeed even in that tree there
are no board files using the max77802 platform data so I agree that it
should be removed.

Acked-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
