From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix build of I2S driver
Date: Tue, 27 Nov 2012 13:05:20 +0530
Message-ID: <CAAgF-BcHKMWqgpU=SFtb4ivmgLydodS+_GM0-Z5_QM3coEErZQ@mail.gmail.com>
References: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
	<20121127064313.GV9411@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36639 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758176Ab2K0HfX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 02:35:23 -0500
Received: by mail-lb0-f174.google.com with SMTP id gi11so6387390lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Nov 2012 23:35:20 -0800 (PST)
In-Reply-To: <20121127064313.GV9411@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Nov 27, 2012 at 12:13 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Nov 27, 2012 at 09:33:43AM +0900, Kukjin Kim wrote:
>
>> I checked Samsung audio driver stuff just now. If you don't mind, I will
>> drop the patch 48a2050d ("ARM: SAMSUNG: Delete the unnecessary variable")
>> instead of applying this.
>
> That works just as well for me, thanks.  Padma, as I said in the commit
> log this should be done as part of a single patch series rather than
> sending separately to ARM or ASoC so that both trees continue to build
> at each point.

Ok. I will send as a single patch.

>
>> If any unprepared patches for Samsung audio in my tree, please let me know.
>
> Will do.

Thanks
Padma
