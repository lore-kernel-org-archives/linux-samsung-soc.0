From: kgene@kernel.org
Subject: RE: [GIT PULL 6/7] Samsung DT for v3.14
Date: Tue, 17 Dec 2013 21:26:49 +0900
Message-ID: <117501cefb23$42739020$c75ab060$@kernel.org>
References: <52AE0F9A.3010407@samsung.com> <20131216171645.GJ3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14612 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753246Ab3LQM0v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 07:26:51 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXY00KFMAKQG050@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Dec 2013 21:26:50 +0900 (KST)
In-reply-to: <20131216171645.GJ3185@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org

Mark Brown wrote:
> 
> On Mon, Dec 16, 2013 at 05:22:50AM +0900, Kukjin Kim wrote:
> 
> > Samsung DT updates for v3.14
> > - Add support Octa Cores for exynos5420
> >   : populate CPU node entries to 8 Cores
> >   : extend mct to support 8 local interrupts
> > - Update dwmmc nodes for exynos5250 and exynos5420
> >   : change status property of dwmmc nodes for exynos5250
> >   : move dwmmc nodes from exynos5 to exynos5250 because
> >     it's different between exynos5250 and exynos5420
> >   : rename mmc nodes from dwmmc for exynos5 SoCs
> >   : add dwmmc nodes for exynos5420
> > - Add G-Scaler nodes for exynos5420
> > - Add HS-i2c nodes in exynos5420
> >   : High Speed I2C 7 channels (4 to 10)
> > - Update sysreg binding and node name in exynos4
> > - Update min voltage on exynos5250-arndale
> > - Move fifo-depth property from boards to exynos5250 SoC
> >   : because the fifo-depth property is SoC specific
> 
> I've been sending updates to disable the I2C and SPI devices by default
> on 5250 for some time now - is there any chance of getting them
> included?

Probably, yes and I will send out 2nd round for v3.14 in this weekend before
rc5 release ;-)

Thanks,
Kukjin
