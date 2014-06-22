From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Boot regression on Arndale Octa
Date: Sun, 22 Jun 2014 19:55:29 +0200
Message-ID: <53A71891.2080403@gmail.com>
References: <53A7009C.3090003@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:39070 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbaFVRz5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 13:55:57 -0400
Received: by mail-wi0-f181.google.com with SMTP id n3so2985821wiv.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jun 2014 10:55:55 -0700 (PDT)
In-Reply-To: <53A7009C.3090003@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Andreas,

On 22.06.2014 18:13, Andreas F=C3=A4rber wrote:
> Hello,
>=20
> Both on kgene's for-next 053341b6993a3e838cfa35c9f594fb94ee3da9ce and=
 on
> Linus' 401c58fcbbf570e7e4a8ee0e21ffd829deb4de0b my Arndale Octa board
> fails to boot with an "Unhandled fault: synchronous external abort
> (0x210)". This is a regression from v3.15, 100% reproducible.
>=20

A couple of ideas to get more information:

 - What config do you use?
 - Does it boot with exynos devfreq disabled in kernel config?
 - Why the "> [    6.268412] clk: Not disabling unused clocks" line is
there? What's your kernel command line?
 - The log seems to start quite late. Could you provide full boot log a=
s
well?
 - Could you try bisecting the changes between 3.15 and Kukjin's for-ne=
xt?

Best regards,
Tomasz
