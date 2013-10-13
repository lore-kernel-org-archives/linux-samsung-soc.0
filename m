From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH RESEND 0/3] ARM: S3C24XX: add missing dma-devices and warning fix
Date: Sun, 13 Oct 2013 20:29:47 +0200
Message-ID: <4125349.GMtWWSIflF@flatron>
References: <201310111059.19791.heiko@sntech.de> <15184009.9QsSDOGPSA@amdn883> <20131012123329.GL2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:48719 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755141Ab3JMS3m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 14:29:42 -0400
Received: by mail-ea0-f179.google.com with SMTP id b10so2941912eae.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Oct 2013 11:29:41 -0700 (PDT)
In-Reply-To: <20131012123329.GL2443@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>

On Saturday 12 of October 2013 13:33:29 Mark Brown wrote:
> On Sat, Oct 12, 2013 at 06:36:36AM +0200, Tomasz Figa wrote:
> > Big thanks for this series and the one adding DMA engine support for
> > S3C24xx. It would be great if someone could test this on affected
> > platforms, so we could finally drop the old S3C-DMA nonsense.
> 
> Did the s3c64xx pl08x stuff get merged?

Most of. All the patches for the amba-pl08x driver got merged. Just the 
platform glue remains. I will rebase and send respective patches this 
week.

Best regards,
Tomasz
