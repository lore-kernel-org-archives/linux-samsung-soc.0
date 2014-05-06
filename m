From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Update camera nodes for Trats2 board
Date: Tue, 06 May 2014 11:20:19 +0900
Message-ID: <07c701cf68d1$b9e59c40$2db0d4c0$@samsung.com>
References: <1397226348-29907-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57280 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933711AbaEFCUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 22:20:21 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5400134RTWWX80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 May 2014 11:20:20 +0900 (KST)
In-reply-to: <1397226348-29907-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sylwester Nawrocki wrote:
> 
> Remove unused /camera/clock-controller node and add required clock
> properties to the camera node. This is required for a clock provider
> that will be referenced by image sensor devices.
> Also add required clock related changes to s5k6a3 device node and
> afvdd regulator supply.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi          |    6 ++----
>  arch/arm/boot/dts/exynos4412-trats2.dts |    5 +++--
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
Applied, thanks.

- Kukjin
