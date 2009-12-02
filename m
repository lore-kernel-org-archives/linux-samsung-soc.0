From: "Misael Lopez" <mlopez@sta.samsung.com>
Subject: i2s driver for s3c6410?
Date: Wed, 2 Dec 2009 17:28:05 -0600
Message-ID: <2A201BEEC85E064DA2513CADA373DB0DB0420E@mx2.telecom.sna.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailedge.sta.samsung.com ([63.166.115.9]:54269 "EHLO
	cuda2.sta.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754393AbZLBXpO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2009 18:45:14 -0500
Received: from mx2.telecom.sna.samsung.com (localhost [127.0.0.1])
	by cuda2.sta.samsung.com (Spam Firewall) with ESMTP id C142D25F086
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Dec 2009 17:28:55 -0600 (CST)
Received: from mx2.telecom.sna.samsung.com ([105.52.12.121]) by cuda2.sta.samsung.com with ESMTP id 56tsx0fmCG2XWuo1 for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Dec 2009 17:28:55 -0600 (CST)
Content-class: urn:content-classes:message
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I'm wondering what i2s platform driver to use for s3c6410. In
linux-2.6-samsung tree there are couple of directories containing it:
sound/soc/s3c and sound/soc/s3c24xx, OTOH ALSA tree only has
sound/soc/s3c24xx. Not sure why both trees differ in sound support,
I guess it's part of a migration or something.

Thanks,
-Misa
