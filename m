From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: Sort nodes within Peach-pit/Peach-pi dts files
Date: Fri, 20 Jun 2014 13:09:28 -0700
Message-ID: <CAD=FV=X1EJ4HFQcSR2nBZTnmpOaKRkEy04d21LBSKS3Vj1XAUA@mail.gmail.com>
References: <1403252419-28352-1-git-send-email-tushar.b@samsung.com>
	<1403252419-28352-3-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:37648 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753833AbaFTUJ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 16:09:29 -0400
Received: by mail-vc0-f182.google.com with SMTP id il7so3876078vcb.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 13:09:28 -0700 (PDT)
In-Reply-To: <1403252419-28352-3-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, Tushar Behera <trblinux@gmail.com>

Tushar / Kukjin,

On Fri, Jun 20, 2014 at 1:20 AM, Tushar Behera <tushar.b@samsung.com> wrote:
> Peach-pit and Peach-pi boards are almost similar, hence the DTS file
> is also very similar. Sorting nodes in both these files will allow
> us to figure out the difference easily.
>
> All the node aliases are sorted in alphabetically increasing order.
> There is no functional change with this patch.
>
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |  236 ++++++++++++++--------------
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  |  225 +++++++++++++-------------
>  2 files changed, 233 insertions(+), 228 deletions(-)

Thanks, this looks much better.  I tried against next-20140620 and it
applied cleanly, gave a good diff between pit and pi, and looked sane.

This is gonna be a pain in the butt if Kukjin doesn't apply it ASAP.
It will conflict with every single other dts patch to pi.

Reviewed-by: Doug Anderson <dianders@chromium.org>

-Doug
