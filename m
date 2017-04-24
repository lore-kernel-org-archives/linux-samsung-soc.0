From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64 dts: exynos: Last round for v4.12
Date: Mon, 24 Apr 2017 10:33:14 +0200
Message-ID: <CAJKOXPfnwRHG-J8X6ZqB2RY7MX+WVpJn=-7dkwnxL3NT+GVf9A@mail.gmail.com>
References: <20170421164050.7404-1-krzk@kernel.org> <20170421164050.7404-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1166752AbdDXIdU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 04:33:20 -0400
In-Reply-To: <20170421164050.7404-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

On Fri, Apr 21, 2017 at 6:40 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> On top of previous pull request.
>
> Best regards,
> Krzysztof
>
>
> The following changes since commit e3c07546747cdec07ff15c984bc6cebc9c9f788c:
>
>   arm64: dts: exynos: Add the burst and esc clock frequency properties to DSI node (2017-03-08 08:55:39 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.12-2
>
> for you to fetch changes up to 5dccc9873c4af60f4478b3ef54267353f25cc301:
>
>   arm64: dts: exynos: Use - instead of @ for DT OPP entries (2017-04-20 18:10:05 +0200)
>
> ----------------------------------------------------------------
> Second update of  Samsung DeviceTree ARM64 for v4.12:
>  - Fix DTC warnings in Exynos ARM64 Device Tree sources.
>  - Add panel node to TM2E board.
>
> ----------------------------------------------------------------
> Hoegeun Kwon (1):
>       arm64: dts: exynos: Add support for s6e3hf2 panel device on TM2e board
>
> Viresh Kumar (1):
>       arm64: dts: exynos: Use - instead of @ for DT OPP entries

I need to fix this commit - my SoB got doubled:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=5dccc9873c4af60f4478b3ef54267353f25cc301

I'll (unfortunately) rebase and send.

Best regards,
Krzysztof
