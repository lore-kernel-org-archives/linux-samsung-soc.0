From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: SAMSUNG: register the second instance of PL330
	DMAC
Date: Wed, 07 Sep 2011 16:25:30 +0900
Message-ID: <000d01cc6d2f$52bc1490$f8343db0$%kim@samsung.com>
References: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
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
To: 'alim akhtar' <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, boojin.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

alim akhtar wrote:
> 
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Two instance of platform data is provided for PL330 but only one PL330
DMAC
> instance is registered with amba_device.
> These patch sets registers the second instance with amba_device.
> 
> These patches are based on kgene's tree next/topic-dma-pl330 branch.
>
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;;a=summary
> 
> Alim Akhtar (3):
>   ARM: EXYNOS4: register the second instance of pl330 DMAC
>   ARM: S5PV210: register the second instance of pl330 DMAC
>   ARM: S5PC100: register the second instance of pl330 DMAC
> 
>  arch/arm/mach-exynos4/dma.c |    1 +
>  arch/arm/mach-s5pc100/dma.c |    1 +
>  arch/arm/mach-s5pv210/dma.c |    1 +
>  3 files changed, 3 insertions(+), 0 deletions(-)
> 
> --
> 1.7.2.3

Looks ok to me, will apply whole series.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
