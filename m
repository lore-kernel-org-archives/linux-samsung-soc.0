From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Add rear camera nodes for Exynos4412 Trats2 board
Date: Tue, 06 May 2014 11:19:40 +0900
Message-ID: <07ba01cf68d1$a2d47580$e87d6080$@samsung.com>
References: <1397226303-29844-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45214 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933711AbaEFCTm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 22:19:42 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N54006H5RSTNCA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 May 2014 11:19:41 +0900 (KST)
In-reply-to: <1397226303-29844-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Andrzej Hajda' <a.hajda@samsung.com>

Sylwester Nawrocki wrote:
> 
> This patch enables the rear facing camera (s5c73m3) on TRATS2 board
> by adding the I2C0 bus controller, s5c73m3 sensor, MIPI CSI-2 receiver
> and the sensor's voltage regulator supply nodes.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts |   72
> +++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
> 
Applied, thanks.

- Kukjin
