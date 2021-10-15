Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B2BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 15:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB65D611F0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 15:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhJOPLW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 11:11:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237257AbhJOPLW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 11:11:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 492BF61056;
        Fri, 15 Oct 2021 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634310555;
        bh=vemMaujZS0eEhi2E4iV1vo1T0qqzoJ2xCHNgtkE3Y64=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dA0W2T3UDOHvFucllLOmixcicpvkR6Ll9p4DeaFhkMTSJ32NXTwH3rfFDfZbd238c
         +27zU0Eg8pdztd45eoyAXtWG3N5pHYkIVWbKIeiJldIWV+eejqh54ndqpqdrIdpiph
         bXdv4HXUKZw7E/vW70aiOfsiD49YXUBVNnM3RwiRR9KD2orJv2TzaSllj7kUMxI97+
         uFdhlQWG5QNiODzMg6aEYbPgxPCTql66SPfeUYmPccofDuy7zTiySuhzeFwM04GUrj
         oGRJj4JNNjjl9On3hF+YxRkT4nSKg8KLa73HIj4H8eSxTIgRbNeAtuk7Vb8MQSiYKt
         gzduhwIkpdOtQ==
Subject: Re: [PATCH v4 2/2] [RFT] clk: samsung: exynos5433: update apollo and
 atlas clock probing
To:     Will McVicker <willmcvicker@google.com>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20211014195347.3635601-1-willmcvicker@google.com>
 <20211014195347.3635601-3-willmcvicker@google.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <e51c3d95-11fb-7e6d-101c-33a585157a69@kernel.org>
Date:   Fri, 15 Oct 2021 17:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-3-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 21:53, Will McVicker wrote:
> Use the samsung common clk driver to initialize the apollo and atlas
> clocks. This removes their custom init functions and uses the
> samsung_cmu_register_one() instead.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>

Patch applied, thank you.

