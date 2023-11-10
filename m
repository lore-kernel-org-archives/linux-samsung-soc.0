Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A48C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Nov 2023 19:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbjKJTUg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Nov 2023 14:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346182AbjKJTUS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Nov 2023 14:20:18 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3EA769B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Nov 2023 22:34:59 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id ACD6A2198E;
        Fri, 10 Nov 2023 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699598097;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hSYEUy9F0AlSAaFpGzscfHa1ZG4/Kr7MNhpxVPjjDKo=;
        b=2YElXd0+hIJGwMDsyAW/JgKVKF0fcJQfuMhcPgu/d1L0eIIscJJUZcG6g3JWpQAvGKKfpl
        B89x7u23LzEKAf3eaQf17CQkyFGqEcurWw0xv0JIlXTA+PF2ch9LCIDg2Ok9dRe1AsZQ0T
        mKjvvXmSELInxu6il1PtiGIA9m+Y4xA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699598097;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hSYEUy9F0AlSAaFpGzscfHa1ZG4/Kr7MNhpxVPjjDKo=;
        b=dEm+Tz8sGfClG5f89Gua8n62uETwJ06+DpV8vk5lgRef46wtSEtCTFLPBBd+tmWhjY993p
        rPUrRsP3+EeVrKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BB1F13398;
        Fri, 10 Nov 2023 06:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FyNKIBHPTWWwegAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 10 Nov 2023 06:34:57 +0000
Date:   Fri, 10 Nov 2023 07:34:56 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/1] samsung: Sort Makefile
Message-ID: <20231110063456.GB1536739@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231108090106.8933-1-pvorel@suse.cz>
 <4d95c252-b992-4214-8cc8-5c98bf07259f@kernel.org>
 <f7dd78c9-2020-4874-a49e-02a782dcb2a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7dd78c9-2020-4874-a49e-02a782dcb2a4@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> On 09/11/2023 17:38, Krzysztof Kozlowski wrote:
> > On 08/11/2023 10:01, Petr Vorel wrote:
> >> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> >> ---

> You also lack commit msg explaining why doing this.
I'm sorry, I thought the reason is obvious - readability.

Some Makefiles are tried to be sorted (e.g. drivers/clk/qcom/Makefile),
but lots of them are not (drivers/net/Makefile). Anyway, it's up to you (and
other maintainers) to judge if it's useful or not. If considered useful, I'll
send v2.

> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.

Ah, I'm sorry.  I did this actually (do that each time I send patch for kernel),
but I somehow overlooked "clk: ".

Kind regards,
Petr

> Best regards,
> Krzysztof

