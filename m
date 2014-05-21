From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx, 12}-i2s:
 port to use generic dmaengine API
Date: Wed, 21 May 2014 19:09:19 +0300
Message-ID: <CA+E=qVdnNPyR8NL2gxrt_rptjxB3RROYjSRe3rkHH-JLq==oFg@mail.gmail.com>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com>
 <45188858.i0tHnasRTk@phil> <CA+E=qVfXb2BeEsPcwnvKSiYRtP=HL6J_OLv+yrpg16kg74zJzQ@mail.gmail.com>
 <27469899.QpTIQjlnqG@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:55309 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611AbaEUQJk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 12:09:40 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so2504921oac.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 09:09:40 -0700 (PDT)
In-Reply-To: <27469899.QpTIQjlnqG@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, May 21, 2014 at 6:56 PM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
>
> Openmoko Freerunner (S3C2440) where there may be sound reachable some=
way and a
> "Oyo" ebook-reader (S3C2416) whose i2s is I think compatible with the=
 s3c64xx
> instead of the s3c24xx ones and with a completely unsupported codec.

=46reerunner is s3c2442, and actually I can test s3c2442 on my iPAQ rx1=
950.
s3c2416 may be supported by s3c2412-i2s, I have no spec at the hand,
so I can't check.

Regards
Vasily

> But in general I'm fairly confident that if you hear sounds on your d=
evice your
> conversion would be fine test-wise :-)
>
>
> Heiko
