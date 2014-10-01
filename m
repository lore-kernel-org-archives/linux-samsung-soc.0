From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Wed, 01 Oct 2014 12:36:56 +0200
Message-ID: <542BD948.8040600@gmail.com>
References: <1412142540-3667-1-git-send-email-pankaj.dubey@samsung.com> <1412142540-3667-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35048 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbaJAKhA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 06:37:00 -0400
Received: by mail-wi0-f179.google.com with SMTP id d1so87658wiv.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2014 03:36:59 -0700 (PDT)
In-Reply-To: <1412142540-3667-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, vikas.sajjan@samsung.com, linux@roeck-us.net, naushad@samsung.com

Hi Pankaj,

Please see my comments inline.

On 01.10.2014 07:49, Pankaj Dubey wrote:
> Let's register reboot_notifier from PMU driver for reboot
> functionality. So that we can remove restart hooks from
> machine specific file, and thus moving ahead when PMU moved
> to driver folder, this functionality can be reused for ARM64
> based Exynos SoC's.

[snip]

> +static int pmu_reboot_notify_handler(struct notifier_block *this,
> +		unsigned long code, void *unused)
> +{
> +	if (code == SYS_RESTART) {
> +		u32 val = 0x1;
> +
> +		pmu_raw_writel(val, EXYNOS_SWRESET);

As already mentioned for patch 1, no need for the variable, because this
is just a constant 1.

Best regards,
Tomasz
