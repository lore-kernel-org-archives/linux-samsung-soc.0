From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V3] regulator: add device tree support for s5m8767
Date: Mon, 4 Feb 2013 12:16:05 +0530
Message-ID: <CAK9yfHx+9uu_aJTaFC2jLuFej_SvggWGDddDm-qKoetVfdfLYg@mail.gmail.com>
References: <1359935387-19065-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:40422 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752350Ab3BDGqH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 01:46:07 -0500
Received: by mail-ob0-f177.google.com with SMTP id wc18so6073953obb.36
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Feb 2013 22:46:05 -0800 (PST)
In-Reply-To: <1359935387-19065-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lrg@ti.com>, amit.kachhap@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On 4 February 2013 05:19, Amit Daniel Kachhap <amit.daniel@samsung.com> wrote:
> This device tree support is added for PMIC block of S5m8767 multi
> function driver. The usage detail is added in the device tree
> documentation section. This change is tested on exynos5250 based
> arndale platform by regulator voltage set/get API's.
>
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>

Tested this patch using [1] on Exynos4412 based Origen board and it works fine.
Feel free to add Tested-by: Sachin Kamat <sachin.kamat@linaro.org> if needed.

[1] http://patches.linaro.org/14445/

-- 
With warm regards,
Sachin
