Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9943EC04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Aug 2023 00:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjHCA7p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Aug 2023 20:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjHCA7o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 20:59:44 -0400
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16C4CC
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Aug 2023 17:59:42 -0700 (PDT)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.1.219])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 7EBC924F6C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Aug 2023 20:11:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6cqtb (unknown [10.110.171.144])
        by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BEA6D1FD73;
        Wed,  2 Aug 2023 20:11:50 +0000 (UTC)
Received: from etezian.org ([37.59.142.105])
        by ghost-submission-6684bf9d7b-6cqtb with ESMTPSA
        id SgH5Koa4ymSYJQAAgyrAAA
        (envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:11:50 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006804341e4-daf0-46ff-a296-e082e55f34d6,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH -next] i2c: s3c2410: Remove redundant dev_err()
Date:   Wed,  2 Aug 2023 22:10:35 +0200
Message-Id: <169100562768.1919254.7407243487471763166.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726174226.2480552-1-ruanjinjie@huawei.com>
References: <20230726174226.2480552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13296877901830949447
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On Wed, 26 Jul 2023 17:42:26 +0000, Ruan Jinjie wrote:
> There is no need to call the dev_err() function directly to print a custom
> message when handling an error from platform_get_irq() function as
> it is going to display an appropriate error message in case of a failure.
> 
> 

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: s3c2410: Remove redundant dev_err()
      commit: c0e109161aad5d543145d79921d1a577c8fa2eee
