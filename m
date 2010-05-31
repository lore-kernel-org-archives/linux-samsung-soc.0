From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/3] ARM: S3C64XX: DMA core patches
Date: Mon, 31 May 2010 13:58:21 +0200
Message-ID: <4C03A45D.1050802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:49241 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753691Ab0EaL60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 May 2010 07:58:26 -0400
Received: by ewy8 with SMTP id 8so940968ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 May 2010 04:58:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

The first two patches add support for SDMA to the DMA core, which the crypto
engine needs to support DMA.

The third one implements behaviour that seems to be forgotten, namely stopping
and flushing pending requests on freeing a DMA channel.

Maurus Cuelenaere (3):
  ARM: S3C64XX: Add SDMA clocks
  ARM: S3C64XX: Add SDMA support to DMA core
  ARM: S3C64XX: Stop and flush requests on freeing

 arch/arm/mach-s3c64xx/clock.c |   12 +++++++++
 arch/arm/mach-s3c64xx/dma.c   |   55 ++++++++++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 12 deletions(-)
