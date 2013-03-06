From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: let device core setup the default pin configuration
Date: Wed, 6 Mar 2013 17:22:11 +0530
Message-ID: <CAJuYYwS29ToJ+-1S4G+K=3W1C1TRxLcfPrE=rC_OE4fHyWSc5g@mail.gmail.com>
References: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
	<20130306113741.GA19556@opensource.wolfsonmicro.com>
	<201303061242.09978.heiko@sntech.de>
	<20130306114918.GB19556@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:55176 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757462Ab3CFLwM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 06:52:12 -0500
Received: by mail-vc0-f182.google.com with SMTP id fl17so4799389vcb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 03:52:11 -0800 (PST)
In-Reply-To: <20130306114918.GB19556@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, alsa-devel@alsa-project.org, lrg@ti.com, jassisinghbrar@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org

On 6 March 2013 17:19, Mark Brown <broonie@opensource.wolfsonmicro.com>=
 wrote:
> On Wed, Mar 06, 2013 at 12:42:09PM +0100, Heiko St=FCbner wrote:
>
>> What is going away is the deprecated non-pinctrl way to setup the pi=
ns on dt
>> platforms.
>
> OK, can we have a changelog improvement please?  I didn't read the pa=
tch
> properly because the changelog said it would break my primary
> development system.

Ok. I will repost again with additional details in the changelog.
