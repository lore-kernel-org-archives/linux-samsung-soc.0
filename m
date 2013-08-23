From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 3/7] gpio: samsung: Skip initialization if device tree
 is present
Date: Fri, 23 Aug 2013 20:11:02 +0200
Message-ID: <CACRpkdZX96YUpCn8_vkFsZQK2q5asHtxYtaHR2y1hDK_QQs6iA@mail.gmail.com>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com>
	<1377120111-25601-4-git-send-email-tomasz.figa@gmail.com>
	<CACRpkda2ZjPm4nEeDujPWSDCNLk4mr9izPvhqNKx5urVAg_Azg@mail.gmail.com>
	<3452017.UPhKO6xNO5@flatron>
	<1c9a01ce9f1e$473b58b0$d5b20a10$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:62502 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755874Ab3HWSLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 14:11:03 -0400
Received: by mail-oa0-f52.google.com with SMTP id f4so1157108oah.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Aug 2013 11:11:02 -0700 (PDT)
In-Reply-To: <1c9a01ce9f1e$473b58b0$d5b20a10$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>

On Thu, Aug 22, 2013 at 11:59 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Tomasz Figa wrote:
>> On Thursday 22 of August 2013 01:21:25 Linus Walleij wrote:
>> > On Wed, Aug 21, 2013 at 11:21 PM, Tomasz Figa <tomasz.figa@gmail.com>
>> wrote:
>> > > Since this driver does not handle GPIO on device tree enabled
>> > > platforms
>> > > any more, it should be bypassed whenever device tree is available, to
>> > > not conflict with the new pinctrl-samsung driver.
>> > >
>> > > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> >
>> > This seems like something I should apply to the GPIO tree
>> > right now, shall I?
>>
>> Would be nice, but since this patch is a dependency for rest of this
>> series and there are no other dependencies on GPIO tree, it might be
>> easier to just let Kukjin take all the patches with required Acks.
>>
> Oh, I didn't see any dependencies...but if so, Linus do you agree with
> Tomasz' opinion?

Yes please merge it through the Samsung tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
