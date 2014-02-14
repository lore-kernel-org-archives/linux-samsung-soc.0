From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Fri, 14 Feb 2014 19:58:33 +0100
Message-ID: <52FE6759.1040006@gmail.com>
References: <1392385032-22015-1-git-send-email-rahul.sharma@samsung.com> <1392385032-22015-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f176.google.com ([209.85.215.176]:38049 "EHLO
	mail-ea0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845AbaBNS6o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 13:58:44 -0500
In-Reply-To: <1392385032-22015-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi,

On 14.02.2014 14:37, Rahul Sharma wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> This patch add basic arch side support for exynos5260 SoC.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>   arch/arm/mach-exynos/Kconfig             |    9 +++++++++
>   arch/arm/mach-exynos/common.c            |   11 +++++++++++
>   arch/arm/mach-exynos/include/mach/map.h  |    1 +
>   arch/arm/mach-exynos/mach-exynos5-dt.c   |    1 +
>   arch/arm/plat-samsung/include/plat/cpu.h |    8 ++++++++
>   5 files changed, 30 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
