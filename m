From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 2/7] clk: samsung: Add definitions of some audio
 related clocks
Date: Thu, 08 Jun 2017 12:00:58 +0200
Message-ID: <8c6685fb-e9a2-5c69-722e-8ef1a2e800ff@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172023epcas1p3dd7397c8c61daa548ffac88a76e53113@epcas1p3.samsung.com>
        <1492795191-31298-3-git-send-email-s.nawrocki@samsung.com>
        <20170422152705.mvnycub4unjlseeq@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57121 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbdFHKBL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 06:01:11 -0400
In-reply-to: <20170422152705.mvnycub4unjlseeq@kozik-lap>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jy0922.shim@samsung.com, b.zolnierkie@samsung.com

On 04/22/2017 05:27 PM, Krzysztof Kozlowski wrote:
>>   	MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
>>   			mout_mx_mspll_ccore_p, SRC_TOP7, 16, 2),
>> -	MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p, SRC_TOP7,
>> -			20, 2),
>> +	MUX(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
>> +							SRC_TOP7, 20, 2),
 >
> How about not changing the indention level of new line? On the other
> hand, if you want to change it so maybe align it with opening
> parenthesis?

Thanks for your review.  I wrote it this way to keep it consistent with 
remaining entries of the exynos5800_mux_clks[] array.  I think it's less
mess this way, otherwise we would need to make more dubious whitespace
changes to keep the indentation consistent.

-- 
Thanks,
Sylwester
