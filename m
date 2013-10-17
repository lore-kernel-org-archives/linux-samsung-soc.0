From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi: spi-s3c64xx: Add missing pm_runtime_put on setup fail
Date: Thu, 17 Oct 2013 14:48:07 +0200
Message-ID: <525FDC87.1050402@samsung.com>
References: <1382013941-861-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25892 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755016Ab3JQMsM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 08:48:12 -0400
In-reply-to: <1382013941-861-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/10/13 14:45, Krzysztof Kozlowski wrote:
> pm_runtime_put() wasn't called if clock rate could not be set up in
> s3c64xx_spi_setup() leading to invalid count of device pm_runtime usage.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
