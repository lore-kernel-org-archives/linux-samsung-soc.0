From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Consistently use unsigned instead
 of u32 for nr_banks
Date: Tue, 20 Jun 2017 12:19:20 +0200
Message-ID: <67234130-5861-5c62-8753-69107d0a3990@samsung.com>
References: <20170615163316.6444-1-krzk@kernel.org>
        <CGME20170615163343epcas2p35150e861d333a98fa22384bcffcf1523@epcas2p3.samsung.com>
        <20170615163316.6444-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43116 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751120AbdFTKTm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 06:19:42 -0400
In-reply-to: <20170615163316.6444-2-krzk@kernel.org>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/15/2017 06:33 PM, Krzysztof Kozlowski wrote:
> Unlike for other countable members, the driver used u32 for number of
> banks (nr_banks).  There is no specific need for using fixed-width
> integer in this particular place.  Make it consistent.
> 
> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
