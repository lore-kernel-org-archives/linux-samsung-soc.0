From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v6 13/20] pwm: Add new pwm-samsung driver
Date: Thu, 8 Aug 2013 10:13:27 -0700
Message-ID: <CAL1qeaH=r0Yr-8gqy+QctvaM_1awT1aHjT_HjXA71sjpK4BJHg@mail.gmail.com>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com>
	<1374623475.SoL01ZHzWk@flatron>
	<CAL1qeaF1Mxs_Q6QnLznW3SoXBoNhBb+gCYMESMgx6g+bUFVCmQ@mail.gmail.com>
	<4144776.HcbubHMX0J@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:62295 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965361Ab3HHRN3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Aug 2013 13:13:29 -0400
Received: by mail-bk0-f46.google.com with SMTP id 6so1082725bkj.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2013 10:13:27 -0700 (PDT)
In-Reply-To: <4144776.HcbubHMX0J@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

> ..it should not be defined as non-static in this case (= an ifdef is
> needed in this header). I believe I had this already fixed, not sure what
> happened with the fix...

Perhaps this is it: https://patchwork.kernel.org/patch/2787271/.  That
should probably land with this patchset too.

Thanks,
Andrew
