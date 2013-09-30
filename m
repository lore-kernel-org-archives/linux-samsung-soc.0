From: YouShenghui <youshenghui0322@163.com>
Subject: Re:Re: Ask for help on SPI slave side driver support
Date: Mon, 30 Sep 2013 13:38:07 +0800 (CST)
Message-ID: <1245d970.18185.1416d5fa72a.Coremail.youshenghui0322@163.com>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
 <4025277.bhF6fFGQqq@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m13-146.163.com ([220.181.13.146]:44555 "EHLO m13-146.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750825Ab3I3Fy0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 01:54:26 -0400
In-Reply-To: <4025277.bhF6fFGQqq@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org

At 2013-09-30 07:20:42,"Tomasz Figa" <tomasz.figa@gmail.com> wrote: >Hi, > >[Ccing Mark Brown, maintainer of Linux SPI subsystem] > >On Monday 30 of September 2013 00:23:32 YouShenghui wrote: >> Hi Samsung expert, >> I am working a project that need spi slave side driver support in >> smdk6410 in linux. I am connecting two 6410 board with spi bus, one >> side as master, the other as slave. Data is passed from one side to the >> other. I looked over spi related code in kernel and only find spi >> master support. I see >> http://www.spinics.net/lists/arm-kernel/msg73403.html that said there >> was already spi slave support in Samsungs current code. Could you give >> me a suggestion where I could find that code? I would like to port >> slave side support code to my code though it's not upstre
 am yet. > >Mark will probably know better, but AFAIK there is no API for slave mode >SPI available in Linux kernel. Please correct me if I'm wrong. > >The code mentioned in the post from your link was some internal vendor >code, which is unlikely to be available publicly. However support for >slave mode from hardware side seems more or less similar to master mode, >which means that assuming you can add some kernel API for it, the >modification to the spi-s3c64xx wouldn't be too big. > >Best regards, >Tomasz >
Thanks for your answer.
Yes, It will not be a big patch. But I feel hard to add the support as a application developer so I want if they could send me a small patch to make it work.
ysh
