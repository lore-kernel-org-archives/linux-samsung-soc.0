From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 11/11] clk: samsung: exynos7: Add required clock tree for
 UFS
Date: Thu, 10 Sep 2015 14:23:24 +0530
Message-ID: <55F14504.8040001@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-12-git-send-email-alim.akhtar@samsung.com>
 <55F10253.6000308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <55F10253.6000308@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 09/10/2015 09:38 AM, Krzysztof Kozlowski wrote:
> On 04.09.2015 20:37, Alim Akhtar wrote:
>> Adding required mux/div/gate clocks for UFS controller
>> present on Exynos7.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos7.c       |  116 +++++++++++++++++++++++++++++++
>>   include/dt-bindings/clock/exynos7-clk.h |   24 ++++++-
>>   2 files changed, 138 insertions(+), 2 deletions(-)
>>
>
> My previous comments are fixed, rest looks good:
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks for your time and review, have re-send V2 of whole series.
Please take a look.
> Best regards,
> Krzysztof
>
>
>
