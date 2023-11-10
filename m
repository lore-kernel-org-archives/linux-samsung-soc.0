Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C14C04A95
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Nov 2023 18:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbjKJSRR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Nov 2023 13:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344241AbjKJSPF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Nov 2023 13:15:05 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810372508D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Nov 2023 01:46:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id AA5AF1F8BF;
        Fri, 10 Nov 2023 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699609577;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PHskcJcFPTAMyBmHI9A+Yv0ZfYGzZceRpCpqtUErK9Q=;
        b=x0yxmpAwAlZMpQ+dOADDcTV1Rf5F0WxPgnEp1eH3bdYyrKjtR4+v6UXyBD3mnH3O7ulLlv
        2w9n6501aVUKDUQvu1vwegWDA1RQNzpLa6ii95JpY1cP58c5Qge9ISt8O3scsIV+LVUB/H
        iK7sN8o7Dsxe2uAUkK/vgEHCd1s5/Es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699609577;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PHskcJcFPTAMyBmHI9A+Yv0ZfYGzZceRpCpqtUErK9Q=;
        b=MKo4TZFvfOsoJTcmbZTuZ+Vfs1gT+1E5Q8BmpLh6eXz4sgUGKCZwEm3JOjfB1uR1etQdt4
        AG0AJAK4/02fL3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73B91138FC;
        Fri, 10 Nov 2023 09:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XpcXGen7TWXhTgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 10 Nov 2023 09:46:17 +0000
Date:   Fri, 10 Nov 2023 10:46:15 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/1] samsung: Sort Makefile
Message-ID: <20231110094615.GD1536739@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231108090106.8933-1-pvorel@suse.cz>
 <4d95c252-b992-4214-8cc8-5c98bf07259f@kernel.org>
 <f7dd78c9-2020-4874-a49e-02a782dcb2a4@kernel.org>
 <20231110063456.GB1536739@pevik>
 <058278b4-d959-4c28-9f9e-cffde46dac70@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <058278b4-d959-4c28-9f9e-cffde46dac70@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 10/11/2023 07:34, Petr Vorel wrote:
> > Hi Krzysztof,

> >> On 09/11/2023 17:38, Krzysztof Kozlowski wrote:
> >>> On 08/11/2023 10:01, Petr Vorel wrote:
> >>>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> >>>> ---

> >> You also lack commit msg explaining why doing this.
> > I'm sorry, I thought the reason is obvious - readability.

> > Some Makefiles are tried to be sorted (e.g. drivers/clk/qcom/Makefile),
> > but lots of them are not (drivers/net/Makefile). Anyway, it's up to you (and
> > other maintainers) to judge if it's useful or not. If considered useful, I'll
> > send v2.


> The commit should come with message justifying it. It's also not clear
Sure.

> what do you sort - entries are sorted by Kconfig, but you move
> CONFIG_EXYNOS_5250_COMMON_CLK.

All entries are sorted, i.e. by obj-$() and then by it's entries (items behind +=).

At least CONFIG_EXYNOS_ARM64_COMMON_CLK is not sorted.

But anyway, feel free to reject this idea immediately, it's not worth of such in
depth discussion.

Kind regards,
Petr

> Best regards,
> Krzysztof

