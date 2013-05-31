From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 5/6] clk: samsung: Add alias for mout_vpllsrc and
 reorder MUX registration for it
Date: Fri, 31 May 2013 10:20:12 -0700
Message-ID: <CAD=FV=Wcw7OArXr6mEoSWzvbhqQWGGTP88fc=kTq6iUzqj0YTQ@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
	<1370003496-19288-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:43295 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746Ab3EaRUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 13:20:14 -0400
Received: by mail-la0-f46.google.com with SMTP id er20so1618402lab.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 10:20:12 -0700 (PDT)
In-Reply-To: <1370003496-19288-6-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas and Yadwinder,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> While trying to get rate of "mout_vpllsrc" MUX (parent) for registering the
> "fout_vpll" (child), we found get rate was failing.
>
> So this patch moves the mout_vpllsrc MUX out of the existing common list
> and registers the mout_vpllsrc MUX before the PLL registrations.
> Its also adds the alias for the mout_vpllsrc MUX.

I think the moving makes sense, but not the alias.  IMHO global
aliases should be avoided unless they can be strongly justified.

In part 6 of this series I see where you're using the alias but I
don't think you need it.  In your case you are a clock provider, so I
think you can use __clk_lookup("mout_vpllsrc") to find your clock.

I will post an update on our gerrit and you can see what you think.
If someone on the list thinks that using __clk_lookup() is a bad idea
and they'd rather see the global alias, please shout.


-Doug
