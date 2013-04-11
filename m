From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 20/30] ASoC: samsung: convert to dmaengine API
Date: Thu, 11 Apr 2013 15:27:06 +0100
Message-ID: <20130411142706.GB24971@opensource.wolfsonmicro.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de> <1365638712-1028578-21-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365638712-1028578-21-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 11, 2013 at 02:05:02AM +0200, Arnd Bergmann wrote:
> In order to build the exynos kernel with CONFIG_ARCH_MULTIPLATFORM,
> we must convert all users of the Samsung private DMA interface to
> the generic dmaengine API. This version of the patch adds the
> generic dmaengine API as an alternative to the existing samsung
> specific one. Once all the older platforms provide support for
> the common dmaengine interfaces, we can remove the old code.

There's generic ASoC dmaengine code which should be used instead of open
coding this.  Lars-Peter Clausen and Lee Jones have been working on
making this a totally generic driver, right now it's a library.
