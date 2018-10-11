From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/4] ARM: exynos: soc/mach for v4.20, second round
Date: Thu, 11 Oct 2018 16:02:45 +0200
Message-ID: <CAK8P3a2+wyge4=eCxJps0Ar3bYFrqjvdMakiYHBPmn3p63+GDg@mail.gmail.com>
References: <20181010182558.7034-1-krzk@kernel.org> <20181010182558.7034-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010182558.7034-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/10/18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> On top of previous pull request.
>
> ----------------------------------------------------------------
> Samsung mach/soc changes for v4.20, second round
>
> 1. Disable SAMSUNG_PM_CHECK Kconfig feature incompatible with Exynos.
>

I suspect Olof made a small mistake when he pulled the previous branch
into next/dt instead of next/soc, so I ended up pulling the new branch
with all commits into next/soc again.

Nothing harmful happened and you did everything right, I was just
a bit confused by this.

Thanks,

       Arnd
