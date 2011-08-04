From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 00/15] To use DMA generic APIs for Samsung DMA
Date: Thu, 4 Aug 2011 18:53:51 +0200
Message-ID: <CACRpkdZvbH1O608n_aa_nVi-Onhmt0Ay6X1yCgBVNES4o9hTrA@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:41317 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753596Ab1HDQxw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2011 12:53:52 -0400
Received: by qyk38 with SMTP id 38so914555qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Aug 2011 09:53:51 -0700 (PDT)
In-Reply-To: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>

On Wed, Jul 27, 2011 at 7:31 AM, Boojin Kim <boojin.kim@samsung.com> wrote:

> This patchset adds support DMA generic APIs for Samsung DMA.

Patches look good to me,
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are there any more users of the code in arch/arm/common/pl330.c?
Else I think next step should be to move that file to drivers/dma/
and optionally merge it with the other pl330.c file there.

Thanks!
Linus Walleij
