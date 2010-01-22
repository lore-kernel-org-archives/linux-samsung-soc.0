From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/4] Add s3c64xx support to touchscreen driver
Date: Fri, 22 Jan 2010 23:47:05 +0100
Message-ID: <b2e8f9f71001221447r56b29abboa81736fb1451cdde@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:41709 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752994Ab0AVWr2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2010 17:47:28 -0500
Received: by bwz27 with SMTP id 27so1517211bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jan 2010 14:47:26 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

Hi,

these patches add support for the s3c64xx platforms to the touchscreen driver.
This was based on next-samsung in Ben Dook's tree.

These depend on:
[PATCH] ARM: SAMSUNG: Fix null pointer dereference in ADC driver

I'm not quite sure regarding the resources in patch 3, perhaps these should be
somehow shared with the ADC driver? (I also can't seem to figure out how the
s3c24xx handles this at the moment..)

Regards,
Maurus Cuelenaere
