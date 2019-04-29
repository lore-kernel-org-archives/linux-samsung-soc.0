From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/3] ARM: samsung: Changes for v5.2
Date: Mon, 29 Apr 2019 00:11:38 -0700
Message-ID: <CAOesGMh1JA=RxrnohosW1SiwZrwDy_1mHNMBq2zrYXEFcCuEzQ@mail.gmail.com>
References: <20190414154805.10188-1-krzk@kernel.org> <20190414154805.10188-3-krzk@kernel.org>
 <CAJKOXPfzV0wn0a-4xvy1B0fR=X4VvpqNmtqwRGFhFdCMH3OpHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfzV0wn0a-4xvy1B0fR=X4VvpqNmtqwRGFhFdCMH3OpHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM-SoC Maintainers <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Apr 28, 2019 at 11:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, 14 Apr 2019 at 17:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> >
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> >
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.2
> >
> > for you to fetch changes up to 7676e667c841375b41d9438b559756141aa93d0e:
> >
> >   ARM: s3c64xx: Tidy up handling of regulator GPIO lookups (2019-04-14 12:53:03 +0200)
> >
> > ----------------------------------------------------------------
> > Samsung mach/soc changes for v5.2
> >
> > 1. Cleanup in mach code.
> > 2. Add necessary fixes for Suspend to RAM on Exynos5422 boards (tested
> >    with Odroid XU3/XU4/HC1 family).  Finally this brings a working S2R
> >    on these Odroid boards (still other drivers might have some issues
> >    but mach code seems to be finished).
> > 3. Require MCPM for Exynos542x boards because otherwise not all of cores
> >    will come online.
> > 4. GPIO regulator cleanup on S3C6410 Craig.
>
> Hi Olof and Arnd,
>
> I see you pulled in DTS and DTS64 pull request. I think this one here
> is still pending.

Yeah, I don't always do them in order. It's easier to sweep all pull
requests of a certain type (i.e. DT, drivers, etc). I also ran out of
time and had to step away for a few hours.

Same thing now -- I'm done for the night but there's quite a few
remaining pull requests in the queue. I'll continue tomorrow.


-Olof
