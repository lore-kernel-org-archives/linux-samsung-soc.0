From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] ARM: dts: Add SPI flash node for Peach boards
Date: Wed, 19 Nov 2014 09:19:13 -0800
Message-ID: <CAD=FV=XpweHvcTsVTMBkv9g4+GxoO8WdngGhfVj0QnOwq3ASdQ@mail.gmail.com>
References: <1416246184-29071-1-git-send-email-javier.martinez@collabora.co.uk>
	<1416246184-29071-2-git-send-email-javier.martinez@collabora.co.uk>
	<CAD=FV=Xkei_wxa3jWb8bPvuynbSyq4o=ezjVD0+e04aOPCAM+Q@mail.gmail.com>
	<546C6BD2.4020802@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:48699 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755285AbaKSRTP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 12:19:15 -0500
Received: by mail-vc0-f171.google.com with SMTP id id10so529674vcb.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 09:19:14 -0800 (PST)
In-Reply-To: <546C6BD2.4020802@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@linaro.org>

Javier,

On Wed, Nov 19, 2014 at 2:07 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Doug,
>
> Thanks for your feedback.
>
> On 11/18/2014 06:50 PM, Doug Anderson wrote:
>> This is common practice in the Chrome OS tree, but we've gotten
>> pushback from upstream questioning about whether "spidev" is really a
>> physical device.  See:
>>
>> http://www.spinics.net/lists/linux-samsung-soc/msg29563.html
>>
>
> I see, I thought that it was a common practice in the mainline kernel
> too since I saw that many board DTS currently have a spidev node:
>
> $ git grep 'compatible = "spidev"' arch/arm/boot/dts/ | wc -l
> 19
>
>>
>> I don't really have an answer for something better to do here but I
>> figured I'd at least bring up the point.
>>
>
> I wonder how the spidev user-space interface is supposed to be used
> when booting with Device Trees.

OK.  Please don't take my comments as a NAK on this patch.  I should
have done the same grep myself before sending--sorry.  I just
remembered the old conversation and looked for that instead.

If the convention is to use "spidev" like this then I guess we're OK.
I do wish it was a little more like "i2c" myself where you could get a
direct access interface no matter what driver was bound underneath
(and also if no drivers were bound underneath).  ...but I could just
be naive.  ;)

-Doug
