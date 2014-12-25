From: Ming Lei <tom.leiming@gmail.com>
Subject: kernel panic when booting on exynos 5440
Date: Thu, 25 Dec 2014 16:48:31 +0800
Message-ID: <CACVXFVNCZdMyHQ1fzZDGs7h7X9vWmMVBJFRqWs7_P=WBQUYk1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:32926 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbaLYIsd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Dec 2014 03:48:33 -0500
Received: by mail-oi0-f41.google.com with SMTP id i138so15246367oig.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Dec 2014 00:48:31 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi Pankaj,

In your commit fce9e5bb2(ARM: EXYNOS: Add support for
mapping PMU base address via DT), 'pmu_base_addr' is
only parsed for very limited machines from the table of
'exynos_dt_pmu_match'.  For other boards, 'pmu_base_addr'
will keep its default value of null, then panic() is triggered.

What do you think about the problem?

Thanks,
Ming Lei
