From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 5/5] clk/exynos5420: assign sclk_pixel id to pixel clock divider
Date: Fri, 23 Aug 2013 22:02:40 +0200
Message-ID: <3550203.JkdqaguvYB@flatron>
References: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com> <1377241078-11808-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:39900 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754530Ab3HWUCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 16:02:46 -0400
Received: by mail-bk0-f51.google.com with SMTP id mx10so402308bkb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2013 13:02:45 -0700 (PDT)
In-Reply-To: <1377241078-11808-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, joshi@samsung.com, inki.dae@samsung.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Friday 23 of August 2013 12:27:58 Rahul Sharma wrote:
> sclk_pixel is used to represent pixel clock divider on all exynos
> SoCs not as a gate clock. It is queried in driver to pass as the
> parent to hdmi clock while switching between parents. A new ID can
> be asssigned Pixel gate clock which is currently not in use. Pixel
> clock gate is default 'on'.

This doesn't sound like a correct assumption, especially if you recall how 
common clock framework works - it disables any unclaimed clock 
automatically. Also we might want to support gating from power management 
reasons.

IMHO you should simply export the dout_hdmi_pixel clock, keeping the 
original sclk_pixel exported as well.

Best regards,
Tomasz
