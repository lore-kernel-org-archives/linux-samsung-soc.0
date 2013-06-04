From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 2/4] clk: samsung: register audio subsystem clocks
 using common clock framework
Date: Mon, 3 Jun 2013 17:07:26 -0700
Message-ID: <CAD=FV=Wu6u=gvh5Anut8MtC+Bb43EG7hxRN=vs-ML35P1qTJYQ@mail.gmail.com>
References: <1370236744-16802-1-git-send-email-padma.v@samsung.com>
	<1370236744-16802-3-git-send-email-padma.v@samsung.com>
	<CAD=FV=XOfi=BsaF+-96SqKwyiwP9h0h3MCJxJ+qWNKaGoP=CcA@mail.gmail.com>
	<CAL1qeaEkomoDQPyGqqLL-WzoLS=nND-eXeRAGD2HpoV6WW3yRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:65325 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754049Ab3FDAH2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 20:07:28 -0400
Received: by mail-lb0-f181.google.com with SMTP id 13so44687lba.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 17:07:27 -0700 (PDT)
In-Reply-To: <CAL1qeaEkomoDQPyGqqLL-WzoLS=nND-eXeRAGD2HpoV6WW3yRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

Andrew,

On Mon, Jun 3, 2013 at 4:46 PM, Andrew Bresticker <abrestic@chromium.org> wrote:
>> I think this is supposed to be "xxti" which might or might not be
>> "fin_pll".  In the exynos4 code these are two different clocks that
>> are chosen by OM[0].  I'd bet that 99% of the time they are the same,
>> but it seems better to use "xxti".
>
> OM[0] also appears to mux the input here between "xxti" and "xusbxti"
> as well.  So this should probably remain "fin_pll".

Thanks!  ...so I'm OK with this landing "as-is" or a re-spin with nits
fixed, since all of the rest of my comments were just nits...
