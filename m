From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/6] ARM: EXYNOS: Add secure firmware support
Date: Wed, 10 Oct 2012 09:09:18 -0700
Message-ID: <20121010160918.GC582@quad.lixom.net>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:48814 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535Ab2JJQJA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 12:09:00 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so758288pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 09:09:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, m.szyprowski@samsung.com

On Mon, Sep 24, 2012 at 04:28:27PM +0200, Tomasz Figa wrote:
> Some Exynos-based boards are running with secure firmware running in
> TrustZone secure world, which changes the way some things have to be
> initialized.
> 
> This series adds support for specifying firmware operations, implements
> some firmware operations for Exynos secure firmware and adds a method of
> enabling secure firmware operations on Exynos-based boards through board
> file and device tree.
> 
> Changes since v1
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/12583/focus=12820
>   - Changed return types of all operations to int
>   - Defined all operations to return 0 on success, -ENOSYS when not
>     implemented or appropriate error code on error
> 
> Tomasz Figa (6):
>   ARM: Add interface for registering and calling firmware-specific
>     operations
>   ARM: EXYNOS: Add support for secure monitor calls
>   ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
>   ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
>   ARM: EXYNOS: Add support for Exynos secure firmware
>   ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up

Besides the open comment on the device-tree binding, the other patches are:

Reviewed-by: Olof Johansson <olof@lixom.net>
