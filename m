From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/7] pinctrl: exynos: add exynos5260 SoC specific data
Date: Mon, 9 Dec 2013 10:21:55 +0530
Message-ID: <CAK9yfHxJP8gUpvngcT-iu3j0+=J60X3DojRe9OXb3uek+VVqaQ@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
	<1386345391-23482-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:50789 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760320Ab3LIEvz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Dec 2013 23:51:55 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so3311009oag.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Dec 2013 20:51:55 -0800 (PST)
In-Reply-To: <1386345391-23482-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, yg1004.jang@samsung.com, Arun Kumar <arun.kk@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul, Young-Gun,

On 6 December 2013 21:26, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Young-Gun Jang <yg1004.jang@samsung.com>
>
> Add Samsung Exynos5260 SoC specific data to enable pinctrl
> support for all platforms based on EXYNOS5260.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

Author's (Young-Gun Jang) signed-off by is missing here.

[snip]

> +
> +/* pin banks of exynos5260 pin-controller 2 */
> +static struct samsung_pin_bank exynos5260_pin_banks2[] = {
> +       EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz0", 0x00),
> +       EXYNOS_PIN_BANK_EINTG(4, 0x020, "gpz1", 0x04),
> +};
> +
> +/*
> + * Samsung pinctrl driver data for Exynos5260 SoC. Exynos5420 SoC includes

s/5420/5260 ?

-- 
With warm regards,
Sachin
