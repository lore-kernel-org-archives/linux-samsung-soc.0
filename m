From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Set 64-bit DMA mask for EXYNOS5250
Date: Fri, 9 Aug 2013 16:41:57 +0530
Message-ID: <CAHbNUh1z8ULaxpJuHe=B5+ey+19LznD_tzSopJ6y3h09rw=-8g@mail.gmail.com>
References: <1376042714-26513-1-git-send-email-tushar.behera@linaro.org>
	<20130809102752.GP23006@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:44594 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967445Ab3HILL5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 07:11:57 -0400
Received: by mail-ob0-f169.google.com with SMTP id wc20so6383606obb.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Aug 2013 04:11:57 -0700 (PDT)
In-Reply-To: <20130809102752.GP23006@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>

On 9 August 2013 15:57, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> On Fri, Aug 09, 2013 at 03:35:14PM +0530, Tushar Behera wrote:
>> When LPAE is enabled, we need to set 64bit DMA mask bits.
>
> *Please* check the list archives.  I sent during the last 7 days a patch
> series which should address this problem.  Unfortunately, it seems almost
> no one has looked at it.

Thanks for the patchset. Tested on Arndale.

-- 
Tushar Behera
