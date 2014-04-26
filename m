From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: exynos_defconfig: Enable HS-I2C
Date: Sat, 26 Apr 2014 20:14:27 +0900
Message-ID: <0b5b01cf6140$afd3d390$0f7b7ab0$@samsung.com>
References: <1393935776-22657-1-git-send-email-sachin.kamat@linaro.org>
 <5358C521.9060103@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55802 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbaDZLO3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 07:14:29 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4M0057IXW3EM40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Apr 2014 20:14:27 +0900 (KST)
In-reply-to: <5358C521.9060103@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>

Tushar Behera wrote:
> 
> On 03/04/2014 05:52 PM, Sachin Kamat wrote:
> > High speed I2C is used on Exynos5 based SoCs. Enable it.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  arch/arm/configs/exynos_defconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/configs/exynos_defconfig
> b/arch/arm/configs/exynos_defconfig
> > index 4ce7b70ea901..e07a227ec0db 100644
> > --- a/arch/arm/configs/exynos_defconfig
> > +++ b/arch/arm/configs/exynos_defconfig
> > @@ -65,6 +65,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=y
> >  CONFIG_I2C=y
> >  CONFIG_I2C_MUX=y
> >  CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> > +CONFIG_I2C_EXYNOS5=y
> >  CONFIG_I2C_S3C2410=y
> >  CONFIG_DEBUG_GPIO=y
> >  # CONFIG_HWMON is not set
> >
> Kukjin,
> 
> Please consider picking this patch when you plan to update
> exynos_defconfig. With this change on upstream kernel, we are able to
> get Arndale_Octa board to boot and mount an MMC partition successfully.
> 
Oh, OK.

BTW, basically the boot should be fine with/without selecting
I2C_EXYNOS5...or if the config is required always for arndale_octa board, it
should be enabled without any manual selecting. I think, it means this is
just temporal solution not right approach to fix the problem..

I need to look at the codes...

Thanks,
Kukjin
