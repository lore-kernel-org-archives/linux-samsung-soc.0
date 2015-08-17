From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/3] platform/chrome: Don't make CHROME_PLATFORMS depends
 on X86 || ARM
Date: Mon, 17 Aug 2015 10:36:00 +0200
Message-ID: <CABxcv==r-apmuLdWNWcNW1gGc9z2-j4moAML1Y+=OAKGt5mDqg@mail.gmail.com>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
	<1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
	<CAMuHMdWwGWyFkf34x6-AFZ_nzOQg+RxwEgptBVxxJOzKd6aGqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:34751 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbHQIgB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Aug 2015 04:36:01 -0400
Received: by ykdt205 with SMTP id t205so120002519ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2015 01:36:00 -0700 (PDT)
In-Reply-To: <CAMuHMdWwGWyFkf34x6-AFZ_nzOQg+RxwEgptBVxxJOzKd6aGqA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee.jones@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Linus Torvalds <torvalds@linux-foundation.org>

Hello Geert,

Thanks a lot for your feedback.

On Mon, Aug 17, 2015 at 9:56 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jun 25, 2015 at 2:20 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> The Chrome platform support depends on X86 || ARM because there are
>> only Chromebooks using those architectures. But only some drivers
>> depend on a given architecture, and the ones that do already have
>> a dependency on their specific Kconfig symbol entries.
>>
>> An option is to also make CHROME_PLATFORMS depends on || COMPILE_TEST
>> but is more future proof to remove the dependency and let the drivers
>> be built in all architectures if possible to have more build coverage.
>>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>
> NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> The proper way to have more build coverage is to extend the dependencies
> with "|| COMPILE_TEST".
>

Ok, I mentioned that as the other option but was not sure which one
was more suitable since CHROME_PLATFORMS is a category and the
individual drivers already depend on a given arch. But I will make it
depends on X86 || ARM again plus || COMPILE_TEST and in the future if
there is a Chromebook on !X86 and !ARM, that new arch can be added to
the or logic.

> Yes I know MFD_CROS_EC selects CHROME_PLATFORMS, causing a
> Kconfig warning on !X86 and !ARM.
>
> Mixing "select" and "depends" (all other ChromeOS stuff depends on the
> symbol) is bad practice, as it may lead to circular Kconfig dependencies.
>

Yes, I think this is the real issue. I added the select instead of a
depends to avoid breaking git bisection when moving the cros_ec com
helpers out of MFD since some platforms use MFD_CROS_EC but don't
enable CHROME_PLATFORMS on their defconfigs. But I'll change the
select to depends instead and include the defconfig changes as a
dependency in the series to avoid breaking git bisection.

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --

Best regards,
Javier
