From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] video: exynos_mipi_dsim: Remove unused variable
Date: Thu, 14 Nov 2013 17:48:42 -0800
Message-ID: <CAOesGMh2HvyHimo8=LyZ-R_W_0=XtB37hbnbx_hk0Wq+4CBhuA@mail.gmail.com>
References: <1384463364-28864-1-git-send-email-olof@lixom.net>
	<20131115013248.GA6541@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f41.google.com ([209.85.128.41]:51214 "EHLO
	mail-qe0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754773Ab3KOBsp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Nov 2013 20:48:45 -0500
Received: by mail-qe0-f41.google.com with SMTP id x7so1893976qeu.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Nov 2013 17:48:44 -0800 (PST)
In-Reply-To: <20131115013248.GA6541@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, InKi Dae <inki.dae@samsung.com>

On Thu, Nov 14, 2013 at 5:32 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Nov 14, 2013 at 01:09:24PM -0800, Olof Johansson wrote:
>> commit 7e0be9f9f7cba3356f75b86737dbe3a005da067e ('video: exynos_mipi_dsim:
>> Use the generic PHY driver') resulted in a warning about an unused
>> variable:
>>
>> drivers/video/exynos/exynos_mipi_dsi.c:144:26: warning: unused variable
>>     'pdev' [-Wunused-variable]
>>
>> It is indeed unused; remove it.
>>
>> Signed-off-by: Olof Johansson <olof@lixom.net>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  drivers/video/exynos/exynos_mipi_dsi.c |    1 -
>>  1 file changed, 1 deletion(-)
>
> I had to take the offending patch through my tree due to the phy
> changes, but I'm not the maintainer of it, nor the video mantainer, so I
> can't really take this patch through my trees, sorry.

I was wondering why you had signed off, since it didn't follow the
regular path. Makes sense.

So, looks like most historical patches to this file have gone through
Andrew. Can I get an ack from someone and just take it through arm-soc
in this case, please? Inki?


-Olof
