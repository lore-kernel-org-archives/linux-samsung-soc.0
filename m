From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for
 S/PDIF PCM audio
Date: Thu, 7 Oct 2010 10:33:50 +0900
Message-ID: <AANLkTikf4CAWm49Q_AfcfiQDBQUVcE_BC-a_4F7d8xOz@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:39350 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759655Ab0JGBeB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 21:34:01 -0400
Received: by wwj40 with SMTP id 40so244647wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2010 18:34:00 -0700 (PDT)
In-Reply-To: <00c401cb6520$9484ef90$bd8eceb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Jassi Brar <jassisinghbrar@gmail.com>, lrg@slimlogic.co.uk, Mark Brown <broonie@opensource.wolfsonmicro.com>, jassi.brar@samsung.com
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>

Dear Maintainers,

>> >> plat-samsung would probably be fine for that also - create a file=
 called
>> >> common-smdk or something. =C2=A0Some other things have gone for a=
 plat-smdk
>> >> style approach too, though I'm not sure how tasteful I find that
>> >> personally.
>> > Even though I would personally like to have EPLL control for a dev=
ice
>> > in machine specific manner as part of its driver, I accept your op=
inion.
>> >
>> > Claude, let us create one arch/arm/plat-samsung/smdk.c to do commo=
n
>> > stuff for SMKDs like EPLL control. What do you think ?
>>
>> Actually if we add this file on plat-samsung, board-init will be
>> separated two-part, one is machine(board) specific and other is all
>> smdk specific. So, If it doesn't make confusion to other guys who
>> wants to add settings for their features on board-init, it looks goo=
d
>> to me. But I think that we also have to listen Mr. Ben Dooks and Mr.
>> Kukjin Kim's opinion about this before we get a conclusion.
>
> Hi all,
>
> I think, basically it'd better if could control clock stuff in each d=
river for it when need it such as clk_get, clk_enable and so on.
> Actually there is no policy/protection for EPLL usage in plat-samsung=
 or plat-s5p now and need to sort out other similar case for it also...=
=2Eso in my opinion, right now to proceed with the current style is hel=
pful to me and will consider it in the future.
>

I wander to know that this is a last discussion, or more, and also
know about finial decision. Of course, if we didn't get reached to the
conclusion, we can talk more.

Can you give me a hand to finish this? :-)

with Best Regards,
Claude
