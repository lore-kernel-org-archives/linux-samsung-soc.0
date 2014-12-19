From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH/RFC 00/14] ASoC: samsung: Add clk provider for
 I2S internal clocks
Date: Fri, 19 Dec 2014 14:53:49 +0100
Message-ID: <54942DED.4020808@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <CAAgF-BfY_28PpgChfB-7vEF5z9ETmXJUKGuBYhmAC-CxbFedqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23304 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752241AbaLSNxx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 08:53:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGU00MQQ1GIGZ80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Dec 2014 13:57:54 +0000 (GMT)
In-reply-to: <CAAgF-BfY_28PpgChfB-7vEF5z9ETmXJUKGuBYhmAC-CxbFedqA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, broonie@kernel.org, drake@endlessm.com, padma.v@samsung.com

Hi Padma,

On 16/12/14 04:16, Padma Venkat wrote:
> Hi Sylwester,
> 
>> I need some more thought about interaction between the clk API calls on the
>> clocks being exposed and the ASoC calls into sound/soc/samsung/i2s.c.
>> I'm sending teh patches for review though to avoid any waste of time should
>> it turn out the direction taken is wrong.
>>
>> This whole series definitely needs more testing, so far I only tested it
>> on Odroid X2, with the I2S working in slave mode.
> 
> your patches looks good to me. I did basic playback and capture test
> of your patches with i2s in master mode on exynos7.  I also added
> secondary dai for testing and verified playback. But I think some more
> testing required to check the serialization of registers. Tried aplay
> with front dai in background and with secondary dai in the foreground.
> But due to one issue on my system backend playback not working.

Thanks a lot for testing! I also tested concurrent playback with the
primary and the secondary DAI (on Exynos4412), enabling the secondary DAI
with a bit hackish patch as in this branch:
git://linuxtv.org/snawrocki/samsung.git sound/odroidx2-simple-card-v2
I'm planning to do necessary changes to enable the secondary DAI properly
with simple-card, once we're done with this series.

-- 
Regards,
Sylwester
