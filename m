From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Remove vmmc-supply for mmc@12220000 on
 arndale-octa board
Date: Tue, 13 May 2014 14:26:33 +0900
Message-ID: <073701cf6e6b$e7407170$b5c15450$@samsung.com>
References: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
 <535AC29E.8010905@gmail.com>
 <20140425203051.GD3027@e102654-lin.cambridge.arm.com>
 <535AC717.40805@gmail.com>
 <20140425204135.GF3027@e102654-lin.cambridge.arm.com>
 <0b5c01cf6141$687f5ea0$397e1be0$@samsung.com>
 <CAK9yfHz5bkyTUr3Y=q8msuY_ciAjv5=n7dtf7DhTwgDxntOMNQ@mail.gmail.com>
 <20140428105511.GA17293@e102654-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55924 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbaEMF0i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 01:26:38 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5H00948Z4A3U50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 May 2014 14:26:34 +0900 (KST)
In-reply-to: <20140428105511.GA17293@e102654-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javi Merino' <javi.merino@arm.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Ben Dooks' <ben-linux@fluff.org>

Javi Merino wrote:
> 
> Hi Sachin,

Hi Sachin and Javi,

[...]

> >
> > You need the following patch to mount the MMC. Without this the
> regulator will
> > not be enabled which is required by MMC.
> >
> > ARM: exynos_defconfig: Enable HS-I2C
> > http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/27527
> 
> Yes, that's the bit that I was missing.  With that patch 3.15-rc2
> boots on my Arndale Octa.
> 
> > Kukjin, can you please apply this patch?
> 
> You can add my Tested-by for Arndale Octa.
> 
OK, agreed. I will apply the enable HS-I2C on exynos_defconfig with Javi's test tag.

Thanks,
Kukjin
