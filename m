Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52DEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Nov 2021 21:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhKSV7l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 19 Nov 2021 16:59:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:47366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhKSV7k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 16:59:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81F2E61B1E;
        Fri, 19 Nov 2021 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637358998;
        bh=/ckSddC0HJT/sBrrDYBGBFuGJGx07y2DEB9xbXT+e6k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=guxoZTIHy21mh0NAcoupa3H2qJXW9K5zJt4HOyG8P7taI8HVYE+LxWG4f+P5sWlQB
         KMBucRUg0BuAkRh9nUPKAjZpyvYALUH86ixA5EHFgXoP8cbJKvAzmwoOELR5W8dNWN
         am82Va4FYYBMB7YM60Bhre6FAU0cZPB4eVSDmgvyW8zkDxxvJspQgJXIJ6MeMqEzpz
         yEN6G+GT7UeOal97sZOlQAn512MdHrfI3b1/4tuTzbGuzhcWbF3eVFJ+EfgiQKSsdv
         ojCzaN3ItNFXvs8SadJnx0yc6SAiAo+b7RWQMT1EbCcFkQd8zd6VxyJrf089/e01EO
         0LKYo8v7IxNNg==
Subject: Re: [PATCH v1] clk: samsung: update CPU clk registration
To:     Will McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20211015190515.3760577-1-willmcvicker@google.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <814f3c16-0cc6-f256-f9a8-4678469be2d6@kernel.org>
Date:   Fri, 19 Nov 2021 22:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211015190515.3760577-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15.10.2021 21:05, Will McVicker wrote:
> Convert the remaining exynos clock drivers to use
> samsung_clk_register_cpu() or if possible use
> samsung_cmu_register_one(). With this we can now make
> exynos_register_cpu_clock() a static function so that future CPU clock
> registration changes will use the samsung common clock driver.
> 
> The main benefit of this change is that it standardizes the CPU clock
> registration for the samsung clock drivers.
> 
> Signed-off-by: Will McVicker<willmcvicker@google.com>

Thank you for working on this, patch applied to clk/samsung for-next.
Thanks Krzysztof for review and testing.

Regards,
Sylwester
