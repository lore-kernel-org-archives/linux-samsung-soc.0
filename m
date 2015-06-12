From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 8/9] tests/exynos: remove connector_find_plane
Date: Fri, 12 Jun 2015 17:01:32 +0100
Message-ID: <CACvgo50cWzR8Wc0aOmk03hWFDiiMt8+L9NozNUVd+R5+ryO+kg@mail.gmail.com>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1433943748-15849-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f45.google.com ([209.85.216.45]:45725 "EHLO
	mail-vn0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbFLQBd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 12:01:33 -0400
Received: by vnbf62 with SMTP id f62so6696679vnb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 09:01:32 -0700 (PDT)
In-Reply-To: <1433943748-15849-9-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> No test uses DRM planes at the moment so this function
> is never called.
>
Similar to the other patch - mention if this been used previously. I'm
assuming that the exynos guys might have some work stashed which
depends on this ?

-Emil
