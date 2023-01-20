Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A34C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 12:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjATMrV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 07:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjATMrT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 07:47:19 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698DEBF5EE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 04:47:18 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 247845F9A3;
        Fri, 20 Jan 2023 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674218837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0iW4bxpzyfiS1Xr0QYpWy5DrZdVyjcp1783y3lQmmDo=;
        b=yAKQQOYR6pt0roxMHDb3S+MmXAuhZMoYgOK0XOhbi6MLgomsD6UNHdG2eUh8GurpGqgyUj
        Mtxdy4MH8jHyk+cvvE27k1V4Q0jh2Q9/lnIXgkJjd5C/BqdahdWrvS/rBOv++2/28tUGiz
        EES8nnfhOmwfia5EwfZ5ertENgVdKJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674218837;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0iW4bxpzyfiS1Xr0QYpWy5DrZdVyjcp1783y3lQmmDo=;
        b=xsRcwalk8p6OwQXfqj+SepPKeMeXtbwlj9SWOz+6bmKdSqxZ37/akPKAOrD1KTKj4WmFgs
        i5Cio4O0kC6J00Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA1821390C;
        Fri, 20 Jan 2023 12:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6vy/N1SNymN7JAAAMHmgww
        (envelope-from <jroedel@suse.de>); Fri, 20 Jan 2023 12:47:16 +0000
Date:   Fri, 20 Jan 2023 13:47:15 +0100
From:   Joerg Roedel <jroedel@suse.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        m.szyprowski@samsung.com, semen.protsenko@linaro.org
Subject: Re: [PATCH] iommu/exynos: fix error handling in exynos_iommu_init()
Message-ID: <Y8qNU6e4DbXVCC68@suse.de>
References: <20230104095702.2591122-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104095702.2591122-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 04, 2023 at 05:57:02PM +0800, Yang Yingliang wrote:
>  drivers/iommu/exynos-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Jörg Rödel
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstraße 146
90461 Nürnberg
Germany

(HRB 36809, AG Nürnberg)
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman

