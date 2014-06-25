From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: fix several typos to fix boot on s3c2410
Date: Wed, 25 Jun 2014 13:26:13 +0200
Message-ID: <53AAB1D5.1090404@samsung.com>
References: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59750 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752942AbaFYL0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:26:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Q0049V2FY4WA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 12:26:22 +0100 (BST)
In-reply-to: <1403555350-14895-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

Hi Vasily,

On 23.06.2014 22:29, Vasily Khoruzhick wrote:
> There's a several typos in a driver: 2410 instead of S3C2410
> and wrong argument to ARRAY_SIZE(). They prevent s3c2410
> from properly booting.

Thanks for fixing this. I will apply and send to Mike with other fixes.
Same for patch 2/2.

Best regards,
Tomasz
