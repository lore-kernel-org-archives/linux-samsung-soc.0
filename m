From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi/s3c64xx: Convert to devm_request_and_ioremap()
Date: Thu, 05 Jul 2012 14:47:02 +0200
Message-ID: <4FF58CC6.3010509@samsung.com>
References: <1341491593-6781-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63439 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932530Ab2GEMrH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jul 2012 08:47:07 -0400
Received: from eusync1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6O00DWVU7A2I80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Jul 2012 13:47:34 +0100 (BST)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0M6O00BCUU6FI430@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Jul 2012 13:47:05 +0100 (BST)
In-reply-to: <1341491593-6781-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net

Hi,

On 07/05/2012 02:33 PM, Mark Brown wrote:
> Saves some error handling and a small amount of code.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--
Regards,
Sylwester
