From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s:
 port to use generic dmaengine API
Date: Wed, 21 May 2014 18:20:29 +0300
Message-ID: <CA+E=qVdysVY81pZaN-Rsm_3d3cxL7Nqz4HKJvd6pDbBo7tX5uA@mail.gmail.com>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com>
 <537CA9F0.8000704@samsung.com> <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com>
 <537CC143.9050307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:63273 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662AbaEUPUt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:20:49 -0400
Received: by mail-ob0-f176.google.com with SMTP id wo20so2312124obc.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 08:20:49 -0700 (PDT)
In-Reply-To: <537CC143.9050307@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

On Wed, May 21, 2014 at 6:07 PM, Tomasz Figa <t.figa@samsung.com> wrote=
:

>>
>> Is it really necessary? This patch is supposed to go through ASoC
>> tree, not through Samsung's.
>> And I really doubt that Samsung guys test kernel for s3c24xx boards =
nowadays.
>
> Maybe not test, but at least review the code. Also there might be oth=
er
> people following that list that might be interested in looking at thi=
s
> series, while not subscribed to alsa-devel - I can name at least Heik=
o
> St=C3=BCbner, who should be able to test it on further s3c24xx-based =
boards.

Ok, will resend tonight.

Regards
Vasily
