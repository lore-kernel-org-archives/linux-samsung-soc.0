From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Mon, 20 Feb 2017 15:20:52 +0200
Message-ID: <CAJKOXPc6rQVdkydpiykFaXsC5wuW7LdR67v0u7bHBo_vAE9bQQ@mail.gmail.com>
References: <CGME20170220071001epcas1p3c2b32665942ba55c3ed4e06d2c66d661@epcas1p3.samsung.com>
 <1487574582-15746-1-git-send-email-hoegeun.kwon@samsung.com> <1487574582-15746-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752581AbdBTNU4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 08:20:56 -0500
In-Reply-To: <1487574582-15746-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, a.hajda@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On Mon, Feb 20, 2017 at 9:09 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
>
> This patch add the panel device tree node for S6E3HA2 display
> controller to TM2 dts.
>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Please use scripts/get_maintainer.pl to get the list of people to CC.
Here you missed Javier, so I am worried that you run this driver not
on mainline kernel but on some old one...

Best regards,
Krzysztof
