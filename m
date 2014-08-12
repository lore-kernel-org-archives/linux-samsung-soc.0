From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 0/7] Exynos4: enable HDMI support for Odroid and
 UniversalC210
Date: Tue, 12 Aug 2014 15:00:44 +0200
Message-ID: <CAAObsKC96xCOU8-hoecDn0PAZM5Z-T6Y3pb885csQm4_AakuyA@mail.gmail.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, Daniel Drake <drake@endlessm.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 1 July 2014 10:10, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> This is a long awaited patch series enabling support for HDMI output
> available on Exynos4412-based Odroid boards (X/X2/U2/U3/U3+) and
> Exynos4210 Universal C210 board.

Hello,

have tested a few of these patches on an Odroid-U2 on top of
linux/master (c8d6637):

1a8edf8 clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER clocks
bb2561d drm: exynos: hdmi: make 'hdmi-en' regulator optional and keep it enabled
afe0bff Exynos: add support for 'domain-always-on' property
be421b7 ARM: dts: exynos4: add hdmi related nodes
1206d41 ARM: dts: exynos4412-odroid: enable hdmi support

Tested-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

I also needed these two patches from Daniel Drake:

64489ec ARM: dts: Enable PMIC interrupts on ODROID
ef009d7 ARM: dts: ODROID i2c improvements

HDMI worked just fine in the testing I did, I have pushed a branch here:

http://cgit.collabora.com/git/user/tomeu/linux.git/log/?h=odroid-hdmi

Marek, Daniel: would you like me to send a series with all the needed
patches together?

Thanks,

Tomeu
