From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for v3.6
Date: Tue, 18 Sep 2012 07:40:23 -0700
Message-ID: <CAOesGMgEPJ2XRN7_TDtpbw=-iyjD-yHtN=NYLjK6KWo16yj7Wg@mail.gmail.com>
References: <50587612.4030304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:58111 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751070Ab2IROkZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 10:40:25 -0400
Received: by lagy9 with SMTP id y9so4979276lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Sep 2012 07:40:24 -0700 (PDT)
In-Reply-To: <50587612.4030304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, Sep 18, 2012 at 6:24 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> This is re-sending Samsung fixes-3 I talked to Olof before.
>
> The branch is including two commits are using spin_lock_{irqsave,
> irqrestore} in clk_set_parent() and clk_set_rate() to avoid spinlock
> recursion/locking.
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:
>
>   Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)
>
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.6-samsung-fixes-3

Thanks, pulled!


-Olof
