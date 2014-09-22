From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: fix width field of mout_mmc0/1
Date: Mon, 22 Sep 2014 10:35:01 +0200
Message-ID: <541FDF35.6010401@gmail.com>
References: <1409918081-2464-1-git-send-email-pankaj.dubey@samsung.com> <540EEF0B.3040202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <540EEF0B.3040202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 09.09.2014 14:14, Krzysztof Kozlowski wrote:
> On 05.09.2014 13:54, Pankaj Dubey wrote:
>> As per Exynos3250 user manual mmc0/1 mux selection has 4 bit wide.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos3250.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied for next.

Best regards,
Tomasz
