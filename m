From: Olof Johansson <olof@lixom.net>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 11:15:02 -0700
Message-ID: <CAOesGMivs-6Th=N+_1zT4kM_Fs5gwbCVD58rb-Y8KKu__9EmTw@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<2016052.zneaYHvtGE@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:57659 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933011Ab3EOSPE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 14:15:04 -0400
Received: by mail-we0-f181.google.com with SMTP id q55so1911219wes.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 11:15:02 -0700 (PDT)
In-Reply-To: <2016052.zneaYHvtGE@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Kukjin Kim <kgene.kim@gmail.com>

On Wed, May 15, 2013 at 10:26 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>> I don't want to specify function/direction (code can handle that), but
>> do wish I could specify the pulls and strength.  Perhaps:
>>
>>   ptn3460-bridge@20 {
>>     compatible = "nxp,ptn3460";
>>     reg = <0x20>;
>>     powerdown-gpio = <&gpy2 5 0 0 0>;
>>     reset-gpio = <&gpx1 5 0 0 0>;
>
> This looks fine to me as well.
>
> Implementation of both shouldn't be too complicated, so it might be worth
> giving a try. Keep in mind that old bindings must be supported as well
> (based on #interrupt-cells and #gpio-cells values, I guess).

Given the late discovery of this pretty major drawback, I don't think
we should worry too much about backwards compatibility in this case
and instead just move everyone over asap to whatever the new binding
is (when we agree on something).

Also, it looks like the gpio bindings were never updated with the
pinctrl changes. Tsk, tsk, tsk. Bad.

We have the option of either adding new fields for pulls and strength,
but we can also split the existing flags field similar to how we did
with the old binding, and take 8 bits each for pulls and strength, or
somesuch. That'll be less of a change w.r.t. existing device trees and
bindings.



-Olof
