From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 00/28] Twenty eight patches big Exynos cleanup
Date: Fri, 14 Jun 2013 23:47:36 +0200
Message-ID: <2203616.54AcBMXmhk@flatron>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com> <5750530.AyJQs5JHPZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:65510 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752232Ab3FNVrh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 17:47:37 -0400
Received: by mail-ee0-f45.google.com with SMTP id c1so620724eek.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2013 14:47:36 -0700 (PDT)
In-Reply-To: <5750530.AyJQs5JHPZ@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Arnd,

On Friday 14 of June 2013 23:26:04 Arnd Bergmann wrote:
> On Friday 14 June 2013 21:32:36 Tomasz Figa wrote:
> > As I promised, I am doing some spring (or rather summer) cleaning
> > of Exynos- and Samsung- related code.
> > 
> > This first part consists mostly of removing dead code remaining after
> > removal of ATAGS support for Exynos, but several patches cleans up
> > other things found by the way.
> > 
> > See particular patches for more detailed description.
> > 
> > On Exynos4210-based Trats board:
> > Tested-by: Tomasz Figa <t.figa@samsung.com>
> > 
> > Build tested every patch with s3c6400_defconfig, s5pv210_defconfig
> > and exynos_defconfig.
> 
> Great stuff. I unfortunately did almost the exact same patch since I
> did not know you were on it too.

Hmm, I didn't see it. Looks like we need some task synchronization. :)

> Yours looks better in some details,
> and your patch descriptions are /much/ better than my single large
> patch.
> 
> I'll try to cross-check the two series to see if there is anything
> you missed that was in my patch set.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

OK, thank you.

I will continue my spring (summer) cleaning session on Monday, probably 
focusing on init and PM code, but who knows what else can be found in this 
code. ;)

Best regards,
Tomasz

> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
