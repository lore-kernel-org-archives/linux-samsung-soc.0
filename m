From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v6 2/3] regulator: max77802: Remove suspend_enable
Date: Wed, 29 Oct 2014 12:34:57 +0100
Message-ID: <5450D0E1.7040904@collabora.co.uk>
References: <1414581294-1315-1-git-send-email-k.kozlowski@samsung.com> <1414581294-1315-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60099 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932529AbaJ2LfE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 07:35:04 -0400
In-Reply-To: <1414581294-1315-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Krzysztof,

On 10/29/2014 12:14 PM, Krzysztof Kozlowski wrote:
> The Maxim 77802 PMIC regulators do not have special enable configuration
> for suspend. The driver instead enabled them manually which is not a
> best way to deal with suspend.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/regulator/max77802.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
> index 5839c4509e1f..b9958d927297 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c

After what Mark explained, I understand this is the right thing to do.

Acked-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
