From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 02/10] 2nd irq-s3c24xx for v3.10
Date: Tue, 9 Apr 2013 22:21:10 +0200
Message-ID: <201304092221.10650.arnd@arndb.de>
References: <516309D9.7000609@samsung.com> <201304092219.54078.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:52578 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754639Ab3DIUVW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 16:21:22 -0400
In-Reply-To: <201304092219.54078.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tuesday 09 April 2013, Arnd Bergmann wrote:
> On Monday 08 April 2013, Kukjin Kim wrote:
> > s3c24xx irq cleanup and move into drivers/irqchip
> 
> I had a little trouble applying this because of the interface change to
> CLOCKSOURCE_OF_DECLARE. This is the rather complex merge I did. Please
> check that it still works.

The reply should have been for patch 3/10. I've merged both into the
next/drivers branch.

	Arnd
