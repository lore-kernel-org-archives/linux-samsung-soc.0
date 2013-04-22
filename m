From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 15:56:35 +0530
Message-ID: <CAKohpokRzQLhmdi7o=ytuw9M62TvDGqp2TSmAnEE5AM3E2nq5g@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<3109033.iP2qIPD33v@flatron>
	<CAKohpok+tNxCmy-TMRweObPLSVHECZzdgJxRh2iDWyXQCiJuqg@mail.gmail.com>
	<1731019.P1JXV7Hkkn@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:56930 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218Ab3DVK0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 06:26:36 -0400
Received: by mail-oa0-f49.google.com with SMTP id j1so3236081oag.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 03:26:35 -0700 (PDT)
In-Reply-To: <1731019.P1JXV7Hkkn@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: dri-devel@lists.freedesktop.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, "patches@linaro.org" <patches@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>

On 22 April 2013 15:26, Tomasz Figa <t.figa@samsung.com> wrote:
> Can you assure that in future SoCs, on which this driver will be used, this
> assumption will still hold true or even that in current Exynos driver this
> behavior won't be changed?

Probably yes.. Registers for enabling/disabling these clocks should always
be on AMBA bus and not on SPI/I2C, i.e. on-soc... and so this will hold
true.
