From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/27] pinctrl: exynos: Add driver data for Exynos3250
Date: Thu, 10 Apr 2014 20:42:28 +0200
Message-ID: <CACRpkdYiFCHFifkpRwDhdAGqBrGTU5E4mfdGE8u1c=zrim17aA@mail.gmail.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
	<1397122124-15690-9-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:47289 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752918AbaDJSm2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 14:42:28 -0400
Received: by mail-oa0-f43.google.com with SMTP id eb12so4976381oac.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 11:42:28 -0700 (PDT)
In-Reply-To: <1397122124-15690-9-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Apr 10, 2014 at 11:28 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> From: Tomasz Figa <t.figa@samsung.com>
>
> This patch adds driver data (bank list and EINT layout) for Exynos3250
> to pinctrl-exynos driver. Exynos3250 includes 158 multi-functional input/output
> ports. There are 23 general port groups.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Ugh can Tomasz send out his patches himself, I get confused...
It was also sent two times, the second time with CC:s added.
Tomasz, shall I merge this?

Yours,
Linus Walleij
