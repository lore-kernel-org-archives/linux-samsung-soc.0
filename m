From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 0/5] ARM: samsung/exynos: Stuff for v4.18
Date: Mon, 14 May 2018 13:55:02 -0700
Message-ID: <20180514205502.u25kugxkym4tz34e@localhost>
References: <20180513154238.22508-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180513154238.22508-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, May 13, 2018 at 05:42:33PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes for v4.18. No dependencies, no specific order of pulls.
> 
> Support for Exynos5440 is removed step by step through different trees.

5440 was always a bit of a weird fit, it clearly was never an exynos5-family
platform. I take it there are no substantial users left that would need
mainline kernel support for it?

Also, I noticed your PGP key has expired, so you should probably start
collecting signatures on a fresh subkey.


-Olof
