From: Olof Johansson <olof@lixom.net>
Subject: Booting mainline kernels on Samsung ARM-based Chromebooks
Date: Tue, 28 May 2013 17:34:30 -0700
Message-ID: <CAOesGMgrT8fCRcnJYP=tcr4Szp5B6NtQxsQeb6pEv24edHLYFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:46986 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757444Ab3E2Aec (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 20:34:32 -0400
Received: by mail-wg0-f49.google.com with SMTP id y10so6207217wgg.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 May 2013 17:34:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Just a quick note that as of v3.10-rc4 (or -rc3 + arm-soc fixes
branch) there should be enough pieces in mainline to boot a Chromebook
to a useful state without out-of-tree patches.

For more info, see:

https://plus.google.com/u/0/109993695638569781190/posts/bQpzEGG15G8

There's plenty of stuff not working yet, but it'll come up with
simplefb, keyboard, trackpad and USB 2.0 for now.


-Olof
