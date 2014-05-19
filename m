From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V2 0/2] ARM: dts: snow: add backlight node
Date: Tue, 20 May 2014 00:56:19 +0900
Message-ID: <537A29A3.4000302@samsung.com>
References: <1400476540-14828-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:65282 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbaESP4Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 11:56:25 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so6105304pbc.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 08:56:24 -0700 (PDT)
In-Reply-To: <1400476540-14828-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com

On 05/19/14 14:15, Ajay Kumar wrote:
> This series is based on Kukjin Kim's tree, for-next branch.
>
> This series adds:
> 	-- pinctrl definitions for pwmX_out on exynos5250
> 	-- pwm-backlight DT node for exynos5250 based snow board
>
> Changes since V1:
> 	-- Added the branch name against which patches are created.
> 	-- Rebase the patches on top of for-next branch.
>
> Ajay Kumar (2):
>    [PATCH V2 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250
>    [PATCH V2 2/2] ARM: dts: enable pwm backlight for snow
>
>   arch/arm/boot/dts/exynos5250-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5250-snow.dts     |   10 ++++++++++
>   2 files changed, 38 insertions(+)
>
As I requested before, it looks good to me, applied.

Thanks,
Kukjin
