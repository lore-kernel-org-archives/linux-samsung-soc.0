From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Tue, 15 Jul 2014 18:55:51 +0200
Message-ID: <53C55D17.90109@samsung.com>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64962 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755461AbaGOQ4a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 12:56:30 -0400
In-reply-to: <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org

Hi Naveen,

On 14.07.2014 07:41, Naveen Krishna Chatradhi wrote:
> Since, (3146bee spi: s3c64xx: Added provision for dedicated cs pin)
> 
> spi-s3c64xx.c driver expects
> 1. chip select gpios from "cs-gpio"(singular) under the
>    "controller-data" node of the client/slave device of the SPI.

Please work a bit more on readability of your commit messages,
especially in terms of using correct terminology to avoid unnecessary
confusion.

s/'chip select gpios'/'chip select GPIO pins'/
s/'"cs-gpio"(singular)'/'"cs-gpio" property'/
s/'client/slave device of the SPI'/'SPI device'/

More things like this follow in rest of the text below.

Otherwise I believe the code after this patch does the right thing, so:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
