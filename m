From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Tue, 5 Mar 2013 21:24:03 +0000
Message-ID: <201303052124.04101.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303052150.24947.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:57212 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755706Ab3CEVYQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 16:24:16 -0500
In-Reply-To: <201303052150.24947.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Tuesday 05 March 2013, Heiko St=FCbner wrote:
> If I remember correctly Kgene mentioning some time back, that someone=
 was=20
> working on converting the s3c dma to dmaengine, but I never heard any=
thing=20
> more about it.

Ok, let's see if we can find out what happened to that.

> So personally I would be grateful, for people not breaking my devices=
 :-) .

I'm sure we can find a way. It's also clear that the current s3c_dma
does not have a bright future.

> On an unrelated note, exists some sort of documentation for creating =
dmaengine=20
> drivers somewhere? Documentation/* seems to always be only targetted =
at device=20
> driver writers and my own DMA knowledge is still stuck at the theoret=
ical=20
> level they teach in generic operating-systems university courses.

I think we only have Documentation/dmaengine.txt, which is targetted at
people using the dmaengine API, not at someone writing a driver.

I have only limited experience myself, but I know that it comes down
to filling the operations of a struct dma_device. A slight complication
is that the dmaengine interface handles both memory-to-memory transfers
and slave device transfers (the slave being the device that you are
talking to), and you have to know which parts are relevant for your
use case. You probably only need the slave interface, but it can seem
like it's bolted to the side of the original API.

drivers/dma/mxs-dma.c looks like a reasonable driver that one can
use as an example. The s3c64xx_dma code is also interesting because
it has both an implementation of the s3c_dma interface in
arch/arm/mach-s3c64xx/dma.c and one using the generic interface in
drivers/dma/amba-pl08x.c. The latter also implements a "virtual
channel" concept that you probably don't need.

	Arnd
