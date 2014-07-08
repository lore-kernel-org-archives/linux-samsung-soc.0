From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: Samsung: ADC: Move to
 clk_prepare_enable/clk_disable_unprepare
Date: Tue, 08 Jul 2014 13:49:31 +0200
Message-ID: <53BBDACB.6090601@samsung.com>
References: <1404155288-2787-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37567 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322AbaGHLuE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 07:50:04 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8E00CEX67AOE90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Jul 2014 12:49:59 +0100 (BST)
In-reply-to: <1404155288-2787-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Hi Vasily,

On 30.06.2014 21:08, Vasily Khoruzhick wrote:
> Use clk_prepare_enable/clk_disable_unprepare to make the driver
> work properly with common clock framework.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/plat-samsung/adc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
