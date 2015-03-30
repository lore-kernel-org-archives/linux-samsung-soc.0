From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH v3 1/2] clk: samsung: Add a clock lookup function
Date: Tue, 31 Mar 2015 01:02:29 +0900
Message-ID: <CA+Ln22Fn+TRGcFXH7m=LkOCpAtbdKq98jNNNDM0shYWvfHEBiA@mail.gmail.com>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
	<1427730803-28635-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34499 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601AbbC3QCp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 12:02:45 -0400
In-Reply-To: <1427730803-28635-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Javier,

2015-03-31 0:53 GMT+09:00 Javier Martinez Canillas
<javier.martinez@collabora.co.uk>:
> The Samsung helpers functions to register clocks, add the clock instance
> returned by the common clock framework to a lookup table that is used by
> OF to lookup the clocks.
>
> But this table could also be useful to clock drivers if they need to get
> a clock instance since the helper functions don't return them.
>
> The common clock framework __clk_lookup() function from the clk provider
> API could be used by drivers as well. But it's more efficient to use the
> Samsung specific lookup table that returns the clock instance in constant
> time, than using the __clk_lookup() function that uses the clock name as
> an index so it has a linear search time.

Is this really something we should be concerned about? If so, maybe
the generic look-up function should be rewritten to use something
faster, such as tree or hash table?

Best regards,
Tomasz
