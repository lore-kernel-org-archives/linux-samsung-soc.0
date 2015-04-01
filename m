From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is
 enabled during suspend
Date: Wed, 1 Apr 2015 08:49:14 +0530
Message-ID: <CAM4voanzd-iiyTbGvZpTz4nmULJu9_VUFz3EibLB5L295K4P-Q@mail.gmail.com>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
	<1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk>
	<CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
	<551976F1.1000605@collabora.co.uk>
	<7hiodg98z7.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:34438 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746AbbDADTP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 23:19:15 -0400
In-Reply-To: <7hiodg98z7.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tyler Baker <tyler.baker@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Kevin,

On Wed, Apr 1, 2015 at 2:32 AM, Kevin Hilman <khilman@kernel.org> wrote:
> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>
> [...]
>
>> Unfortunately I don't fully understand why this clock needs to be
>> enabled. It would be good if someone at Samsung can explain in more
>> detail what the real problem really is.
>
> +1
>
> Maybe Abhilash can shed some light here?
>
> We really should know *why* this is needed because having the fix in the
> clock driver just doesn't seem right.  It seems like the DMA driver
> should be managing this clock.

I think my last mail might not have reached you (was accidentally sent
as html). We are gating the aclk266_g2d clock without checking the
CG_STATUS0 register bits as specified in the UM. It looks like we need
to keep several clocks alive or gate them only after checking the
CG_STATUSx register bits.

Regards,
Abhilash
