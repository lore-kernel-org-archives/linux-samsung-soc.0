From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 10:44:00 +0530
Message-ID: <CAKohpok+tNxCmy-TMRweObPLSVHECZzdgJxRh2iDWyXQCiJuqg@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<56942397.CYxnWkv4Nb@flatron>
	<CAAQKjZOg+H=Dnd3HWEWKjQq6e2UGZvX6s0waBdqsxx=CEAXtQw@mail.gmail.com>
	<3109033.iP2qIPD33v@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:42534 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446Ab3DVFOB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 01:14:01 -0400
Received: by mail-ob0-f169.google.com with SMTP id tb18so915205obb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 22:14:00 -0700 (PDT)
In-Reply-To: <3109033.iP2qIPD33v@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>

On 21 April 2013 20:13, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 3) after those two changes, all that remains is to fix compliance with
> Common Clock Framework, in other words:
>
> s/clk_enable/clk_prepare_enable/
>
> and
>
> s/clk_disable/clk_disable_unprepare/

We don't have to call  clk_{un}prepare() everytime for your platform as
you aren't doing anything in it. So just call them once at probe/remove and
call clk_enable/disable everywhere else.
