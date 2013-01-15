From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 4/5] mmc: dw_mmc: Handle wp-gpios from device tree
Date: Mon, 14 Jan 2013 22:27:55 -0800
Message-ID: <20130115062755.GC20105@quad.lixom.net>
References: <1357842269-15062-1-git-send-email-dianders@chromium.org>
 <1357923834-31641-1-git-send-email-dianders@chromium.org>
 <1357923834-31641-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:53723 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756107Ab3AOG1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 01:27:54 -0500
Received: by mail-pb0-f51.google.com with SMTP id ro12so2672205pbb.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jan 2013 22:27:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1357923834-31641-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Will Newton <will.newton@imgtec.com>, Chris Ball <cjb@laptop.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, Jan 11, 2013 at 09:03:53AM -0800, Doug Anderson wrote:
> On some SoCs (like exynos5250) you need to use an external GPIO for
> write protect.  Add support for wp-gpios to the core dw_mmc driver
> since it could be useful across multiple SoCs.
> 
> With this change I am able to make use of the write protect for the
> external SD slot on exynos5250-snow.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Seungwon Jeon <tgih.jun@samsung.com>

Acked-by: Olof Johansson <olof@lixom.net>
