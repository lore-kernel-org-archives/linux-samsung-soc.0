From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RFC 1/6] ASoC: samsung: Add Samsung Low Power Audio
 Subsystem driver
Date: Thu, 16 Jun 2016 13:28:49 +0200
Message-ID: <57628D71.2070407@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28363 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754031AbcFPL2y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 07:28:54 -0400
In-reply-to: <1465815160-28504-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com

On 06/13/2016 12:52 PM, Sylwester Nawrocki wrote:
> From: Inha Song <ideal.song@samsung.com>
> 
> This patch adds LPASS driver. The LPASS (Low Power Audio Subsystem)
> is a special subsystem that supports audio playback with low power
> consumption. This is a minimal driver which prepares resources for
> IP blocks like I2S, audio DMA and UART.
> Also system power ops are added to ensure the Audio Subsystem is
> operational after system suspend/resume cycle.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/Makefile |   2 +
>  sound/soc/samsung/lpass.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++
>  sound/soc/samsung/lpass.h  |  47 +++++++++++++
>  3 files changed, 211 insertions(+)
>  create mode 100644 sound/soc/samsung/lpass.c
>  create mode 100644 sound/soc/samsung/lpass.h

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
