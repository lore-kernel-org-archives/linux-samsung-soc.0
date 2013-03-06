From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/2] ARM: exynos: pl330: Add #dma-cells for generic dma
 binding support
Date: Wed, 6 Mar 2013 10:43:37 +0530
Message-ID: <CAAgF-Bf+rqiFUaBD=aRqry6-2z4o0Ao2L2YRm8bu1x98TfPPyg@mail.gmail.com>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
	<201303052237.05910.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:37305 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794Ab3CFFNi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 00:13:38 -0500
Received: by mail-ie0-f173.google.com with SMTP id 9so8906567iec.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 21:13:37 -0800 (PST)
In-Reply-To: <201303052237.05910.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com, Olof Johansson <olof@lixom.net>

On Wed, Mar 6, 2013 at 4:07 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 04 March 2013, Padmavathi Venna wrote:
>>
>> This patch adds #dma-cells property to PL330 DMA controller
>> nodes for supporting generic dma dt bindings on samsung exynos
>> platforms. #dma-channels and #dma-requests are not required now
>> but added in advance.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Should we apply these directly to the arm-soc fixes branch, or wait
> until they come back from the Samsung subarchitecture tree?

Hmm, If Kukjin can take in 3.9 rc2 it's better to go via Samsung tree.

Kukjin,

Can you please take this patch in 3.9 rc2 ?

Thanks
Padma
