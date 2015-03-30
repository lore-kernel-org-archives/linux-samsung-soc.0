From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH v3 1/2] clk: samsung: Add a clock lookup function
Date: Mon, 30 Mar 2015 18:08:40 +0200
Message-ID: <55197508.5030501@collabora.co.uk>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>	<1427730803-28635-2-git-send-email-javier.martinez@collabora.co.uk> <CA+Ln22Fn+TRGcFXH7m=LkOCpAtbdKq98jNNNDM0shYWvfHEBiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43235 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478AbbC3QIs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 12:08:48 -0400
In-Reply-To: <CA+Ln22Fn+TRGcFXH7m=LkOCpAtbdKq98jNNNDM0shYWvfHEBiA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hello Tomasz,

On 03/30/2015 06:02 PM, Tomasz Figa wrote:
> Hi Javier,
> 
> 2015-03-31 0:53 GMT+09:00 Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>:
>> The Samsung helpers functions to register clocks, add the clock instance
>> returned by the common clock framework to a lookup table that is used by
>> OF to lookup the clocks.
>>
>> But this table could also be useful to clock drivers if they need to get
>> a clock instance since the helper functions don't return them.
>>
>> The common clock framework __clk_lookup() function from the clk provider
>> API could be used by drivers as well. But it's more efficient to use the
>> Samsung specific lookup table that returns the clock instance in constant
>> time, than using the __clk_lookup() function that uses the clock name as
>> an index so it has a linear search time.
> 
> Is this really something we should be concerned about? If so, maybe
> the generic look-up function should be rewritten to use something
> faster, such as tree or hash table?
>

I don't performance is a big issue here. I just thought that since the
lookup table is already filled by the driver and the lookup function
is one line, we could use that instead to get the performance benefit.

But I don't mind to drop this patch and use the generic lookup function
from the CCF API if that is preferred.
 
> Best regards,
> Tomasz
>

Best regards,
Javier
