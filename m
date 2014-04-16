From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 16 Apr 2014 16:31:54 +0200
Message-ID: <4516298.kO98TB1Ozz@wuerfel>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org> <1397554134-11827-6-git-send-email-sachin.kamat@linaro.org> <534E8AE1.4010402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.24]:58409 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161109AbaDPOcE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:32:04 -0400
In-Reply-To: <534E8AE1.4010402@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On Wednesday 16 April 2014 15:51:29 Tomasz Figa wrote:
> On 15.04.2014 11:28, Sachin Kamat wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This makes it possible to enable the exynos platform as part of a
> > multiplatform kernel, in addition to keeping the single-platform
> > Exynos support.
> > sparsemem is currently not supported in multiplatform.
> 
> Is this still true as of today?
> 
> Otherwise looks fine.

sparsemem is still not supported in multiplatform, but after I looked
at it in more detail, I came to the conclusion that there is no
reason why it couldn't be. It just needs testing so we are confident
that it doesn't break other platforms, and we need to find good
platform-independent values for MAX_PHYSMEM_BITS and SECTION_SIZE_BITS
to put into asm/memory.h, since we can't have them set in mach/memory.h
for multiplatform.

Looking at my patch again now, I would actually prefer to kill off
the single-platform support for exynos right away. I don't see
any reason to keep it now, and it complicates the test matrix.

	Arnd
