From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/3] soc: samsung: Exynos for v5.4
Date: Thu, 22 Aug 2019 20:35:19 +0200
Message-ID: <20190822183519.GA23735@kozik-lap>
References: <20190816163042.6604-1-krzk@kernel.org>
 <CAJKOXPcgZ2_ofZyAeTSxALkALaP-SFNfvNmNPYSPyLzuhpGZ0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPcgZ2_ofZyAeTSxALkALaP-SFNfvNmNPYSPyLzuhpGZ0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 09:51:09AM +0200, Krzysztof Kozlowski wrote:
> On Fri, 16 Aug 2019 at 18:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> >
> >   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.4
> >
> > for you to fetch changes up to 40d8aff614f71ab3cab20785b4f213e3802d4e87:
> >
> >   soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API (2019-08-15 20:25:25 +0200)
> >
> > ----------------------------------------------------------------
> > Samsung soc drivers changes for v5.4
> >
> > Add Exynos Chipid driver for identification of product IDs and SoC
> > revisions.  The driver also exposes chipid regmap, later to be used by
> > Exynos Adaptive Supply Voltage driver (adjusting voltages to different
> > revisions of same SoC).
> 
> It turns out that it brings troubles (code is executed on every
> platform polluting logs because it is an initcall, not a driver) so
> Sylwester (submitter) asked to skip the submission.
> 
> Please ignore the pull request.

I talked with Sylwester and Bartlomiej who contributed the chipid driver
and they provided small incremental fixes. The driver is still useful
and in the future it will be expanded towards AVS. Therefore please pull
it or optionally wait a week and I will send incremental pull request
with fixes.

Best regards,
Krzysztof
