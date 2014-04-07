From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v6 2/3] ARM: dts: add dts files for exynos5260 SoC
Date: Mon, 7 Apr 2014 14:14:16 +0530
Message-ID: <CAK9yfHzBH9rTjJXPMM_OZhnVgpSY1Pj1Ne7Jy-v6zbp8g91zkA@mail.gmail.com>
References: <1396502277-19588-1-git-send-email-rahul.sharma@samsung.com>
	<1396502277-19588-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:62990 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753505AbaDGIoR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 04:44:17 -0400
Received: by mail-ob0-f169.google.com with SMTP id va2so6247863obc.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 01:44:16 -0700 (PDT)
In-Reply-To: <1396502277-19588-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Arun Kumar K <arun.kk@samsung.com>

On 3 April 2014 10:47, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> The patch adds the dts files for exynos5260.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
<snip>

> +/ {
> +       compatible = "samsung,exynos5260";

Add "samsung,exynos5260" to the above list.

-- 
With warm regards,
Sachin
