From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/5] h1940 series
Date: Tue,  7 Sep 2010 18:00:00 +0300
Message-ID: <1283871605-32068-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:39112 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756757Ab0IGPAz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 11:00:55 -0400
Received: by ewy23 with SMTP id 23so2373332ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2010 08:00:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

This series converts latch API to generic gpiolib API,
improves power management and adds sound codec device
for h1940.
