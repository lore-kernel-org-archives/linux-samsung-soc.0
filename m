From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] ARM: dts: odroidxu3: Enable wake alarm of S2MPS11 RTC
Date: Mon, 25 May 2015 14:27:22 +0200
Message-ID: <5563152A.4020104@collabora.co.uk>
References: <1432554253-25886-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59805 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752569AbbEYM1g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 May 2015 08:27:36 -0400
In-Reply-To: <1432554253-25886-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Krzysztof,

On 05/25/2015 01:44 PM, Krzysztof Kozlowski wrote:
> The IRQB of S2MPS11 PMIC is wired to XEINT4 (GPX0-4) through pull-up
> resistor.
> 
> Add interrupt properties and pinctrl configuration to enable RTC wake
> alarm of rtc-s5m driver. This also removes a warning:
> sec_pmic 4-0066: No interrupt specified, no interrupts
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> ---

I haven't checked with the board schematics but the patch
looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
