From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Wed, 06 Oct 2010 15:34:47 +0900
Message-ID: <00c401cb6520$9484ef90$bd8eceb0$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286194583-19937-1-git-send-email-sw.youn@samsung.com>
 <20101004224159.GA4972@opensource.wolfsonmicro.com>
 <AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
 <AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
 <20101005044304.GA26509@opensource.wolfsonmicro.com>
 <AANLkTi=x_fi5HTBBmMUv8YTxSdbgcnJ=ZbacJQj6rcgf@mail.gmail.com>
 <20101005055937.GA19989@opensource.wolfsonmicro.com>
 <AANLkTimi1t5S2XWdUFzaPttD4Hywm0SLt5CvR1YnVOjj@mail.gmail.com>
 <AANLkTin4skx+aiL2FXwWO1ekKqT2YWDd3SM1H5WnGkhC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58150 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932094Ab0JFGeb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 02:34:31 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9U00KQBVLIM600@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Oct 2010 15:34:30 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9U0068QVLIZB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Oct 2010 15:34:30 +0900 (KST)
In-reply-to: <AANLkTin4skx+aiL2FXwWO1ekKqT2YWDd3SM1H5WnGkhC@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <claude.youn@gmail.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Seungwhan Youn' <sw.youn@samsung.com>, alsa-devel@alsa-project.org, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

Seungwhan Youn wrote:
> 
> >>> I hope you noticed that this clock hierarchy is a _very_ board specific thing.
> >>> We can easily place SoCs' shared stuff in arch/arm/plat-samsung (or similar)
> >>> Any suggestions, where do we place code shared by SMDK-boards ?
> >>
> >> plat-samsung would probably be fine for that also - create a file called
> >> common-smdk or something.  Some other things have gone for a plat-smdk
> >> style approach too, though I'm not sure how tasteful I find that
> >> personally.
> > Even though I would personally like to have EPLL control for a device
> > in machine specific manner as part of its driver, I accept your opinion.
> >
> > Claude, let us create one arch/arm/plat-samsung/smdk.c to do common
> > stuff for SMKDs like EPLL control. What do you think ?
> 
> Actually if we add this file on plat-samsung, board-init will be
> separated two-part, one is machine(board) specific and other is all
> smdk specific. So, If it doesn't make confusion to other guys who
> wants to add settings for their features on board-init, it looks good
> to me. But I think that we also have to listen Mr. Ben Dooks and Mr.
> Kukjin Kim's opinion about this before we get a conclusion.

Hi all,

I think, basically it'd better if could control clock stuff in each driver for it when need it such as clk_get, clk_enable and so on.
Actually there is no policy/protection for EPLL usage in plat-samsung or plat-s5p now and need to sort out other similar case for it also....so in my opinion, right now to proceed with the current style is helpful to me and will consider it in the future.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
