From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/7] ARM: S3C24XX: H1940 and RX1950 series
Date: Thu,  6 Jan 2011 21:52:45 +0200
Message-ID: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35968 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752915Ab1AFTy3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:29 -0500
Received: by eye27 with SMTP id 27so7378165eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:28 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

This series improves HP iPAQ H1940 and RX1950 support.

Changes introduced by these patches:
1. Add support for H1940 buttons
2. Compile fix for h1940-bluetooth.c
3. Use leds-gpio to drive LEDs on H1940
4. Add support for battery monitoring and charging on H1940
5. Improve LCD power-on sequence
6. Retain LEDs state on RX1950 in suspend
7. Add support for HW LEDs blinking on RX1950
