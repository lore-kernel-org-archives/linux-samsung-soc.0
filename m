From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung 3rd DT updates for v3.14
Date: Sat, 4 Jan 2014 11:47:01 -0800
Message-ID: <CAOesGMgKbVejY3sFnXaJkmE5T72AhcRPKuUgEVC0HyzPiTXbeg@mail.gmail.com>
References: <52C7B8F1.6040703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:33247 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752340AbaADTrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 4 Jan 2014 14:47:03 -0500
Received: by mail-qc0-f175.google.com with SMTP id e9so16083217qcy.34
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Jan 2014 11:47:01 -0800 (PST)
In-Reply-To: <52C7B8F1.6040703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Fri, Jan 3, 2014 at 11:32 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof and Kevin,
>
> Here is 3rd Exynos DT updates for v3.14, actually it's including new dt
> files for exynos4412-tiny4412 and exynos5420-arndale-octa boards. They have
> been included in previous pull-request but it has not been pulled because of
> multiplatform. However Olof agreed just adding DT like this is OK so I'm
> re-sending this pull-request after re-sort them out.
>
> Just note this branch is based on tags/samsung-dt-2 already pulled into
> arm-soc per Olof's suggestion.
>
> If any problems, please kindly let me know.
>
> Thanks,
> Kukjin
>
> -------------------------------
>
> The following changes since commit a22d060e3299ce672258d00070fa0ed398c035c5:
>
>   ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos prefix
> (2013-12-21 10:09:25 +0900)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-3
>
> for you to fetch changes up to b67a55125f1413902f7db6d167a8d9e4154386bf:
>
>   ARM: dts: add support for EXYNOS4412 based TINY4412 board (2014-01-04
> 16:12:04 +0900)

Merged, thanks!


-Olof
