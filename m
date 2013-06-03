From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V4 2/4] clk: samsung: register audio subsystem clocks
 using common clock framework
Date: Mon, 3 Jun 2013 16:46:09 -0700
Message-ID: <CAL1qeaEkomoDQPyGqqLL-WzoLS=nND-eXeRAGD2HpoV6WW3yRQ@mail.gmail.com>
References: <1370236744-16802-1-git-send-email-padma.v@samsung.com>
	<1370236744-16802-3-git-send-email-padma.v@samsung.com>
	<CAD=FV=XOfi=BsaF+-96SqKwyiwP9h0h3MCJxJ+qWNKaGoP=CcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:48921 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754049Ab3FCXqL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 19:46:11 -0400
Received: by mail-bk0-f41.google.com with SMTP id jc3so518147bkc.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 16:46:10 -0700 (PDT)
In-Reply-To: <CAD=FV=XOfi=BsaF+-96SqKwyiwP9h0h3MCJxJ+qWNKaGoP=CcA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

>> +static unsigned long reg_save[][2] = {
>> +       {ASS_CLK_SRC,  0},
>> +       {ASS_CLK_DIV,  0},
>> +       {ASS_CLK_GATE, 0},
>> +};
>> +
>> +/* list of all parent clock list */
>> +static const char *mout_audss_p[] = { "fin_pll", "fout_epll" };
>
> I think this is supposed to be "xxti" which might or might not be
> "fin_pll".  In the exynos4 code these are two different clocks that
> are chosen by OM[0].  I'd bet that 99% of the time they are the same,
> but it seems better to use "xxti".

OM[0] also appears to mux the input here between "xxti" and "xusbxti"
as well.  So this should probably remain "fin_pll".

> At the moment the 5250 code doesn't expose "xxti".  It probably
> should.  Andrew (CCed) is looking at this.

Yes, xxti is used directly elsewhere (SPI and UART, from what I can
tell), but not here.

-Andrew
