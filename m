From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/2] Samsung 2nd cleanup for v3.15
Date: Fri, 28 Mar 2014 17:53:42 +0900
Message-ID: <021f01cf4a63$3876c800$a9645800$@samsung.com>
References: <53285457.80900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <53285457.80900@samsung.com>
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
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> The following changes since commit
> d9671ca923445aa870ecc34df3db01dd602d87fc:
> 
>    ARM: EXYNOS: Remove uncompress.h (2014-02-24 09:39:18 +0900)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup-2
> 
> for you to fetch changes up to 19a964644f1e655c3f67d539c1e99a9fbcc4588c:
> 
>    ARM: SAMSUNG: remove all custom uncompress.h (2014-03-11 22:05:18
+0900)
> 
> ----------------------------------------------------------------
> Samsung cleanup-2 for v3.15
> - use generic uncompress.h and remove all custom
>    uncompress.h in mach-s3c24xx, s3c64xx, s5p64x0,
>    s5pc100, s5pv210 and plat-samsung directories.
> 
> Note that based on previous tags/samsung-cleanup
> 
> ----------------------------------------------------------------
> Heiko Stuebner (2):
>        ARM: SAMSUNG: use generic uncompress.h
>        ARM: SAMSUNG: remove all custom uncompress.h
> 
>   arch/arm/Kconfig.debug                          |   4 +-
>   arch/arm/mach-s3c24xx/include/mach/uncompress.h |  57 --------
>   arch/arm/mach-s3c64xx/include/mach/uncompress.h |  31 -----
>   arch/arm/mach-s5p64x0/include/mach/uncompress.h |  34 -----
>   arch/arm/mach-s5pc100/include/mach/uncompress.h |  30 ----
>   arch/arm/mach-s5pv210/include/mach/uncompress.h |  28 ----
>   arch/arm/plat-samsung/include/plat/uncompress.h | 175
> ------------------------
>   7 files changed, 2 insertions(+), 357 deletions(-)
>   delete mode 100644 arch/arm/mach-s3c24xx/include/mach/uncompress.h
>   delete mode 100644 arch/arm/mach-s3c64xx/include/mach/uncompress.h
>   delete mode 100644 arch/arm/mach-s5p64x0/include/mach/uncompress.h
>   delete mode 100644 arch/arm/mach-s5pc100/include/mach/uncompress.h
>   delete mode 100644 arch/arm/mach-s5pv210/include/mach/uncompress.h
>   delete mode 100644 arch/arm/plat-samsung/include/plat/uncompress.h

Hi,

Gentle reminder ;-)

- Kukjin
