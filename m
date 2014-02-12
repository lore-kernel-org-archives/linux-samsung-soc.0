From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/14] mfd: sec: Use consistent S2MPS11 RTC alarm
 interrupt indexes
Date: Wed, 12 Feb 2014 09:07:46 +0000
Message-ID: <20140212090746.GR15081@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-6-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:37509 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751909AbaBLJH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 04:07:57 -0500
Received: by mail-ea0-f179.google.com with SMTP id q10so3646914ead.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 01:07:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392123837-5517-6-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


> The S2MPS11 RTC has two alarms: alarm0 and alarm1 (corresponding
> interrupts are named similarly). Use consistent names for interrupts =
to
> limit possible errors.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-irq.c           |    8 ++++----
>  include/linux/mfd/samsung/irq.h |    4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

<snip>

>  #define S2MPS11_IRQ_RTC60S_MASK		(1 << 0)
>  #define S2MPS11_IRQ_RTCA1_MASK		(1 << 1)
> -#define S2MPS11_IRQ_RTCA2_MASK		(1 << 2)
> +#define S2MPS11_IRQ_RTCA0_MASK		(1 << 2)

This doesn't look correct to me.

>  #define S2MPS11_IRQ_SMPL_MASK		(1 << 3)
>  #define S2MPS11_IRQ_RTC1S_MASK		(1 << 4)
>  #define S2MPS11_IRQ_WTSR_MASK		(1 << 5)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
