From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] clk: samsung: Initialize clock table with error pointers
Date: Thu, 06 Feb 2014 23:21:54 +0100
Message-ID: <52F40B02.8070403@gmail.com>
References: <1391711591-19416-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f170.google.com ([209.85.215.170]:43454 "EHLO
	mail-ea0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756402AbaBFWV6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 17:21:58 -0500
Received: by mail-ea0-f170.google.com with SMTP id k10so1208871eaj.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2014 14:21:57 -0800 (PST)
In-Reply-To: <1391711591-19416-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Mike Turquette <mturquette@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On 02/06/2014 07:33 PM, Tomasz Figa wrote:
> Before this patch, the driver was simply zeroing the clock table, which
> is incorrect, because invalid clock numbers returned NULL instead of
> error pointers. This patch fixes this by changing the driver to
> initialize the array with PTR_ERR(-ENOENT).
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Acked-by: Kyungmin Park<kyungmin.park@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
