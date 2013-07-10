From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v2 1/6] clk: samsung: move common plls registration into
 separate function
Date: Wed, 10 Jul 2013 22:29:13 +0530
Message-ID: <CAKew6eUPBUZj4TuhNAjp6NitFUaeFBZscr_jqU3Y_wLi1m7Ekg@mail.gmail.com>
References: <201307100057.06061.heiko@sntech.de>
	<201307100057.48265.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:40911 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754110Ab3GJQ7O convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jul 2013 12:59:14 -0400
Received: by mail-ie0-f174.google.com with SMTP id 9so15759559iec.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2013 09:59:13 -0700 (PDT)
In-Reply-To: <201307100057.48265.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Russell King <linux@arm.linux.org.uk>

Hi Heiko,

On Wed, Jul 10, 2013 at 4:27 AM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:
> All Samsung PLLs use similar code to register the clocks and clkdev l=
ookups.
> Therefore move these into a separate function to reduce code duplicat=
ion.
>
> Suggested-by: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

I have posted patch for adding common pll registration function
which some how missed to get merged. I hope will get merged after rc1.
Please give a look at that :
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg19543.=
html

Regards,
Yadwinder
