From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/exynos: Print kernel pointers in a restricted form
Date: Tue, 14 Mar 2017 21:08:59 +0200
Message-ID: <20170314190859.y55wlc4z7xdsbbxg@kozik-lap>
References: <20170314183804.13788-1-krzk@kernel.org>
 <e1800491-0b60-74d1-1377-756d5b0bb371@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35447 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751450AbdCNTJF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 15:09:05 -0400
Content-Disposition: inline
In-Reply-To: <e1800491-0b60-74d1-1377-756d5b0bb371@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 14, 2017 at 08:01:41PM +0100, Tobias Jakobi wrote:
> Hello Krzysztof,
> 
> I was wondering about the benefit of this. From a quick look these are
> all messages that end up in the kernel log / dmesg.
> 
> IIRC %pK does nothing there, since dmest_restrict is supposed to be used
> to deny an unpriviliged user the access to the kernel log.
> 
> Or am I missing something here?

These are regular printks so depending on kernel options (e.g. dynamic
debug, drm.debug) these might be printed also in the console. Of course
we could argue then if access to one of the consoles is worth
securing.

Actually, I think that we should get rid of printing of these kernel
pointers entirely...


Best regards,
Krzysztof
