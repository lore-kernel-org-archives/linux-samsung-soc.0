From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/7]: Add support for SmartQ 5/7 machines (Samsung S3C6410)
Date: Mon, 8 Mar 2010 19:38:42 +0100
Message-ID: <b2e8f9f71003081038xb11250egae36cc975ce3e3f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f209.google.com ([209.85.218.209]:43223 "EHLO
	mail-bw0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755099Ab0CHSjE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 13:39:04 -0500
Received: by bwz1 with SMTP id 1so3099777bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Mar 2010 10:39:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Hi,

These patches add basic support for SmartQ machines.

In order to get wifi working, you'll need to enable multiblock in the sdhci-s3c
driver; which depends on ADMA (I never got multiblock working in PIO mode).
I'll submit this patch separately.

All other drivers seem to work, except for s3c-hsotg.

Sound support will follow later, haven't got that working fully yet.

Maurus Cuelenaere (7):
  ARM: S3C64XX: Add clock source frequency as driver data to s3c-hsotg
  USB: gadget: Increase reset timeout in s3c-hsotg
  ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
  ARM: S3C64XX: Add touchscreen platform device definition
  ARM: S3C64XX: Add s3c64xx support to touchscreen driver
  ARM: SAMSUNG: Add broken_card_detection field to HSMMC platform data
  ARM: S3C6410: Add basic support for SmartQ machines

--
Maurus Cuelenaere
