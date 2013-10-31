From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5 1/3] ARM: dts: Add pmu sysreg node to Exynos5 dtsi file
Date: Thu, 31 Oct 2013 13:06:57 +0100
Message-ID: <10983407.dYU06WVDXy@amdc1227>
References: <1383199250-15405-1-git-send-email-l.krishna@samsung.com>
 <1383199250-15405-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:21630 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817Ab3JaMHP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 08:07:15 -0400
In-reply-to: <1383199250-15405-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, wim@iguana.be, devicetree@vger.kernel.org, dianders@chromium.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com, sachin.kamat@linaro.org

Hi Leela,

On Thursday 31 of October 2013 11:30:48 Leela Krishna Amudala wrote:
> This patch adds pmusysreg node to Exynos5 dtsi file to handle PMU
> register accesses in a centralized way using syscon driver
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
