From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL - cpufreq] Samsung eyxnos cpufreq for v3.9
Date: Tue, 12 Feb 2013 17:25:53 -0800
Message-ID: <1dde01ce0989$11d93460$358b9d20$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Content-language: en-us
Sender: cpufreq-owner@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rafael,

Here is changes for Samsung exynos cpufreq for v3.9.

Almost of them are changing exynos stuff in drivers/cpufreq, so should be
fine for cpufreq tree.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cpufreq-exynos

If any problems, please kindly let me know.

Thanks.

- Kukjin

The following changes since commit a49f0d1ea3ec94fc7cf33a7c36a16343b74bd565:

  Linux 3.8-rc1 (2012-12-21 17:19:00 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cpufreq-exynos

for you to fetch changes up to c098ea74b268969bde5aaf1689b61d236abf82f5:

  cpufreq: exynos: Fix hang in pm handler due to frequency mismatch
(2013-02-04 21:01:22 -0800)

----------------------------------------------------------------
Inderpal Singh (1):
      cpufreq: exynos: Show list of available frequencies

Jonghwan Choi (7):
      cpufreq: exynos: Remove unused variable & IS_ERR
      cpufreq: exynos: Check old & new frequency early
      cpufreq: exynos: Use APLL_FREQ macro for cpu divider value
      cpufreq: exynos: Split exynos_target function into two functions
      cpufreq: exynos: Add missing static
      cpufreq: exynos: Get booting freq value in exynos_cpufreq_init
      cpufreq: exynos: Fix hang in pm handler due to frequency mismatch

Sachin Kamat (2):
      cpufreq: exynos: Fix unsigned variable being checked for negative
value
      cpufreq: exynos: Initialize return variable

 arch/arm/mach-exynos/include/mach/cpufreq.h |   19 +-
 drivers/cpufreq/exynos-cpufreq.c            |  174 +++++++-----
 drivers/cpufreq/exynos4210-cpufreq.c        |  152 ++---------
 drivers/cpufreq/exynos4x12-cpufreq.c        |  388
++++-----------------------
 drivers/cpufreq/exynos5250-cpufreq.c        |  178 +++---------
 5 files changed, 248 insertions(+), 663 deletions(-)

