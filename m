From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] clk: samsung: add more aliases for s3c24xx
Date: Mon, 30 Jun 2014 15:50:11 +0200
Message-ID: <53B16B13.5070602@samsung.com>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
 <1403555350-14895-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27730 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752372AbaF3Nuk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:50:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Z006MEIG9RZ70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 14:50:34 +0100 (BST)
In-reply-to: <1403555350-14895-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

On 23.06.2014 22:29, Vasily Khoruzhick wrote:
> Without these aliases clock lookup fails in s3c2410fb,
> s3cmci, s3c2410-nand, s3c24xx-i2s, and i2c-s3c2410 drivers.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/samsung/clk-s3c2410.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied as a fix for 3.16.

Best regards,
Tomasz
