From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 0/2] Add sound card node Snow/Peach-pit board
Date: Fri, 16 May 2014 21:51:37 +0900
Message-ID: <04f301cf7105$934fa800$b9eef800$@samsung.com>
References: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32723 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753913AbaEPMvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 08:51:40 -0400
In-reply-to: <1399438348-10819-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org

Tushar Behera wrote:
> 
> 
> Patch 2 is dependent on Arun's following patch.
> 1. [PATCH v4 0/2] Add peach-pit board support
> http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg29948.html
> 
> Tushar Behera (2):
>   ARM: dts: Add sound node for Snow board
>   ARM: dts: Add sound node for Peach-pit board
> 
>  arch/arm/boot/dts/exynos5250-snow.dts      |   27
++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   31
> ++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> --
Looks good to me and I can see its bindings in -next.

Applied this series, thanks.

- Kukjin
