From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Wed, 1 Feb 2012 08:56:43 +0900
Message-ID: <CAH9JG2W3Uk=J6GR4C6O6w-vkrG+b=j3ow5mEFbC21EFKS52Sdg@mail.gmail.com>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com>
	<1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
	<20120131224043.GD8338@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:59182 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752730Ab2AaX4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 18:56:43 -0500
Received: by obcva7 with SMTP id va7so581253obc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 15:56:43 -0800 (PST)
In-Reply-To: <20120131224043.GD8338@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Sangsu Park <sangsu4u.park@samsung.com>

On 2/1/12, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> On Wed, Feb 01, 2012 at 12:50:39AM +0900, Kukjin Kim wrote:
>> From: Sangsu Park <sangsu4u.park@samsung.com>
>>
>> This patch adds follwing.
>> - IO-map for EXYNOS5250 GPIO support
>> - EXYNOS5250 GPIO bank size/number definitions
>> - memory map definition for S5P GPIO4
>>
>> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Do you actually need these static mapping definitions?  The samsung
> gpiolib initialization is called from a core_initcall(), and at this
> time ioremap() is fully capable of working.

If it assumes it has 8 gpios, you can make it simple calculate it like this.

enum exynos5_gpios {
     EXYNOS5_GPIO_A,
     ...
};

EXYNOS5_GPIO_A_START(n)          (EXYNOS5_GPIO_A * 8)

with this one, it can make a simple gpio driver when using irq domain for GPIO.

Thank you,
Kyungmin Park
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
