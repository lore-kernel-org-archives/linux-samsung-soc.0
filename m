From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm64: defconfig: Enable exynos thermal config
Date: Fri, 26 Feb 2016 09:34:10 +0900
Message-ID: <56CF9D82.9090808@samsung.com>
References: <1456371249-10244-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44900 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171AbcBZAeR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2016 19:34:17 -0500
In-reply-to: <1456371249-10244-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, olof@lixom.net, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 25.02.2016 12:34, Alim Akhtar wrote:
> This patch enables exynos thermal and related configs for the
> TMU found on exynos7 SoC. This also enables thermal emulation
> mode to test trip points.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/configs/defconfig |    3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied.

Krzysztof
