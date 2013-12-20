From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: Re-organize RTC status for 5420
Date: Fri, 20 Dec 2013 22:12:54 +0100
Message-ID: <1941342.TJqfbb7DVG@flatron>
References: <1387450673-331-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:37211 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124Ab3LTVM4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:12:56 -0500
Received: by mail-ee0-f43.google.com with SMTP id c13so1274305eek.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:12:55 -0800 (PST)
In-Reply-To: <1387450673-331-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Thursday 19 of December 2013 16:27:53 Sachin Kamat wrote:
> Some boards might not have RTC xtal, so RTC shouldn't really be
> enabled by default. Enable it in the required board files.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts     |    4 ++++
>  arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

By the way, can we expect a patch like this for Exynos 5250 to make all
Exynos SoCs consistent about this?

Best regards,
Tomasz
