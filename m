From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] gpio/samsung: add support GPIOlib for EXYNOS5250
Date: Wed, 07 Mar 2012 04:06:37 -0800
Message-ID: <4F574F4D.5000708@samsung.com>
References: <1329341829-14403-1-git-send-email-kgene.kim@samsung.com> <1329341829-14403-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:46085 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757315Ab2CGMGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 07:06:47 -0500
Received: by obbuo6 with SMTP id uo6so6825032obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 04:06:46 -0800 (PST)
In-Reply-To: <1329341829-14403-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sangsu Park <sangsu4u.park@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

On 02/15/12 13:37, Kukjin Kim wrote:
> From: Sangsu Park<sangsu4u.park@samsung.com>
>
> This patch adds gpio_chips for EXYNOS5250 and replaces
> exynos4_xxx() with exynos_xxx() and variables to support
> exynos4 and exynos5 together.
> In addition, use ioreamp() for base address of gpios.
>
> Signed-off-by: Sangsu Park<sangsu4u.park@samsung.com>
> Cc: Grant Likely<grant.likely@secretlab.ca>

Hi Grant,

How about upstreaming this via samsung tree when sending EXYNOS5 stuff, 
I think, gpio-samsung needs still cleanup though? If any comments, 
please kindly let me know.

> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   drivers/gpio/gpio-samsung.c             |  439 +++++++++++++++++++++++++++++--
>   1 files changed, 411 insertions(+), 28 deletions(-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
