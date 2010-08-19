From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/3] h1940 series
Date: Thu, 19 Aug 2010 18:00:00 +0300
Message-ID: <1282230003-2020-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64310 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191Ab0HSPBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 11:01:51 -0400
Received: by eyg5 with SMTP id 5so1326788eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 08:01:50 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

This patch series replaces h1940-specific latch-related
functions with gpiolib, fixes compilation error for h1940-bluetooth
and adds PM support for mmc driver.
