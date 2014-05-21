From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s:
 port to use generic dmaengine API
Date: Wed, 21 May 2014 17:53:06 +0300
Message-ID: <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com> <537CA9F0.8000704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:40720 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbaEUOx1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 10:53:27 -0400
Received: by mail-ob0-f169.google.com with SMTP id vb8so2277410obc.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 07:53:26 -0700 (PDT)
In-Reply-To: <537CA9F0.8000704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, May 21, 2014 at 4:28 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Vasily,

Hi Tomasz,

> Please remember to keep linux-samsung-soc ML on Cc when sending patches
> related to Samsung platforms. It is essential to let Samsung people
> review them.

Ok, I'll keep it in mind. I've just checked and get_maintainer.pl
outputs linux-samsung-soc ML for these
patches. I've omitted it occasionally, because it wasn't necessary to
keep it in CC back in 2011
(year of my last sound-related patch for s3c24xx).

> Please resend the series with this in mind.

Is it really necessary? This patch is supposed to go through ASoC
tree, not through Samsung's.
And I really doubt that Samsung guys test kernel for s3c24xx boards nowadays.

> The patch in general looks good to me. Might be a good idea to specify
> on what board(s) and how it was tested, though.

It was tested on s3c2410-based iPAQ h1940, s3c2412 part was only
compile-tested, as I don't have s3c2412 hardware.

> Best regards,
> Tomasz

Regards
Vasily
