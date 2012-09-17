From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-3 for v3.6
Date: Tue, 18 Sep 2012 08:20:36 +0900
Message-ID: <05c801cd952b$0b48dfb0$21da9f10$%kim@samsung.com>
References: <05be01cd9527$b35c3480$1a149d80$%kim@samsung.com>
 <CAOesGMiJGihDWpQbgJo9FYSM8FF0WY-B4PtnbE2uWwJcjWzjUA@mail.gmail.com>
 <05c501cd9528$eb916fe0$c2b44fa0$%kim@samsung.com>
 <CAOesGMgu-me77fj85apd3X9SZvTPU5+EVD2MOWwuZoaCPF9cvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45655 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754975Ab2IQXUh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 19:20:37 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAI003LSOUB6V30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 08:20:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAI00EUGOUBG270@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Sep 2012 08:20:35 +0900 (KST)
In-reply-to: <CAOesGMgu-me77fj85apd3X9SZvTPU5+EVD2MOWwuZoaCPF9cvQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
> On Mon, Sep 17, 2012 at 4:05 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > Well...I don't think so, others also should be fixed before v3.6 because
> as
> > you can see, it can occur unexpected behavior and must be wrong. But
> last
> > one is small thing...
> 
> "ARM: EXYNOS: fixed SYSMMU setup definition to mate parameter name" is
> a valid cleanup, but it has zero functional impact, it just reorders
> two unused arguments to a stub macro.
> 
> "ARM: S3C24xx: delete double assignment" is a valid bugfix, but the
> bug was introduced in "ARM: S3C2410: H1940: Use leds-gpio driver for
> LEDs managing" in 2.6.39 so fixing it in 3.7 seems just as fine as
> 3.6, in my opinion -- it's gone unnoticed so far and was just found by
> tools.
> 
> "ARM: S3C24XX: removes unnecessary semicolon" fixes a harmless extra
> semicolon after a switch statement. Valid cleanup but definitely not
> urgent for 3.6.
> 
Agreed. Let me sort out the branch for fixes soon, then re-send pull
request.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
