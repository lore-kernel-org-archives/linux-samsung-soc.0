From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 7/7] ARM: dts: exynos5250: add display power domain
Date: Mon, 19 Jan 2015 18:26:57 +0100
Message-ID: <CABxcv=m7Q5v3wH1FU9S0E-dMgebZ_+M_dLELr39h7_VA0Oc8cw@mail.gmail.com>
References: <1421243091-10778-1-git-send-email-m.szyprowski@samsung.com>
	<1421243091-10778-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:64549 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694AbbASR07 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 12:26:59 -0500
Received: by mail-we0-f179.google.com with SMTP id q59so9100281wes.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2015 09:26:57 -0800 (PST)
In-Reply-To: <1421243091-10778-8-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hello Marek and Andrzej,

On Wed, Jan 14, 2015 at 2:44 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Andrzej Hajda <a.hajda@samsung.com>
>
> The patch adds domain definition and references to it in appropriate devices.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> [mszyprow: rebased onto generic power domains dt bindings]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

This patch makes HDMI to work on my Exynos5250 Snow Chromebook:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
