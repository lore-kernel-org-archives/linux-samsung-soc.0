From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v2] ARM: pl330: Fix a race condition
Date: Sun, 11 Dec 2011 22:40:15 +0530
Message-ID: <CAJe_ZhcF7nMvnWxfpSROtq=8SYqG1o1TyfWty79eGM0oqntNsg@mail.gmail.com>
References: <4E8C5425.80303@arm.com>
	<1317892206-3600-1-git-send-email-javi.merino@arm.com>
	<CAJuYYwTXf-XU0fdGT0+sggN-MEY3v7UHkfjNkM4+QUW464J9Ew@mail.gmail.com>
	<4EB7B79A.2020004@arm.com>
	<000c01ccada6$f83f5be0$e8be13a0$%kim@samsung.com>
	<4ED3B89E.7070903@arm.com>
	<000e01ccae48$d76a7ba0$863f72e0$%kim@samsung.com>
	<4ED4AB9A.3060807@arm.com>
	<CAJe_Zhem0yTOV4L-kJ91fQN++hFzCUgjOfxSnJR25PuYNTedVQ@mail.gmail.com>
	<03f001ccb4b5$3441f5c0$9cc5e140$%kim@samsung.com>
	<4EDF3989.3060108@arm.com>
	<4EDFD278.9090101@arm.com>
	<4EE1F7F0.70107@arm.com>
	<CAJe_Zhcj_j+r+T5N_BdS-ENds1SmJs7-Pfyf8vrFkB75BGBaYg@mail.gmail.com>
	<4EE20FF1.5070702@arm.com>
	<CABb+yY0f8xxAj+rFeZ4e61Sfk0+0bMsAiZ-H5AeY4cfCd_VE5g@mail.gmail.com>
	<4EE220A7.5070101@arm.com>
	<CABb+yY2-1B65-UqRofj72zVuZUUk5c6pkqNGs15ZLnkrVheRDQ@mail.gmail.com>
	<4EE26670.1060005@arm.com>
	<CABb+yY1rt5RDdb1pfs0v4qfvZ=gsXGYFVwEn6Ns1OA+0TZXSjg@mail.gmail.com>
	<4EE4C7B5.2070803@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45604 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583Ab1LKRKR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 12:10:17 -0500
Received: by wgbdr13 with SMTP id dr13so9581836wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Dec 2011 09:10:16 -0800 (PST)
In-Reply-To: <4EE4C7B5.2070803@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 11 December 2011 20:39, Javi Merino <javi.merino@arm.com> wrote:
>>>
>>> What about properly tracking what we have sent to the DMA? =A0Somet=
hing
>>> like the following (warning *ugly* and untested code ahead, may eat=
 your
>>> kitten):
>>>
>> Yeah, this is like I said 'marker' method. Though we can clean it up=
 a bit.
>> 1) Pack req_running and lstenq together. Make lsteng return invalid =
value
>> should there be no buff programmed, otherwise 0 or 1.
>
> This can lead to starvation. =A0If lstenq is -1 when the DMA hasn't b=
een
> programmed yet, in _trigger() you don't know which buffer is the
> "oldest", so you may end up always starting the new buffer and
> forgetting about the other one. =A0lstenq as it is right now prevents=
 that.
>
Sorry I don't understand. If lstenq is -1 that means there's no req pro=
grammed
so trigger need not do anything. I didn't say we don't need to do anyth=
ing else.
Though it's just an idea I haven't implemented and it may not work out.
Just please give it a try if you can. Thanks.
