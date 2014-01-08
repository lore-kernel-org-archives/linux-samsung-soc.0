From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH RESEND v2 01/12] ARM: exynos4: create a DT header defining CLK IDs
Date: Wed, 08 Jan 2014 01:53:45 +0100
Message-ID: <3865861.S9945P5El3@flatron>
References: <1389106060-20291-1-git-send-email-a.hajda@samsung.com> <1389106060-20291-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:43411 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754280AbaAHAxv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 19:53:51 -0500
In-Reply-To: <1389106060-20291-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

On Tuesday 07 of January 2014 15:47:29 Andrzej Hajda wrote:
> The patch adds header file defining clock IDs.
> This allows to use macros instead of magic numbers in DT bindings.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  include/dt-bindings/clock/exynos4.h | 244 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 244 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos4.h
> 
> diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
> new file mode 100644
> index 0000000..75aff33
> --- /dev/null
> +++ b/include/dt-bindings/clock/exynos4.h
> @@ -0,0 +1,244 @@
> +/*
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + * Author: Andrzej Haja <a.hajda@samsung.com>
> + *

Oops, seems like you made a typo in your name here. Let me fix this
when applying. ;)

Best regards,
Tomasz
