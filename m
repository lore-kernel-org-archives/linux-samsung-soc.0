From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: SMDK6440: I2C writes fails
Date: Wed, 23 Jun 2010 11:15:55 +0530
Message-ID: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:36621 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873Ab0FWFqR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 01:46:17 -0400
Received: by vws9 with SMTP id 9so456036vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 22:46:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Hi Mark,

I was adding I2C support on SMDK6440 and found this removing the 1ms delay
is causing I2C write and reads to fail..

http://www.mail-archive.com/linux-i2c@vger.kernel.org/msg03070.html

[root@Samsung mars]# date | ./eeprog /dev/i2c-0 0x50 -w 0x200 -f
eeprog 0.7.6, a 24Cxx EEPROM reader/writer
Copyright (c) 2003-2004 by Stefano Barbato - All rights reserved.
  Bus: /dev/i2c-0, Address: 0x50, Mode: 8bit
  Writing stdin starting at address 0x200
..Error i2c_write_2b: No such device or address
Error at line 150: write error
[root@Samsung mars]#

Where should i be looking,
Will changing the spin counts work?
Can you please help me with this.

-- 
Shine bright,
(: Naveen Krishna Ch :)
