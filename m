From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Thu, 26 May 2011 20:32:27 +0530
Message-ID: <BANLkTimMVe9zJJn+gmWwCH3z-98JXtwRqQ@mail.gmail.com>
References: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
	<4DDD425A.1070202@samsung.com>
	<BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
	<20110526142333.GI15094@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:34668 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754730Ab1EZPC3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2011 11:02:29 -0400
Received: by bwz15 with SMTP id 15so501639bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2011 08:02:27 -0700 (PDT)
In-Reply-To: <20110526142333.GI15094@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, patches@linaro.org, lrg@slimlogic.co.uk

On Thu, May 26, 2011 at 7:54 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, May 25, 2011 at 11:45:37PM +0530, Jassi Brar wrote:
>
>> I2C here is a SMDK specific requirement and even if most devices nee=
d I2C,
>> selecting I2C for every EXYNOS4210 based device is not ideal. IMO it=
'd better
>> be tied to some SMDK specific config option.
>
> Given that it's the audio machine driver the dependency on I2C doesn'=
t
> seem unreasonable
Yup, actually I am not dead against the submitted patch... it's just
that historically
Samsung ASoC doesn't include I2C dependency, so why now.

> - the CODEC will generally be I2C connected so I2C is
> going to be required for the driver to do anything useful. =C2=A0Migh=
t be
> better to just add a dependency on the WM8994 MFD, though, which does
> roughly the same thing.
Should do too.
