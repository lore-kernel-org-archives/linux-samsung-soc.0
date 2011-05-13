From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 0/7] ARM: Removing ARCH_S5PC100
Date: Fri, 13 May 2011 15:55:42 +0300
Message-ID: <201105131555.42860.anarsoul@gmail.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:56872 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758529Ab1EMM4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 May 2011 08:56:43 -0400
Received: by fxm17 with SMTP id 17so1742420fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 May 2011 05:56:41 -0700 (PDT)
In-Reply-To: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thursday 12 May 2011 04:11:07 Kukjin Kim wrote:
> This patch remvoes mach-s5pc100 directory for ARCH_S5PC100 in arch/arm.

Hm, what's the point of removing this code?

> If any problems, please let me know immediately.
> 
> [PATCH 1/7] ARM: S5PC100: Removing ARCH_S5PC100
> [PATCH 2/7] ASoC: Remove to support sound for S5PC100
> [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
> [PATCH 4/7] mtd: OneNAND: Remove to support onenand for S5PC100
> [PATCH 5/7] tty: Remove to support serial for S5PC100
> [PATCH 6/7] video: s3c-fb: Remove to support fb for S5PC100
> [PATCH 7/7] libata: Remove to support pata for S5PC100
