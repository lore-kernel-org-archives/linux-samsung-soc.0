From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/2] Samsung 2nd cleanup for v3.15
Date: Sat, 29 Mar 2014 02:49:04 +0100
Message-ID: <201403290249.04949.arnd@arndb.de>
References: <53285457.80900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53285457.80900@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 18 March 2014, Kukjin Kim wrote:
> The following changes since commit d9671ca923445aa870ecc34df3db01dd602d87fc:
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
>    ARM: SAMSUNG: remove all custom uncompress.h (2014-03-11 22:05:18 +0900)
> 
> ----------------------------------------------------------------
> Samsung cleanup-2 for v3.15
> - use generic uncompress.h and remove all custom
>    uncompress.h in mach-s3c24xx, s3c64xx, s5p64x0,
>    s5pc100, s5pv210 and plat-samsung directories.
> 
> Note that based on previous tags/samsung-cleanup

I've started a new next/cleanup3 branch for this one and the following
five samsung branches. I found one small issue with one of the branches,
if we all agree on a solution for that, I expect we can just send out
the cleanup3 branch together with cleanup2.

	Arnd
