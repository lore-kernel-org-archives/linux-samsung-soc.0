From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: EXYNOS: Increase maximum possible memory bank size to 512MiB
Date: Sat, 08 Sep 2012 10:15:29 +0200
Message-ID: <1796354.EpclCk5CFg@flatron>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com> <1346748609-11115-5-git-send-email-t.figa@samsung.com> <24dc01cd8d6b$7426cf50$5c746df0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:44343 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917Ab2IHIPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:15:35 -0400
Received: by wibhr14 with SMTP id hr14so296600wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:15:34 -0700 (PDT)
In-Reply-To: <24dc01cd8d6b$7426cf50$5c746df0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org

Hi Kgene,

On Saturday 08 of September 2012 11:41:31 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > Some boards have larger memory banks than 256MiB. This patch increses
> > maximum bank size for Exynos-based boards to 512MiB.
> 
> Well...the meaning of SECTION_SIZE_BITS is a little bit different you
> know.
> 
> Please refer to following thread.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-July/020184.ht
> ml

Well, I agree, but the effect of this patch is that it is possible to have 
first bank (or rather section) up to 512MiB, in case of CONFIG_SPARSEMEM.

Still, we could go the other way and just define more smaller sections 
instead and simply drop this patch. (Assuming that the correspondence of 
sections and memory banks is irrelevant.)

--
Best regards,
Tomasz Figa
