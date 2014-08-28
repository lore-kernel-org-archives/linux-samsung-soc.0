From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 00/14] Support 64bit Cortex A57 based Exynos7 SoC
Date: Wed, 27 Aug 2014 20:47:58 -0700
Message-ID: <20140828034758.GA4972@localhost>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:44139 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbaH1EFf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 00:05:35 -0400
Received: by mail-pa0-f41.google.com with SMTP id lj1so814834pab.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2014 21:05:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: catalin.marinas@arm.com, naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com

Naveen,

On Wed, Aug 27, 2014 at 03:14:16PM +0530, Naveen Krishna Chatradhi wrote:
> This patchset supports new Exynos7 Samsung SoC based on Cortex-A57.
> Exynos7 is a System-On-Chip (SoC) that is based on 64-bit
> ARMv8 RISC processor.

Your emails haven't threaded properly, so the series of patches are not
recognized as comments to the envelope (00/14) email. It makes it harder
to review them in order, and some mailers might not group them well.

> We tested these patches with the 
> "arm64: dts: add <dt-bindings/> symlink" change posted @
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-January/224629.html

That means that these patches can't be picked up until a permanent
solution for that has gone in.


-Olof
