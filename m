From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] pinctrl: exynos: ack level-triggered interrupts
 before unmasking
Date: Thu, 13 Jun 2013 17:00:01 -0700
Message-ID: <CAD=FV=WZQwA3UgYRGBQVHFs05JJzfmVfLyLXo7iQJYm=WmVQdw@mail.gmail.com>
References: <1371058399-31933-1-git-send-email-dianders@chromium.org>
	<150901ce682e$1c3fca50$54bf5ef0$%kim@samsung.com>
	<CAD=FV=U9V-rgjcCusCvgw-SeUH-kDbozr_T-i1DcaXNXv48vxw@mail.gmail.com>
	<4661065.SXhmWQNl5M@flatron>
	<CAD=FV=Ukdpt4vMCZNySvKpHz6yGCP5X-LLAc1XdOAEAM8rr1fw@mail.gmail.com>
	<15e401ce688b$8fadadb0$af090910$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:53911 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754609Ab3FNAAE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 20:00:04 -0400
Received: by mail-wi0-f177.google.com with SMTP id ey16so2085773wid.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 17:00:02 -0700 (PDT)
In-Reply-To: <15e401ce688b$8fadadb0$af090910$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, Ilho Lee <ilho215.lee@samsung.com>, =?UTF-8?B?6rmA7J2A6riw?= <eunki_kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Kukjin

<take 2, not in HTML mode>

On Thu, Jun 13, 2013 at 4:13 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Doug Anderson wrote:
>>
>> Tomasz,
>>
>> On Thu, Jun 13, 2013 at 9:42 AM, Tomasz Figa <tomasz.figa@gmail.com>=
 wrote:
>> >> > BTW, probably we need a similar fixing in the mach-exynos/commo=
n.c
>> >> > file
>> >> > before pinct=EA=B8=B0 for distro...
>> >>
>> >> Is anyone using the functions in mach-exynos/common.c file anymor=
e?  I
>> >> thought that non-dt exynos support was going away and then we cou=
ld
>> >> just delete a whole lot of code from that file.
>> >
>> > I think Kukjin meant stable kernels that support Exynos boards usi=
ng
>> board
>> > files and without pinctrl. Would make sense to have them fixed as =
well,
>> I
>> > guess.
>>
> Yes, correct. Thanks, Tomasz.
>
>> Ah, makes sense.  Kukjin: do you know of someone who needs this
>> (someone who is picking up linux-stable updates for exynos)?  I don'=
t
>> think it's important for ChromeOS for this particular patch.  If
>> there's someone who needs this to officially land on linux-stable I'=
d
>> be happy to review their backport of this patch.
>>
> As you know, developing something like Android, Tizen use the stable =
kernel (long-term? I'm not sure) and there was a problem about this iss=
ue. So I mean, would be fixed for the stable kernel.

Sure, but do they actually pull in from linux-stable periodically?
I'd imagine that they have a private tree and that it would be their
job to backport any fixes onto their kernel.
