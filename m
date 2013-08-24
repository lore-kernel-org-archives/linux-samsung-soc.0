From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v2 5/5] clk/exynos5420: assign sclk_pixel id to pixel
 clock divider
Date: Sat, 24 Aug 2013 12:09:40 +0530
Message-ID: <CAPdUM4O75Qcv6DD7NNRUG2vf+hs7bs0sFX+MAReS6JH_9B7rhQ@mail.gmail.com>
References: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
	<1377241078-11808-6-git-send-email-rahul.sharma@samsung.com>
	<3550203.JkdqaguvYB@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:51504 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268Ab3HXGjl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Aug 2013 02:39:41 -0400
Received: by mail-wi0-f174.google.com with SMTP id j17so2692688wiw.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2013 23:39:40 -0700 (PDT)
In-Reply-To: <3550203.JkdqaguvYB@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On 24 August 2013 01:32, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> On Friday 23 of August 2013 12:27:58 Rahul Sharma wrote:
>> sclk_pixel is used to represent pixel clock divider on all exynos
>> SoCs not as a gate clock. It is queried in driver to pass as the
>> parent to hdmi clock while switching between parents. A new ID can
>> be asssigned Pixel gate clock which is currently not in use. Pixel
>> clock gate is default 'on'.
>
> This doesn't sound like a correct assumption, especially if you recall how
> common clock framework works - it disables any unclaimed clock
> automatically. Also we might want to support gating from power management
> reasons.
>
> IMHO you should simply export the dout_hdmi_pixel clock, keeping the
> original sclk_pixel exported as well.
>

Hi Tomasz,

Yea correct. I will export the divider clock and let hdmi driver use that
to pass as parent opf mout_pixel.

Regards,
Rahul Sharma.

> Best regards,
> Tomasz
>
