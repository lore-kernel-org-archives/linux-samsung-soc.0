From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Add save/restore infra for system
 registers for Exynos5420
Date: Tue, 3 Dec 2013 17:25:19 +0530
Message-ID: <CAK9yfHyaZV7ChxytPSQqRTwO6Hr3cLcBj4pG6z1gPhnvHvDT5g@mail.gmail.com>
References: <1386070848-13083-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36824 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753484Ab3LCLzU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 06:55:20 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so14404914obc.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2013 03:55:20 -0800 (PST)
In-Reply-To: <1386070848-13083-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

On 3 December 2013 17:10, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Ajay Kumar <ajaykumar.rs@samsung.com>
>
> Added exynos5420_sys_save[] structure for system registers on Exynos5420.
> We save the values of all the system registers present in the list
> exynos5420_sys_save[], and we restore these values on resume.
>
> As of now, we have added save/restore entry for EXYNOS5_SYS_DISP1_BLK_CFG.
>
> NOTE: Restoring of EXYNOS5_SYS_DISP1_BLK_CFG was not done on Exynos5250
> because we use MIE path on Exynos5250 and the default reset value of
> EXYNOS5_SYS_DISP1_BLK_CFG is set to use MIE.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Tested-by: Prathyush Kalashwaram <prathyush@chromium.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---

Please ignore this patch for now. Got sent out wrongly.

-- 
With warm regards,
Sachin
