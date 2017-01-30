From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 4/4] arm64: dts: exynos: for v4.11, 2nd round
Date: Mon, 30 Jan 2017 19:57:20 +0200
Message-ID: <20170130175720.nfmhet6mkajq3vho@kozik-lap>
References: <20170129200630.22083-1-krzk@kernel.org>
 <20170129200630.22083-4-krzk@kernel.org>
 <20170130052329.GZ18943@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170130052329.GZ18943@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jan 29, 2017 at 09:23:29PM -0800, Olof Johansson wrote:
> Hi Krzysztof,
> 
> On Sun, Jan 29, 2017 at 10:06:29PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > On top of previous pull request.
> > 
> > This adds proper clocks to LPASS node on Exynos5433 which is needed
> > by Marek's patchset:
> >  - [PATCH v2 0/8] Pad retentions support for Exynos5433
> >    https://lkml.kernel.org/r/1485419634-28331-1-git-send-email-m.szyprowski () samsung ! com
> > 
> > 
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > 
> > Best regards,
> > Krzysztof
> > 
> > 
> > The following changes since commit e4e381133241a27d732e78be09973b89a193eaf7:
> > 
> >   arm64: dts: exynos: Enable HDMI/TV path on Exynos5433-TM2 (2017-01-11 18:20:28 +0200)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.11-2
> > 
> > for you to fetch changes up to 7547162ac351483df3641f64e99e10be329dd6a2:
> > 
> >   arm64: dts: exynos: Add clocks to Exynos5433 LPASS module (2017-01-26 22:04:20 +0200)
> 
> I think you tagged the wrong branch here. The log message shows the right hash
> at the tip, but the tag is of 95648b747071d530b5bb983735cfe0ffff1b66bf, which
> seems to be on your for-next.
> 
> Care to respin, so your tag and our merged branch match up?
>
Fixed, the same name of tag but this time on proper branch:
tag name	samsung-dt64-4.11-2
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=next/dt64

Sorry for the mess.

Best regards,
Krzysztof
