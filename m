From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: fix several typos to fix boot on s3c2410
Date: Mon, 30 Jun 2014 15:49:58 +0200
Message-ID: <53B16B06.6070206@samsung.com>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53878 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753571AbaF3Nu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:50:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Z00MI1IFT0K70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 14:50:17 +0100 (BST)
In-reply-to: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

On 23.06.2014 22:29, Vasily Khoruzhick wrote:
> There's a several typos in a driver: 2410 instead of S3C2410
> and wrong argument to ARRAY_SIZE(). They prevent s3c2410
> from properly booting.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/samsung/clk-s3c2410.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied as a fix for 3.16.

Best regards,
Tomasz
