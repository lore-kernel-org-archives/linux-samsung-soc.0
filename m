From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2 3/6] arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
Date: Wed, 21 Oct 2015 17:25:51 +0530
Message-ID: <CANAwSgRFJWvFBK0QnkH3ohRkW1cL97a11Ss3WnOpUPUHyNhkmA@mail.gmail.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <1445333085-22837-4-git-send-email-alim.akhtar@samsung.com> <562617A9.3020302@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33474 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753493AbbJUL4L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 07:56:11 -0400
In-Reply-To: <562617A9.3020302@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

hi Alim,

On 20 October 2015 at 16:00, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Alim,
>
> On 10/20/2015 11:24 AM, Alim Akhtar wrote:
>> This patch adds syscon-{reboot, poweroff} nodes to allow the
>> generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5 SoCs.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
>> ---
>>  arch/arm/boot/dts/exynos5.dtsi |   14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> --

Tested on OdroidXU3.

Tested-by: Anand Moon <linux.amoon@gmail.com>

-Anand Moon

> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
