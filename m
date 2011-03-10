From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S5P: Add platform helpers for camera GPIO
	configuration
Date: Thu, 10 Mar 2011 18:56:40 +0900
Message-ID: <008a01cbdf09$76c5b800$64512800$%kim@samsung.com>
References: <01c701cbd975$c7dcd2d0$57967870$%kim@samsung.com>
	<1299683859-9242-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1299683859-9242-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> Add functions for configuration of the parallel camera
> bus pins on S5PV210 and Exynos4 SoC.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> 
> Hello,
> 
> this is a corrected version of platform helpers for the peripheral
> parallel camera bus configuration in S5PV210 and Exynos4 SoCs.
> 
> Changes since v1:
> - Renamed files: camera.h/camport.h, setup-camera.c/setup-fimc.c
> - Replaced "camif" with "fimc" in function and data type names
> - Removed driver strength setup (it turned out than only the clock
>   source pin needed maximum driver strength on the test boards,
>   so I've moved its configuration to the board code)
> 
> 
> Regards,
> Sylwester Nawrocki
> ---
>  arch/arm/mach-exynos4/Kconfig            |    5 +++
>  arch/arm/mach-exynos4/Makefile           |    1 +
>  arch/arm/mach-exynos4/setup-fimc.c       |   44
> ++++++++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/Kconfig            |    5 +++
>  arch/arm/mach-s5pv210/Makefile           |    1 +
>  arch/arm/mach-s5pv210/setup-fimc.c       |   43
> +++++++++++++++++++++++++++++
>  arch/arm/plat-s5p/include/plat/camport.h |   28 +++++++++++++++++++
>  7 files changed, 127 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/setup-fimc.c
>  create mode 100644 arch/arm/mach-s5pv210/setup-fimc.c
>  create mode 100644 arch/arm/plat-s5p/include/plat/camport.h
> 
(snip)

Looks ok to me, will apply :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
