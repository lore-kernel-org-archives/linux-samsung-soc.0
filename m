From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] platform/chrome: Don't make CHROME_PLATFORMS depends
 on X86 || ARM
Date: Mon, 17 Aug 2015 09:56:55 +0200
Message-ID: <CAMuHMdWwGWyFkf34x6-AFZ_nzOQg+RxwEgptBVxxJOzKd6aGqA@mail.gmail.com>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
	<1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f194.google.com ([209.85.214.194]:35290 "EHLO
	mail-ob0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbbHQH44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Aug 2015 03:56:56 -0400
In-Reply-To: <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Linus Torvalds <torvalds@linux-foundation.org>

On Thu, Jun 25, 2015 at 2:20 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The Chrome platform support depends on X86 || ARM because there are
> only Chromebooks using those architectures. But only some drivers
> depend on a given architecture, and the ones that do already have
> a dependency on their specific Kconfig symbol entries.
>
> An option is to also make CHROME_PLATFORMS depends on || COMPILE_TEST
> but is more future proof to remove the dependency and let the drivers
> be built in all architectures if possible to have more build coverage.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>

The proper way to have more build coverage is to extend the dependencies
with "|| COMPILE_TEST".

Yes I know MFD_CROS_EC selects CHROME_PLATFORMS, causing a
Kconfig warning on !X86 and !ARM.

Mixing "select" and "depends" (all other ChromeOS stuff depends on the
symbol) is bad practice, as it may lead to circular Kconfig dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
