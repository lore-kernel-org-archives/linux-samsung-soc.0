From: YouShenghui <youshenghui0322@163.com>
Subject: Ask for help on SPI slave side driver support
Date: Mon, 30 Sep 2013 00:23:32 +0800 (CST)
Message-ID: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m13-51.163.com ([220.181.13.51]:58988 "EHLO m13-51.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753234Ab3I2Qim (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 12:38:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-spi@vger.kernel.org, youshenghui0322@163.com

Hi Samsung expert,
I am working a project that need spi slave side driver support in smdk6410 in linux.
I am connecting two 6410 board with spi bus, one side as master, the other as slave. Data is passed from one side to the other.
I looked over spi related code in kernel and only find spi master support.
I see http://www.spinics.net/lists/arm-kernel/msg73403.html that said there was already spi slave support in Samsungs current code.
Could you give me a suggestion where I could find that code? I would like to port slave side support code to my code though it's not upstream yet.

thanks
ysh
