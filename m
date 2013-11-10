From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung SoC clock drivers
Date: Mon, 11 Nov 2013 08:14:51 +0900
Message-ID: <002201cede6a$a8a183a0$f9e48ae0$%han@samsung.com>
References: <1383963454-2749-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56927 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448Ab3KJXOx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 18:14:53 -0500
In-reply-to: <1383963454-2749-1-git-send-email-tomasz.figa@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Saturday, November 09, 2013 11:18 AM, Tomasz Figa wrote:
> 
> From: Tomasz Figa <t.figa@samsung.com>
> 
> This patch adds an entry for Samsung SoC clock drivers located under
> drivers/clk/samsung/ directory, with me taking the maintainer role.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Mike Turquette <mturquette@linaro.org>
> Acked-by: Sachin Kamat <sachin.kamat@linaro.org>
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

It looks good.

Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61b8757..df7e1bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7319,6 +7319,12 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5c73m3/*
> 
> +SAMSUNG SOC CLOCK DRIVERS
> +M:	Tomasz Figa <t.figa@samsung.com>
> +S:	Supported
> +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +F:	drivers/clk/samsung/
> +
>  SERIAL DRIVERS
>  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  L:	linux-serial@vger.kernel.org
> --
> 1.8.4.2
