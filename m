From: Sten Spans <sten@blinkenlights.nl>
Subject: Bug#774896: Exynos4 CONFIG_HZ
Date: Sun, 18 Jan 2015 17:57:39 +0100 (CET)
Message-ID: <alpine.DEB.0.99999.1501181744400.30567@zem.blinkenlights.nl>
Reply-To: Sten Spans <sten@blinkenlights.nl>, 774896@bugs.debian.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.774896.B774896.14216002634997@bugs.debian.org>
List-URL: <http://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: linux-samsung-soc@vger.kernel.org
Cc: 774896@bugs.debian.org
List-Id: linux-samsung-soc@vger.kernel.org


With the  improvements in upstream support for exynos4 devices
I've been looking into adding support odroid devices to Debian's
armmp kernel. The kernel config changes needed are quite minimal
as can be seen here:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=774896

Mostly enabling support and various modules.

However as Ian Campbell notes, enabling ARCH_EXYNOS4 triggers
the following from arch/arm/Kconfig:
         config HZ_FIXED
                 int
                 default 200 if ARCH_EBSA110 || ARCH_S3C24XX || \
                         ARCH_S5PV210 || ARCH_EXYNOS4
                 default AT91_TIMER_HZ if ARCH_AT91
                 default SHMOBILE_TIMER_HZ if ARCH_SHMOBILE_LEGACY
                 default 0

This forces CONFIG_HZ=200 for the entire armmp kernel, which is
undesirable. The reason for this setting isn't very clear to either
me or Ian. I personally have verified that HZ=250 (the default for debian
armmp kernels) boots fine.

Is there a particular reason for this setting?
Would a patch removing this requirement for ARCH_EXYNOS4 be accepted?

-- 
Sten Spans

"There is a crack in everything, that's how the light gets in."
Leonard Cohen - Anthem
