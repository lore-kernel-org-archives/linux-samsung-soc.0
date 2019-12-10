Return-Path: <SRS0=92EP=2A=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308DFC2D0BE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Dec 2019 06:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0516D206E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Dec 2019 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575958174;
	bh=4rDF19OTGhWr2Yz1zu32PLgeh+yNxqh4/GNJ9Sj427g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ahGiJ3qPVFzW7teIGahhaWDqWZQfFBGc73xeesoURrDDqSBVh/4Hvs9MqFhHpYr0L
	 udB62rjRVSajlG0suw2NMLOlZTfsXhLBw8zkJR/lkyJPq4X36qk0fxPjfWfTRXm16Q
	 OsDdQE0+XjVv1Fduxt8nXpReqo1+tmz4+8h7tnqw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfLJGJd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Dec 2019 01:09:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:54546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfLJGJd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 01:09:33 -0500
Received: from localhost (unknown [106.201.45.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBA43206D5;
        Tue, 10 Dec 2019 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575958172;
        bh=4rDF19OTGhWr2Yz1zu32PLgeh+yNxqh4/GNJ9Sj427g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rt9q6vjmgljzO240i4f+vxunERmneKwL8BMDsiVxxdMc67sKv/yFx5gVOynIUhVpb
         UUfaA8QiYCrS9wNEmBbs4ZMSLsRoiJULBsV1B6YYy9S2U9fdiprzbBVoJxVIHtgfc2
         Kaa1yLnY3TVClvhMB4smhcqMuOMTZFgk81LkjFyA=
Date:   Tue, 10 Dec 2019 11:39:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     dmaengine@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] dmaengine: pl330: A few system suspend/resume changes
Message-ID: <20191210060928.GS82508@vkoul-mobl>
References: <20191205143746.24873-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205143746.24873-1-ulf.hansson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05-12-19, 15:37, Ulf Hansson wrote:
> I accidentally stumbled over a couple of things for the system suspend/resume
> support in the pl330 driver, that I thought deserved to be improved. So here
> there are, only compile tested, so far.

Applied both, thanks

-- 
~Vinod
