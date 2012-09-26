From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/3] ARM: Exynos: Add support for MSHC controller
Date: Wed, 26 Sep 2012 10:47:05 +0900
Message-ID: <135f01cd9b88$d557efe0$8007cfa0$%kim@samsung.com>
References: <1346238072-7324-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1346238072-7324-1-git-send-email-thomas.abraham@linaro.org>
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
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org, tgih.jun@samsung.com, devicetree-discuss@lists.ozlabs.org, jh80.chung@samsung.com, girish.shivananjappa@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> This patch series adds Exynos5250 platform support for MSHC controllers.
> 
> Thomas Abraham (3):
>   ARM: Samsung: Add support for MSHC controller clocks
>   ARM: Exynos5: Add AUXDATA support for MSHC controllers
>   ARM: dts: Add nodes for dw_mmc controllers for Samsung Exynos5250
> platforms
> 
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   55
> +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         |   32 +++++++++++++++++
>  arch/arm/mach-exynos/clock-exynos5.c      |   45 ++++++++---------------
>  arch/arm/mach-exynos/include/mach/map.h   |    4 ++
>  arch/arm/mach-exynos/mach-exynos5-dt.c    |    8 ++++
>  5 files changed, 115 insertions(+), 29 deletions(-)

Applied this series.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
