From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Tue, 12 Oct 2010 12:25:03 +0900
Message-ID: <AANLkTimp0WB+vweX8-pMVZZeHN6nD401TtkJyNthCEO5@mail.gmail.com>
References: <AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
	<20101005044304.GA26509@opensource.wolfsonmicro.com>
	<AANLkTi=x_fi5HTBBmMUv8YTxSdbgcnJ=ZbacJQj6rcgf@mail.gmail.com>
	<20101005055937.GA19989@opensource.wolfsonmicro.com>
	<AANLkTimi1t5S2XWdUFzaPttD4Hywm0SLt5CvR1YnVOjj@mail.gmail.com>
	<AANLkTin4skx+aiL2FXwWO1ekKqT2YWDd3SM1H5WnGkhC@mail.gmail.com>
	<00c401cb6520$9484ef90$bd8eceb0$%kim@samsung.com>
	<AANLkTikf4CAWm49Q_AfcfiQDBQUVcE_BC-a_4F7d8xOz@mail.gmail.com>
	<AANLkTinPXcjHcaM1puzz00Sfhob9Y-X4HGDDVGMTqhH5@mail.gmail.com>
	<AANLkTindvBBOyWwkbwUo+oG31r8xSgCLbjuDNgvTNY_Q@mail.gmail.com>
	<20101011104737.GB16777@sirena.org.uk>
	<AANLkTi=NrEm8XHWbD6UxrxxAeCtTrdwr9_KYNSBv5+nm@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:60988 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752121Ab0JLDZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 23:25:05 -0400
Received: by wye20 with SMTP id 20so1019772wye.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Oct 2010 20:25:03 -0700 (PDT)
In-Reply-To: <AANLkTi=NrEm8XHWbD6UxrxxAeCtTrdwr9_KYNSBv5+nm@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassi.brar@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>

>> I'm OK with having the code in the driver, I just want something there
>> that makes it more discoverable that it's there like a config option.
>> Having the driver log loudly when it reconfigures the EPLL would
>> probably also cover it.
>
> Thanks. Yes, we should print warning upon changing EPLL.

Okay, I'll fix this also and will re-submit today. :-)
