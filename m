From: jassi brar <jassisinghbrar@gmail.com>
Subject: clock sourcing suggestion
Date: Wed, 30 Sep 2009 11:36:27 +0900
Message-ID: <1b68c6790909291936s9fc10c2t8385f094980ef13a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.221.174]:64909 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753883AbZI3CgZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2009 22:36:25 -0400
Received: by qyk4 with SMTP id 4so4533408qyk.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2009 19:36:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

 I2S audio-bus[0,1] in s3c6410 can source clock, among other options,
 from dedicated pcm_cdclk[0,1] respectively.
 Whereas in s3c6400, both I2S audio-bus[0,1]  share one common pcm_cdclk.

The arch/arm/plat-s3c64xx/s3c6400-clock.c  makes audio-bus-0,1 share the same
pcm_cdclk(s3c6400 case).

Should we use #ifdef CPU_S3C6410 to assign proper clock sources ?
But I am afraid that might come in the way of building common kernel
for 6400 and 6410.

What should be the solution, please suggest?
