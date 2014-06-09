From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/5] Add Maxim 77802 PMIC support
Date: Mon, 9 Jun 2014 16:57:07 -0700
Message-ID: <CAD=FV=WknbbqSojDD4pe-Xpd6J4LxkjU-O9JwQjU+gnh+6N=4A@mail.gmail.com>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk>
	<1402309011.17650.9.camel@AMDC1943>
	<CAD=FV=U2zPJ=NohDjGvJKfmwJzQhphtVMefM0p_hvFVoReauhQ@mail.gmail.com>
	<53963B5D.8090908@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:57777 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933062AbaFIX5I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 19:57:08 -0400
Received: by mail-vc0-f182.google.com with SMTP id il7so7209199vcb.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jun 2014 16:57:07 -0700 (PDT)
In-Reply-To: <53963B5D.8090908@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>

Javier,

On Mon, Jun 9, 2014 at 3:55 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
>> * The RTC has many subtle differences between the 77686 and 77802.
>> They expanded it to handle a 200 year timeframe instead of 100 and
>> that meant that they had to shuffle the bits around everywhere.  They
>> also moved it to have the same i2c address as the main PMIC so all
>> addresses are different (see max77686_map in the RTC link above).
>>
> There are other differences that were not mentioned:
>
> - The max77802 uses a single register to enable RTC alarm while max77686 uses 1
> bit from a set of registers.

Ironically this is one and the same issue, but you're right that it's
more major than I made it out to be.  See RTCYEARA2.  My theory is
that to account for more possible year values they needed all 8 bits.
That meant that the enable bit needed to move to a different register.
...and once you moved one enable you might as well move them all, I
guess.
