From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 08:33:34 +0530
Message-ID: <CAK9yfHywzpbuYag4RM_00Z5UdQ0qY3y0iDzyY1Yt8KYh83Z3pA@mail.gmail.com>
References: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:48263 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753700Ab3I3DDf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 23:03:35 -0400
Received: by mail-oa0-f43.google.com with SMTP id f4so3550214oah.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Sep 2013 20:03:35 -0700 (PDT)
In-Reply-To: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jungseok Lee <jays.lee@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 30 September 2013 07:02, Jungseok Lee <jays.lee@samsung.com> wrote:

> +       /* turn off all power domains */
> +       addr = of_iomap(np, 0) + 0x14;
> +       __raw_writel(0x1, addr);

Actually my comment was more about mentioning what these above values
especially 0x14 represented? Either using a macro (preferred way) or
atleast a comment.

-- 
With warm regards,
Sachin
