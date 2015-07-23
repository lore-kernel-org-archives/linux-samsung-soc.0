From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL] Samsung 1st fixes for v4.2
Date: Thu, 23 Jul 2015 17:15:01 +0900
Message-ID: <02fb01d0c51f$ac4649d0$04d2dd70$@kernel.org>
References: <55ADBF14.30304@kernel.org> <20150721210542.GA13353@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20150721210542.GA13353@localhost>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi Kukjin,
> 
Hi Olof,

> On Tue, Jul 21, 2015 at 12:40:04PM +0900, Kukjin Kim wrote:
> > Hi,
> >
> > Please pull samsung fixes for v4.2.
> >
> > Thanks,
> > Kukjin
> >
> > The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> >
> >   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-fixes-1
> >
> > for you to fetch changes up to 300bde79f3d86b1af6fcde7b7b2439ecffccbff4:
> >
> >   ARM: dts: add CPU OPP and regulator supply property for exynos4210
> > (2015-07-21 12:32:29 +0900)
> 
> Was there a reason you rebased Krzystztof's branch? The contents is identical.
> 
> In cases like those, feel free to just forward the pull request to us
> and we can do it directly. If you have more patches you want to add into
> the same fixes branch then you can just merge his in and apply yours on
> top. That's for example how Tony Lindgren tends to handle OMAP -- he'll
> forward a pull request from Paul Walmsley if that's the only contents
> he has.
> 
Yeah, I know what you're saying and I agreed. Actually the OMAP model would be
helpful. BTW in this case, I wanted to change the subject title that's why I
did cherry-pick.

> Anyway, merged.
> 
Thanks,
Kukjin
