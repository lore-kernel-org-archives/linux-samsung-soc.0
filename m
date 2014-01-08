From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Wed, 8 Jan 2014 10:14:47 +0530
Message-ID: <CAK9yfHx+=X+DiLe_WsiDkYonKCssPTOGqR76=+7N6eyAHXyQGQ@mail.gmail.com>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:38492 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbaAHEot (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 23:44:49 -0500
Received: by mail-ob0-f177.google.com with SMTP id vb8so1196855obc.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2014 20:44:48 -0800 (PST)
In-Reply-To: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Sylwester,

On 7 January 2014 17:33, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Ensure clk->kref is dereferenced only when clk is not NULL.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Hi Sachin,
>
> please try if this patch fixes the exyno5420 boot crash.

Confirmed that this patch works fine on 5420 as well as already
working 4210 and 5250 boards.
Thanks for the quick fix.

Tested-by: Sachin Kamat <sachin.kamat@linaro.org>


-- 
With warm regards,
Sachin
