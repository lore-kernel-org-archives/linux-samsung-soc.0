From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Fri, 17 May 2013 13:56:39 -0700
Message-ID: <CAD=FV=XcmzogZc9mWQ+FSr9dg9jML-ACUJY2M2-s+_rBw9gMzQ@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-4-git-send-email-t.figa@samsung.com>
	<CAD=FV=XJ=_o+hVbD=pPqXxXo=1PZdeRWyn-xyfS+Jf5LYfe2dg@mail.gmail.com>
	<4241187.TFCdy2kUT6@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:47740 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756004Ab3EQU4l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 16:56:41 -0400
Received: by mail-la0-f51.google.com with SMTP id lx15so2789111lab.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 13:56:39 -0700 (PDT)
In-Reply-To: <4241187.TFCdy2kUT6@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 1:23 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> I'd rather see you modify patch set #2 to provide some function to
>> retrieve just the eint mask and then use it here.  Your patch removes
>> this test and doesn't replace it with anything.  If you moved this
>> test to pinctrl directly you'd lose the test against intallow.
>
> Well, looking from the perspective of status before my patch, it just
> bypasses a test that is incorrect on DT-enabled platforms.

True.  What was there before was broken and this avoids the broken code.


> I agree that this test is rather reasonable to have, but it would require
> defining a new interface and moving all platforms to it, which for now
> would be a bit of overkill.

It seems like you could use the same type of solution as patch set #2?

...oh, but that's only for exynos!  I guess we would need something
similar for other platforms.  ...and until we do those other platforms
(including S3C64xx, I think) are still using the old
s3c_irqwake_eintmask, right?

...so overall your patch series only fully fixes exynos, though it
does make other platforms less broken which is a plus.  :)


> IMHO a separate series that sanitizes the whole PM handling in plat-
> samsung, including a rework of this check to make it cover all platforms
> in a generic and multiplatform-friendly way. What do you think?

Sure, I think that would be OK.


>> Ah, the important part here is the "saved", not the "save"!  The
>> "save" should get a NULL chip for all GPIOs and effectively be a
>> no-op.
>>
>> Skipping the "saved" is important of s3c64xx and s5p64x0 where the
>> "saved" seems to transition things over to powerdown mode.  Hopefully
>> a future patch of yours adds that back for those platforms in the
>> pinmux world.  ...same for restore.
>
> S3C64xx can be switched to power down pin configuration manually, but if
> you don't do it, it will activate it automatically after entering sleep
> mode.

How would restore work in that case?  I'd imagine that it would
automatically switch out of the powerdown config at wakeup before
running software?  That doesn't seem like a great idea.

I think that to make S3C64xx work properly we'd need to solve.


I wouldn't be opposed to a re-spin to address some of the above, but I
also won't object to this landing and remaining issues being addressed
in future patches.  This patch definitely does make things better and
no worse.  :)

On exynos5250-snow (pinmux backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>
