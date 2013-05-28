From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for v3.10
Date: Mon, 27 May 2013 19:52:57 -0700
Message-ID: <CAOesGMjEESQ1a6V3AC2RqGQTwk++Zq2FwZVQT0C=ToP1gTwR3w@mail.gmail.com>
References: <519FF6DB.5040002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:55631 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758611Ab3E1Cw6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 May 2013 22:52:58 -0400
Received: by mail-we0-f175.google.com with SMTP id p60so4941119wes.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2013 19:52:57 -0700 (PDT)
In-Reply-To: <519FF6DB.5040002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Fri, May 24, 2013 at 4:25 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:
>
>   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-3
>
> for you to fetch changes up to 15f504f0c2038b9a0f1569c9ce34def61f0c65be:
>
>   ARM: SAMSUNG: Add names to fimd0 IRQ resources (2013-05-25 06:49:43 +0900)
>
> ----------------------------------------------------------------
> Fixes following for v3.10
> - to get usb2 working on the Chromebook with adding the
>   usb phy node for usb2 on exynos5250
> - supporting exynos4210 rev0 SoC
> - exynos5440 restart applying only to powered-on domains
> - drm-exynos probe failure with adding resource names to
>   fimd0 platform device

Pulled, thanks.

-Olof
