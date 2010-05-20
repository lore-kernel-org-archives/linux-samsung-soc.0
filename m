From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 1/7] ARM: S5PV210: add support for software reset
Date: Thu, 20 May 2010 15:25:59 +0900
Message-ID: <AANLkTin2tClftHdVdrlWCuLl2F1Q7WltxTxGngN_b_hB@mail.gmail.com>
References: <1274079195-18105-1-git-send-email-m.szyprowski@samsung.com>
	 <1274079195-18105-2-git-send-email-m.szyprowski@samsung.com>
	 <010101caf7e4$bd6ef490$384cddb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38013 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826Ab0ETG0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 02:26:00 -0400
Received: by vws9 with SMTP id 9so4488932vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 May 2010 23:25:59 -0700 (PDT)
In-Reply-To: <010101caf7e4$bd6ef490$384cddb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

>
> But Samsung SoC hardware engineer recommends to use the reset of watchdog
> instead of software reset by restriction of Hardware environment.

that's optional method for each board. If software reset doesn't work.
we can provide the watchdog reset additionally
.

In our case we use the watchdog reset for other purpose so we don't
want to use watchdog reset at normal reset condition.

Thank you,
Kyungmin Park
