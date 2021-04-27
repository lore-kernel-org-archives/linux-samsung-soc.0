Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89EAC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Apr 2021 10:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4654613C6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Apr 2021 10:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbhD0LA3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:00:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230365AbhD0LA3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 07:00:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62E166112F;
        Tue, 27 Apr 2021 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619521186;
        bh=Xu8yXTNTdsGCIO+l+ExBtuapFY7i/dpS3ImNxVf+HGY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CUK0fGcHEhy+5ocazwb3eIFVzBs0TWdr0PYwFHtSYyhZotC/ytZcSVml7oUETcSJu
         R0i3uOSQKgeDtsmP/h0xvy7U+Fs2Yun8g2Qc2I5k9e0O7/TSM0hUReukg+7Dy+5kfi
         wLCYrfopyaqid5krcRrlDXSkHaGIi8+fUptdeQIocg6yFBmCuTaeEa07NX7sh96qty
         RkUb0mW23oQDvwKqimiUMhCI64KIy4rvS/GBIsPWUc3xrhCS0HvKWeB8iWjHC4aVcN
         4zVpUZEHGDkJBxH3mfedcAgdohamC6oeosqSPb1AcBeqOe0ZIaMfK+biCwcqm+bT27
         3VcotZh7cB/yg==
Subject: Re: [PATCH v3 71/79] media: s3c-camif: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <a002bcaa2096cac125469b0188e5967d0e1892a0.1619519080.git.mchehab+huawei@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <0b394ffa-e201-6f49-22c6-eac40a9e034c@kernel.org>
Date:   Tue, 27 Apr 2021 12:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a002bcaa2096cac125469b0188e5967d0e1892a0.1619519080.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27.04.2021 12:27, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
