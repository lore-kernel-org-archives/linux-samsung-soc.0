From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Fri, 27 Jan 2017 12:05:39 +0100
Message-ID: <45f50263-6c5f-bbc6-1e24-a386dbabb496@samsung.com>
References: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115214eucas1p1517ce7ca8fe88e4742a1306630b91d09@eucas1p1.samsung.com>
 <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
 <20170125200631.ubt3x6jhoi367ex6@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54846 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933616AbdA0LF6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 06:05:58 -0500
In-reply-to: <20170125200631.ubt3x6jhoi367ex6@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>

Cc: linux-clk@vger.kernel.org

On 01/25/2017 09:06 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 25, 2017 at 12:51:57PM +0100, Marek Szyprowski wrote:
>> Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
>> phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
>> to setup initial clock configuration for display subsystem in device tree
>> in order to avoid dependency on the configuration left by the bootloader.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
>>  include/dt-bindings/clock/exynos5433.h | 5 ++++-
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Sylwester,
> Could you provide a tag with this?

I have the tag prepared already, but please resend the patch to
linux-clk@vger.kernel.org and I will reply there.
The patches were sent only to the linux-samsung-soc mailing list.

-- 
Thanks,
Sylwester
