From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Fri, 8 Oct 2010 18:07:37 +0900
Message-ID: <AANLkTinPXcjHcaM1puzz00Sfhob9Y-X4HGDDVGMTqhH5@mail.gmail.com>
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
	<00c401cb6520$9484ef90$bd8eceb0$%kim@samsung.com>
	<AANLkTikf4CAWm49Q_AfcfiQDBQUVcE_BC-a_4F7d8xOz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:39732 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754309Ab0JHJHj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 05:07:39 -0400
Received: by wwb34 with SMTP id 34so15552wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2010 02:07:38 -0700 (PDT)
In-Reply-To: <AANLkTikf4CAWm49Q_AfcfiQDBQUVcE_BC-a_4F7d8xOz@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, jassi.brar@samsung.com
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Oct 7, 2010 at 10:33 AM, Seungwhan Youn <claude.youn@gmail.com>=
 wrote:
> Dear Maintainers,
>
>>> >> plat-samsung would probably be fine for that also - create a fil=
e called
>>> >> common-smdk or something. =C2=A0Some other things have gone for =
a plat-smdk
>>> >> style approach too, though I'm not sure how tasteful I find that
>>> >> personally.
>>> > Even though I would personally like to have EPLL control for a de=
vice
>>> > in machine specific manner as part of its driver, I accept your o=
pinion.
>>> >
>>> > Claude, let us create one arch/arm/plat-samsung/smdk.c to do comm=
on
>>> > stuff for SMKDs like EPLL control. What do you think ?
>>>
>>> Actually if we add this file on plat-samsung, board-init will be
>>> separated two-part, one is machine(board) specific and other is all
>>> smdk specific. So, If it doesn't make confusion to other guys who
>>> wants to add settings for their features on board-init, it looks go=
od
>>> to me. But I think that we also have to listen Mr. Ben Dooks and Mr=
=2E
>>> Kukjin Kim's opinion about this before we get a conclusion.
>>
>> Hi all,
>>
>> I think, basically it'd better if could control clock stuff in each =
driver for it when need it such as clk_get, clk_enable and so on.
>> Actually there is no policy/protection for EPLL usage in plat-samsun=
g or plat-s5p now and need to sort out other similar case for it also..=
=2E.so in my opinion, right now to proceed with the current style is he=
lpful to me and will consider it in the future.
>>
>
> I wander to know that this is a last discussion, or more, and also
> know about finial decision. Of course, if we didn't get reached to th=
e
> conclusion, we can talk more.
>
> Can you give me a hand to finish this? :-)
>

Dear Mr. Mark and Mr. Jassi,

Now, I'm almost finished 2nd patch for submit except this audio clock
setting. For now, I can only think that remove audio clock setting
from this machine code, and add audio clock settings in arch later(may
be after arch/arm/plat-samsung get EPLL policy as Mr. Kukjin said).

Is this okay?

BRs,
Claude.
