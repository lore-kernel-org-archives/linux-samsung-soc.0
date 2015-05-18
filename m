From: Tarek Dakhran <t.dakhran@gmail.com>
Subject: Re: [PATCH v1 1/1] ARM: EXYNOS: fix DEBUG_LL on Cortex-A7.
Date: Mon, 18 May 2015 10:31:37 +0300
Message-ID: <CANhyOUe1+YKzkfFqZVzuj2yNj+wdFb+hRHPjk2kwqGrwtkxtOg@mail.gmail.com>
References: <1431844923-4654-1-git-send-email-t.dakhran@gmail.com>
	<1431844923-4654-2-git-send-email-t.dakhran@gmail.com>
	<CAPTzV17YWyTiFU4wGs=Wy9quC_NzguXuqrheY_JoqAWN=VRniA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36482 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbbERHbj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 03:31:39 -0400
In-Reply-To: <CAPTzV17YWyTiFU4wGs=Wy9quC_NzguXuqrheY_JoqAWN=VRniA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: kgene@kernel.org, Russell King <linux@arm.linux.org.uk>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jy0922.shim@samsung.com

Hi Chanho,

On Mon, May 18, 2015 at 4:52 AM, Chanho Park <parkch98@gmail.com> wrote:
>
> Please see previous Joonyoung's patch. Your patch could break
> exynos3250 because it has not only two cortex-a7 cpus but also uses
> EXYOS4_PA_UART.
>
> http://www.spinics.net/lists/linux-samsung-soc/msg37318.html
>

Thanks, Joonyoung's patch works for me and it seems really reasonable
to check cluster id.

Best regards,
     Tarek
