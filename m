From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi/s3c64xx: Add missing pm_runtime_set_active() call in
 probe()
Date: Thu, 17 Oct 2013 18:10:58 +0200
Message-ID: <52600C12.3000606@samsung.com>
References: <1382026006-15544-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29048 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757569Ab3JQQLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 12:11:03 -0400
In-reply-to: <1382026006-15544-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 17/10/13 18:06, Krzysztof Kozlowski wrote:
> Mark device as PM runtime active during initialization to reflect
> actual device power/clocks state. This reduces the enable count for SPI
> bus controller gate clock so it can be disabled when the bus controller
> is not used.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
