Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC6CC4167D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Nov 2023 18:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345930AbjKJS1i (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Nov 2023 13:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346548AbjKJS06 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Nov 2023 13:26:58 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAE36FA1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Nov 2023 22:25:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5DEDE1F8BB;
        Fri, 10 Nov 2023 06:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699597525;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VTPdke0tc9K60Z4DCxHlmo71And4MSPn4ZIQD057L9E=;
        b=mczFEJnCPLbZ0maFZiAz5ETwpVbSdRxvI9/6yiSt8I8zQy3GSWDAL1CozYMDDztBR9nDoR
        aVDsS0lq6lv9b2QvkWGNhqnHwuMvN3HbhRuC/iFpCRkrHv3ITovIbtcTVNKtvQtNsE7six
        yes9tWvvUKtUU69inQF3Ux9EfZD/x08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699597525;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VTPdke0tc9K60Z4DCxHlmo71And4MSPn4ZIQD057L9E=;
        b=mbDKTBm0i0MsBTZkxujtt+lRWMAHJTQvLWUDX8Rq5G7+SEyOp/HejcvVDI+Kb3fMPJbYTH
        txEC4VSo2Sm1LhBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4582613398;
        Fri, 10 Nov 2023 06:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UfjBD9XMTWXQdgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Fri, 10 Nov 2023 06:25:25 +0000
Date:   Fri, 10 Nov 2023 07:25:23 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/1] samsung: Sort Makefile
Message-ID: <20231110062523.GA1536739@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20231108090106.8933-1-pvorel@suse.cz>
 <4d95c252-b992-4214-8cc8-5c98bf07259f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d95c252-b992-4214-8cc8-5c98bf07259f@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> On 08/11/2023 10:01, Petr Vorel wrote:
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  drivers/clk/samsung/Makefile | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)

> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

Sure, I'll do next time.

Kind regards,
Petr

> Best regards,
> Krzysztof

