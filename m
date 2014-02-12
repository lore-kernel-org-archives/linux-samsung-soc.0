From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/14] mfd: sec: Add maximum RTC register for regmap
 config
Date: Wed, 12 Feb 2014 08:48:59 +0000
Message-ID: <20140212084859.GO15081@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:46564 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752358AbaBLItI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 03:49:08 -0500
Received: by mail-ea0-f174.google.com with SMTP id z10so918419ead.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 00:49:06 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392123837-5517-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> Add maximum register to the regmap used by rtc-s5m driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c          |    2 ++
>  include/linux/mfd/samsung/rtc.h |    2 ++
>  2 files changed, 4 insertions(+)

I guess some of these patches depend on some others?

When provided with their Acked-by:s, I'm happy to take this whole
patch-set and create an immutable branch for the other maintainer()s
in the set to pull from.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
