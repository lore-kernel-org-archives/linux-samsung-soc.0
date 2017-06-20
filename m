From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Use unsigned int for number of
 controller IO mem resources
Date: Tue, 20 Jun 2017 14:11:23 +0200
Message-ID: <9683ed1b-3b8c-e110-20c9-ef86d887a8ac@samsung.com>
References: <CGME20170615163507epcas2p4afd786730362715894d5a178a4ad2040@epcas2p4.samsung.com>
        <20170615163316.6444-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36964 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751130AbdFTMLb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 08:11:31 -0400
In-reply-to: <20170615163316.6444-1-krzk@kernel.org>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/15/2017 06:33 PM, Krzysztof Kozlowski wrote:
> Number of IO memory resources cannot be negative obviously and the
> driver depends silently on this (by iterating from 0 to
> nr_ext_resources+1).  Make this requirement explicit.
> 
> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
