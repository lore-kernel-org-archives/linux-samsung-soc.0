From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: Add exynos5422-odroidxu4 board
Date: Wed, 2 Sep 2015 10:01:42 +0200
Message-ID: <55E6ACE6.3030709@osg.samsung.com>
References: <1441157405-22123-1-git-send-email-k.kozlowski@samsung.com>
 <1441157405-22123-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33686 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753280AbbIBIBs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Sep 2015 04:01:48 -0400
In-Reply-To: <1441157405-22123-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux.amoon@gmail.com, cw00.choi@samsung.com, inki.dae@samsung.com, p.marczak@samsung.com, m.szyprowski@samsung.com

Hello Krzysztof,

On 09/02/2015 03:30 AM, Krzysztof Kozlowski wrote:
> Add Hardkernel Odroid XU4 board Device Tree sources. The board differs
> from Odroid XU3 and XU3-Lite by:
> 1. No green and red leds (except standard red power led).
> 2. No audio codec.
> 3. Two USB3 ports in host mode (no micro USB3 connector for OTG).
> 4. Realtek RTL8153-CG gigabit network adapter (instead of SMSC9514).
> 5. Additional connector with IO ports (I2S_0, I2C_5).
> 6. No DisplayPort (like XU3-Lite).
> 7. No TI INA231 power measurement sensors (like XU3-Lite).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
