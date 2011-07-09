From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] EXYNOS4210: Add Support for DVS Lock
Date: Sat, 9 Jul 2011 04:48:13 +0100
Message-ID: <20110709034812.GG26900@sirena.org.uk>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com> <1309853179-19438-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1309853179-19438-5-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, Jongpill Lee <boyko.lee@samsung.com>, SangWook Ju <sw.ju@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 05, 2011 at 05:06:19PM +0900, Kukjin Kim wrote:

> +int exynos4_cpufreq_lock(unsigned int nId,
> +			enum cpufreq_level_request cpufreq_level);
> +void exynos4_cpufreq_lock_free(unsigned int nId);

This feels like something cpufreq should support to at least some extent
in the core, especially the thing with forcing a particular mode on
suspend.  Not that I have any particularly bright ideas for how
immediately.
