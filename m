From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: Enabling 8 cores on 5420
Date: Fri, 30 May 2014 17:12:56 +0200
Message-ID: <53889FF8.8050003@suse.de>
References: <53884E88.2090408@linaro.org> <538888B4.6070303@suse.de> <53889C25.3080706@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37418 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933083AbaE3PM6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 11:12:58 -0400
In-Reply-To: <53889C25.3080706@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Am 30.05.2014 16:56, schrieb Daniel Lezcano:
> On 05/30/2014 03:33 PM, Andreas F=C3=A4rber wrote:
>> Am 30.05.2014 11:25, schrieb Daniel Lezcano:
>>>
>>> I am trying an upstream kernel + some patches to enable ethernet on
>>> arndale octa.
>>>
>>> Unfortunately, only 4 cores boot up. The other ones fail to boot.
>>>
>>> [12.179453] CPU6: failed to come online
>>> [13.189479] CPU7: failed to come online
>>> [14.199479] CPU4: failed to come online
>>> [15.209743] CPU5: failed to come online
>>>
>>> What should I do to enable those 8 cores ? Is there a patchset some=
where
>>> to do so ?
>>
>> Yes, this is the reply I received just yesterday from Tushar Behera:
>>> Can you check after applying following two patches for Arndale-Octa
>>> ([1],[2])? In other words, a patch similar to [2] might be required
>>> for this board too if it is booting under secure mode.
>>>
>>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg31776.html
>>>
>>> [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for
>>> secure mode
>>>
>>> [2] http://www.spinics.net/lists/linux-samsung-soc/msg31777.html
>>>
>>> [PATCH v2 Resend 2/2] ARM: dts: Add secure firmware support for
>>> Arndale-octa
>>
>> The first one I tested successfully on the 5410 already.
>=20
> Hi Andreas,
>=20
> thx for the pointers. I tested the patches but unfortunately they don=
't
> enable the cpus.

Oh sorry, I just read "failed to come online" but didn't notice it's
about 4-7 only. All eight are available as nodes under /cpus on for-nex=
t
[1], so no clue on my part. The Samsung guys will know better.

Cheers,
Andreas

[1]
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tre=
e/arch/arm/boot/dts/exynos5420.dtsi?h=3Dfor-next

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
