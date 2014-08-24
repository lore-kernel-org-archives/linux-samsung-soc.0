From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Sun, 24 Aug 2014 11:32:20 -0700
Message-ID: <CAOesGMgssUvj7WFic1uAZ6F3aqerrG9rqtOvSU3sR4J+cNLz-g@mail.gmail.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
	<CAAObsKAokjDmpVy5cm_iFD52bCq+3jYeGDWzACsmh-JKktyjDw@mail.gmail.com>
	<53F22D1B.4010900@samsung.com>
	<3413299.OcpyWkc82q@amdc1032>
	<CABxcv=mkqmg_b+vwbVPAW7AaB86Fxx+LTuMSyC7L_mUy6u2+TQ@mail.gmail.com>
	<20140819201859.GA7929@localhost>
	<07e201cfbdf5$69d92770$3d8b7650$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:33240 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbaHXScV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Aug 2014 14:32:21 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so14258156vcb.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2014 11:32:20 -0700 (PDT)
In-Reply-To: <07e201cfbdf5$69d92770$3d8b7650$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Daniel Drake <drake@endlessm.com>, Tobias Jakobi <liquid.acid@gmx.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Aug 22, 2014 at 3:39 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Tue, Aug 19, 2014 at 12:15:41PM +0200, Javier Martinez Canillas wrote:
>> > Hello,
>> >
>> > On Tue, Aug 19, 2014 at 11:57 AM, Bartlomiej Zolnierkiewicz
>> > <b.zolnierkie@samsung.com> wrote:
>> > >
>> > > IMHO they should go to upstream ASAP as they fix the boot for
>> > > ODROID boards and they cannot break anything as they are limited
>> > > to ODROID dts files.
>> > >
>> >
>> > Agreed, this is definitely -rc material IMHO.
>>
>> Yes. Definitely.
>>
> OK, agreed. Will apply into fixes.

Hi,

I'm about to send a batch up to Linus, and this was quick to apply
myself, so I've done so -- I'm interested in keeping this hardware
working since I have it in my test setup as the only EXYNOS4 machine.


-Olof
