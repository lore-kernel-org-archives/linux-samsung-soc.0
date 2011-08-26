From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 04/15] DMA: PL330: Add DMA_CYCLIC capability
Date: Fri, 26 Aug 2011 20:55:56 +0530
Message-ID: <CABb+yY2MtoxQfaXZs49161zAxuNyS7xXdMa9MNj6LZt03gK0Rg@mail.gmail.com>
References: <1314238425-6480-1-git-send-email-boojin.kim@samsung.com>
	<1314238425-6480-5-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49660 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753505Ab1HZPZ5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 11:25:57 -0400
Received: by bke11 with SMTP id 11so2626202bke.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2011 08:25:56 -0700 (PDT)
In-Reply-To: <1314238425-6480-5-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>

On Thu, Aug 25, 2011 at 7:43 AM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:

> =C2=A0static void pl330_issue_pending(struct dma_chan *chan)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 pl330_tasklet((unsigned long) to_pchan(chan));
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_chan *pch =3D to_pchan(chan);
> +
> + =C2=A0 =C2=A0 =C2=A0 pl330_tasklet((unsigned long) pch);
> =C2=A0}
This is a useless churn since v6.

Please fix this and add
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
