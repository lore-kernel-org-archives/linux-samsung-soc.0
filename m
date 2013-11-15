From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] video: exynos_mipi_dsim: Remove unused variable
Date: Fri, 15 Nov 2013 08:22:23 +0530
Message-ID: <CAK9yfHw7poMXWgRYBojzWsdoTxCMRf24YjdbxBhw=gohPrtwmA@mail.gmail.com>
References: <1384463364-28864-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:33289 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196Ab3KOCw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Nov 2013 21:52:26 -0500
Received: by mail-oa0-f53.google.com with SMTP id k1so3248386oag.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Nov 2013 18:52:25 -0800 (PST)
In-Reply-To: <1384463364-28864-1-git-send-email-olof@lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "Valkeinen, Tomi" <tomi.valkeinen@ti.com>

+ Tomi

Hi Olof,

On 15 November 2013 02:39, Olof Johansson <olof@lixom.net> wrote:
> commit 7e0be9f9f7cba3356f75b86737dbe3a005da067e ('video: exynos_mipi_dsim:
> Use the generic PHY driver') resulted in a warning about an unused
> variable:
>
> drivers/video/exynos/exynos_mipi_dsi.c:144:26: warning: unused variable
>     'pdev' [-Wunused-variable]
>
> It is indeed unused; remove it.
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

I had already sent a similar patch to fix this issue [1] which is
reviewed by Kishon.
But the patch that caused the warning was in Greg's tree at that time
and he wanted
the follow up patch to go through the video tree. I have pinged Tomi yesterday
regarding this (now that his tree as well as the original patches are merged).

[1] http://www.spinics.net/lists/linux-fbdev/msg12755.html

-- 
With warm regards,
Sachin
