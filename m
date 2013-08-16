From: Olof Johansson <olof@lixom.net>
Subject: Re: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 09:04:41 -0700
Message-ID: <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
	<13b101ce9a14$2cebd700$86c38500$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:35794 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270Ab3HPQEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 12:04:41 -0400
Received: by mail-qa0-f51.google.com with SMTP id f11so583193qae.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Aug 2013 09:04:41 -0700 (PDT)
In-Reply-To: <13b101ce9a14$2cebd700$86c38500$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Aug 15, 2013 at 5:04 PM, Kukjin Kim <kgene@kernel.org> wrote:
> I think, maybe we discussed about that? :) current exynos_defconfig cannot
> support exynos5440 because of LPAE and I remember we decided LPAE and
> non-LPAE should be separated. So as I commented before, exynos5440_defconfig
> is needed. If you have any concerns, please let me know.

Having a SoC-specific defconfig makes no sense. You can run with LPAE
enabled on A15 and A7-based systems even if they don't have enough
memory to need it.

Really, what we want is to just turn on the LPAE functionality and
keep everything else common. Forking into two defconfigs seems like
the wrong idea, even if we did discuss it before. Having something
like a config fragment to include would make more sense, since that
could be shared across all platforms (and apply with
multi_v7_defconfig for those who want to run that on LPAE as well).

Or, you know, just have your build script enable it without having an
in-tree config fragment. That'd work too.

The main case where this isn't sufficient is on platforms where _all_
memory sits above 4G, since you can't boot a non-LPAE kernel on those
at all. It seems like 5440 has memory starting at 2GB so it's not one
of those.


-Olof
