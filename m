From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/4] ARM: exynos: Mach/soc for v4.11
Date: Mon, 16 Jan 2017 22:30:06 -0800
Message-ID: <20170117063006.GL16607@localhost>
References: <20170113152030.13586-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113152030.13586-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 13, 2017 at 05:20:27PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Mostly cleanups for v4.11.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.11
> 
> for you to fetch changes up to cda1a52dab50340728e46601e6c9da9fc4beaf1f:
> 
>   ARM: s3c64xx: Constify wake_irqs (2016-12-29 15:41:44 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc update for v4.11. Mostly cleanups:
> 1. Removal of unused platform data in S3C24XX and S3C64xx as follow up of
>    conversion to new DMA channel request API.
> 2. Adding const and __ro_after_init to various data in Samsung platforms.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (7):
>       ARM: EXYNOS: Constify list of retention registers
>       ARM: EXYNOS: Annotate iomem and pm_data pointers __ro_after_init
>       ARM: s3c24xx: Constify few integer tables
>       ARM: s3c64xx: Annotate external clock frequencies __ro_after_init
>       ARM: SAMSUNG: Constify array of wake irqs passed to samsung_sync_wakemask
>       ARM: s3c24xx: Constify wake_irqs
>       ARM: s3c64xx: Constify wake_irqs
> 
> Sylwester Nawrocki (2):
>       ARM: s3c64xx: Drop initialization of unused struct s3c_audio_pdata fields
>       ARM: s3c24xx: Drop unused struct s3c_audio_pdata entries

Merged, thanks.


-Olof
