From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s:
 port to use generic dmaengine API
Date: Wed, 21 May 2014 18:39:26 +0300
Message-ID: <CA+E=qVfXb2BeEsPcwnvKSiYRtP=HL6J_OLv+yrpg16kg74zJzQ@mail.gmail.com>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com>
 <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com>
 <537CC143.9050307@samsung.com> <45188858.i0tHnasRTk@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:49265 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752641AbaEUPjr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:39:47 -0400
Received: by mail-oa0-f52.google.com with SMTP id eb12so2453297oac.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 08:39:46 -0700 (PDT)
In-Reply-To: <45188858.i0tHnasRTk@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, May 21, 2014 at 6:29 PM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Am Mittwoch, 21. Mai 2014, 17:07:47 schrieb Tomasz Figa:
>> On 21.05.2014 16:53, Vasily Khoruzhick wrote:
>> > On Wed, May 21, 2014 at 4:28 PM, Tomasz Figa <t.figa@samsung.com> =
wrote:
>> >> Please remember to keep linux-samsung-soc ML on Cc when sending p=
atches
>> >> related to Samsung platforms. It is essential to let Samsung peop=
le
>> >> review them.
>> >
>> > Ok, I'll keep it in mind. I've just checked and get_maintainer.pl
>> > outputs linux-samsung-soc ML for these
>> > patches. I've omitted it occasionally, because it wasn't necessary=
 to
>> > keep it in CC back in 2011
>> > (year of my last sound-related patch for s3c24xx).
>> >
>> >> Please resend the series with this in mind.
>> >
>> > Is it really necessary? This patch is supposed to go through ASoC
>> > tree, not through Samsung's.
>> > And I really doubt that Samsung guys test kernel for s3c24xx board=
s
>> > nowadays.
>> Maybe not test, but at least review the code. Also there might be ot=
her
>> people following that list that might be interested in looking at th=
is
>> series, while not subscribed to alsa-devel - I can name at least Hei=
ko
>> St=C3=BCbner, who should be able to test it on further s3c24xx-based=
 boards.
>
> Sadly, I don't have a working sound setup on my 2 s3c boards.

What are they btw? Is it too time-consuming to make sound working on th=
em?
It would be nice if anyone except me could test these patches.

> Heiko

Regards
Vasily
