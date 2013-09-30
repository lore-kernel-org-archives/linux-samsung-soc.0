From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Mon, 30 Sep 2013 16:20:33 +0530
Message-ID: <CAHbNUh2uyfQtyozbwMVbY+nxRu0mqVg+JhO5TO9GBMS-dr22Ug@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
	<1377845974-28373-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:52719 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755335Ab3I3Kue (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 06:50:34 -0400
Received: by mail-oa0-f43.google.com with SMTP id f4so3668436oah.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2013 03:50:33 -0700 (PDT)
In-Reply-To: <1377845974-28373-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, sunil joshi <joshi@samsung.com>, r.sh.open@gmail.com

On 30 August 2013 12:29, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Exynos hdmiphy operations and configs are kept inside
> the hdmi driver. Hdmiphy related code is tightly coupled
> with hdmi IP driver.
>
> This patche moves hdmiphy related code to hdmiphy driver.
> It will help in cleanly supporting the hdmiphy variations
> in further SoCs.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---

> +static const struct i2c_device_id hdmiphy_id[] = {
> +       { },
> +};
> +

[ snip ]

> +       .id_table               = hdmiphy_id,

This is fixing a regression on v3.12 kernel (same as patch 5/7 in this
series). Would you please split this and send it as a separate patch
for v3.12?

-- 
Tushar Behera
