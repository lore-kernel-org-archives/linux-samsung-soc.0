From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Pending rtc-s3c patches
Date: Sun, 1 Nov 2015 20:36:51 +0900
Message-ID: <5635F953.6080702@samsung.com>
References: <20151028101449.GA13014@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34632 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453AbbKALg4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2015 06:36:56 -0500
Received: by padec8 with SMTP id ec8so9446951pad.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2015 03:36:55 -0800 (PST)
In-Reply-To: <20151028101449.GA13014@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: k.kozlowski.k@gmail.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com

W dniu 28.10.2015 o 19:14, Alexandre Belloni pisze:
> Hi,
> 
> There are three pending patches (from 2010 and 2011) for rtc-s3c. I'd
> like to get an update and either drop or apply those.
> 
> Can someone take a few minutes to review them?
> 
> The patches are:
> http://patchwork.ozlabs.org/patch/71318/

This is not needed. The pie_lock (replacing s3c_rtc_pie_lock) protects
set_freq() which:
1. is called only during probe;
2. is accessing different registers than s3c_rtc_setaie().


> http://patchwork.ozlabs.org/patch/99857/

This is good although does not apply cleanly. I rebased, tested and send
the patch.

> http://patchwork.ozlabs.org/patch/101732/

This does not look good. Code is actually used so commit description
does not match current state. I think you can ignore it.

Best regards,
Krzysztof
